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


def get_MARS_temperature():
    twitter_report_url = "https://twitter.com/marswxreport?lang=en"
    temp_soup = get_soup_object(twitter_report_url)
    return temp_soup.find("ol",{"id":"stream-items-id"}).find("li").find("p").text

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
    mars_facts = get_MARS_facts()
    mars_temp = get_MARS_temperature()
    mars_hm_data = get_MARS_hemisphere_data()
    return {        
        "facts":mars_facts,
        "temperature":mars_temp,
        "hemisphere_data":mars_hm_data
    }

scrape()