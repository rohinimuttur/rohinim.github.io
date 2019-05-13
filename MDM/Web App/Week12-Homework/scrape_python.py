from splinter import Browser
from bs4 import BeautifulSoup
import pymongo
import requests
import pandas as pd
import time


def init_browser():
    chrome_location = "chromedriver.exe"    
    executable_path = {"executable_path":chrome_location}
    
    return Browser("chrome", **executable_path, headless=False)

def get_soup_object(url):
    browser = init_browser()
    browser.visit(url)
    soup = BeautifulSoup(browser.html,"html.parser")
    return soup

def get_MARS_news():
    titles=[]
    paras=[]
    url='https://mars.nasa.gov/news/?page=0&per_page=40&order=publish_date+desc%2Ccreated_at+desc&search=&category=19%2C165%2C184%2C204&blank_scope=Latest'
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'lxml')
    results = soup.find_all('div', class_='content_title')
    res_para=soup.find_all('div', class_='image_and_description_container')
    
    #Scraping news title
    for r in results:
        title=r.find('a').text.strip()
        titles.append(title)
    news_title=titles[0]
    
    #SCraping news paragraph    
    for p in res_para:
        para=p.find('a').text.strip()
        paras.append(para)
    news_para=paras[0]
    news_dict={"title":news_title,"para":news_para}
    return(news_dict)

def get_MARS_image():
    scrape_url='https://www.jpl.nasa.gov/spaceimages/?search=&category=Mars'
    browser = init_browser()
    browser.visit(scrape_url)
    html = browser.html
    soup_scrape = BeautifulSoup(html, 'html.parser')
    for x in range(50):
        html = browser.html
    # Parse HTML with Beautiful Soup
        soup_scrape = BeautifulSoup(html, 'html.parser')
        images1=soup_scrape.find_all('a',class_='fancybox')[1]['data-fancybox-href']
    
    try:
        browser.click_link_by_partial_text('MORE')
          
    except:
        print("Scraping Complete")
    featured_image_url=scrape_url[0:24]+images1
    return(featured_image_url)

def get_MARS_temperature():
    twitter_report_url = "https://twitter.com/marswxreport?lang=en"
    temp_soup = get_soup_object(twitter_report_url)
    return temp_soup.find("ol",{"id":"stream-items-id"}).find("li").find("p").text



def get_MARS_facts():
    df = pd.read_html("https://space-facts.com/mars/")[0]
    df = df.rename(columns={0:"Description",1:"Value"})
    df=df.set_index('Description')
    df = df.to_html()
    df = df.replace('\n', '')
    return df



def get_MARS_hemisphere_data():
    browser = init_browser()
    hemispheres_url = "https://astrogeology.usgs.gov/search/results?q=hemisphere+enhanced&k1=target&v1=Mars"
    browser.visit(hemispheres_url)
    hms_soup = BeautifulSoup(browser.html,"html.parser")
    items = hms_soup.find("div",{"id":"product-section"}).find_all("div",{"class":"item"})

    hemisphere_data = []

    for item in items:
        img_main_url = "https://astrogeology.usgs.gov"+item.find("a")["href"]
        img_title = item.find("div",{"class":"description"}).find("a").find("h3").text
        browser.visit(img_main_url)
        time.sleep(1)
        img_soup = BeautifulSoup(browser.html,"html.parser")
        download_item = img_soup.find("div",{"class":"downloads"})
        hemisphere_item = {
            "title":img_title,
            "img_url": download_item.find("li").find("a")["href"]
        }
        hemisphere_data.append(hemisphere_item)
        
    return hemisphere_data



def scrape(): 
    mars_results={}
    mars_results["news_title"]=get_MARS_news()['title']
    mars_results['news_p']=get_MARS_news()['para']
    mars_results['featured_img_url']=get_MARS_image()
    mars_results["facts_html_table"] = get_MARS_facts()
    mars_results["mars_weather"] = get_MARS_temperature().replace('\n','')
    mars_results['hemisphere_image_urls'] = get_MARS_hemisphere_data()
    return mars_results
   
