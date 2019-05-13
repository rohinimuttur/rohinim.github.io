from flask import Flask,render_template,request,redirect
from flask_sqlalchemy import SQLAlchemy
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func,text
from sqlalchemy import Column, Integer, String, Float
from sqlalchemy.sql import update, table, column, select, text
import urllib

app = Flask(__name__)

params = urllib.parse.quote_plus("DRIVER={SQL Server Native Client 11.0};"
                                 "SERVER=PEPWDS01340\SQLITGECMETA1T, 60108;"
                                 "DATABASE=MDM;"
                                 "Trusted_Connection=yes")
engine = create_engine("mssql+pyodbc:///?odbc_connect={}".format(params))
session = Session(engine)
app.config["SQLALCHEMY_DATABASE_URI"] ="mssql+pyodbc:///?odbc_connect=%s" % params
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db = SQLAlchemy(app)
db.Model.metadata.reflect(db.engine)

Base = automap_base()
Base.prepare(engine, reflect=True)
session = Session(engine)
mdmasin=Base.classes.MDM_ASIN

@app.route("/", methods=["GET", "POST"])
def home():
    if request.form:
        print(request.form)   
    # bu_val = request.form.get('bu_select')
    # print(bu_val)
    # return render_template("index.html",bu_val=bu_val)
    return render_template("index.html")

@app.route("/fetch")
def queryall():
    asins=session.execute("select top 10 * from MDM_ASIN")
    return render_template("update.html", asins=asins)

@app.route("/display_update",methods=["GET","POST"])
def display_update():   
    ASINVal = request.form.get("ASIN123")
    ASIN_NameVal=request.form.get("ASINName123") 
    bu_val=request.form.get("BU123")
    sub_bu_val=request.form.get("SubBU123")
    pep_brand_val=request.form.get("PepsiBrand123")
    brnd_src_val=request.form.get("BrandSource123")
    stmt=text("select ASIN,ASIN_Name,BU,SubBU,PepsiBrand,BrandSource from MDM_ASIN where ASIN=:val1 and ASIN_Name=:val2 and BU=:val3 and SubBU=:val4 and PepsiBrand=:val5 and BrandSource=:val6")
    asins=session.execute(stmt,{'val1':ASINVal,'val2':ASIN_NameVal,'val3':bu_val,'val4':sub_bu_val,'val5':pep_brand_val,'val6':brnd_src_val})
    print(stmt)
    print(f"ASIN : {ASINVal}  ASIN NAme : {ASIN_NameVal}  BU :  {bu_val}  SubBU : {sub_bu_val}   Pep Brand : {pep_brand_val}  Brand SRc : {brnd_src_val}")

    print(asins)
    # session.commit()
    # session.close()
    
    return render_template("DisplayToUpdate.html", asins=asins)



@app.route("/update",methods=["GET","POST"])
def updaterec():   
    print("I am here to UPDATE!!!!!!!")
    ASINVal = request.form.get("ASIN123")
    ASIN_NameVal=request.form.get("ASINName123")
    bu_val=request.form.get("BU123")
    sub_bu_val=request.form.get("SubBU123")
    pep_brand_val=request.form.get("PepsiBrand123")
    brnd_src_val=request.form.get("BrandSource123")
    stmt=text("""update MDM_ASIN set ASIN_Name=:val2 where ASIN=:val1 and BU=:val3 and SubBU=:val4 and PepsiBrand=:val5 and BrandSource=:val6""")
    session.execute(stmt,{'val1':ASINVal,'val2':ASIN_NameVal,'val3':bu_val,'val4':sub_bu_val,'val5':pep_brand_val,'val6':brnd_src_val})
    print(f" THE UPDATE ::ASIN : {ASINVal}  ASIN NAme : {ASIN_NameVal}  BU :  {bu_val}  SubBU : {sub_bu_val}   Pep Brand : {pep_brand_val}  Brand SRc : {brnd_src_val}")  
    session.commit()
    session.close()
    return render_template("index.html")

@app.route("/searchPRODUCT",methods=["GET", "POST"])
def searchPRODUCT(): 
    # storing form inputs into local variables
    bu_val=request.form.get('bu','Select...')
    sub_bu_val=request.form.get('subbu','Select...')
    prod_name_val=request.form.get('productname','Enter...')
    filter_name=f'%{prod_name_val}%'

    #check if the "Search ASIN" button is clicked
    if 'asin_button' in request.form:
        print("Came to ASINS")
        # case statements to identify what form inputs are provided to lookup ASINS
        if sub_bu_val == 'Select...' and bu_val != 'Select...' and prod_name_val !='Enter...':
            print("Only BU")
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_asin=text("""select ASIN,ASIN_Name,BU,SubBU,PepsiBrand,BrandSource from MDM_ASIN where BU=:val1 and ASIN_Name like :val3 """)
            asins=session.execute(stmt_asin,{'val1':bu_val,'val3':filter_name}) 
            print(stmt_asin)
        elif bu_val == 'Select...' and sub_bu_val != 'Select...'and prod_name_val !='Enter...':
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_asin=text("""select ASIN,ASIN_Name,BU,SubBU,PepsiBrand,BrandSource from MDM_ASIN where  SubBU=:val2 and ASIN_Name like :val3""")
            asins=session.execute(stmt_asin,{'val2':sub_bu_val,'val3':filter_name}) 
            print(stmt_asin)
        elif bu_val == 'Select...' and sub_bu_val == 'Select...' and prod_name_val !='Enter...':
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_asin=text("""select ASIN,ASIN_Name,BU,SubBU,PepsiBrand,BrandSource from MDM_ASIN where ASIN_Name like :val3""")
            asins=session.execute(stmt_asin,{'val3':filter_name}) 
            print(stmt_asin)

        elif bu_val != 'Select...' and sub_bu_val != 'Select...' and prod_name_val =='Enter...':
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_asin=text("""select ASIN,ASIN_Name,BU,SubBU,PepsiBrand,BrandSource from MDM_ASIN where BU=:val1 and SubBU=:val2 """)
            asins=session.execute(stmt_asin,{'val1':bu_val,'val2':sub_bu_val}) 
            print(stmt_asin)
        else:
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_asin=text("""select ASIN,ASIN_Name,BU,SubBU,PepsiBrand,BrandSource from MDM_ASIN where BU=:val1 and SubBU=:val2 and ASIN_Name like :val3""")
            asins=session.execute(stmt_asin,{'val1':bu_val,'val2':sub_bu_val,'val3':filter_name}) 
            print(stmt_asin)
        return render_template("searchASIN.html",asins=asins)

    #check  if the "Search UPC" button is clicked
    else:
        print("Came to UPCS")   
        # case statements to identify what form inputs are provided to lookup UPCs     
        if sub_bu_val == 'Select...' and bu_val != 'Select...' and prod_name_val !='Enter...':
            print("Only BU")
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_upc=text("""select UPC,UPCName,BU,SubBU,PepsiBrand,BrandSource from MDM_UPC where BU=:val1 and UPCName like :val3""")
            upcs=session.execute(stmt_upc,{'val1':bu_val,'val3':filter_name}) 
            print(stmt_upc)
        elif bu_val == 'Select...' and sub_bu_val != 'Select...'and prod_name_val !='Enter...':
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_upc=text("""select UPC,UPCName,BU,SubBU,PepsiBrand,BrandSource from MDM_UPC where  SubBU=:val2 and UPCName like :val3""")
            upcs=session.execute(stmt_upc,{'val2':sub_bu_val,'val3':filter_name}) 
            print(stmt_upc)
        elif bu_val == 'Select...' and sub_bu_val == 'Select...' and prod_name_val !='Enter...':
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_upc=text("""select UPC,UPCName,BU,SubBU,PepsiBrand,BrandSource from MDM_UPC where  UPCName like :val3""")
            upcs=session.execute(stmt_upc,{'val3':filter_name}) 
            print(stmt_upc)
        elif bu_val != 'Select...' and sub_bu_val != 'Select...' and prod_name_val =='Enter...':
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_upc=text("""select UPC,UPCName,BU,SubBU,PepsiBrand,BrandSource from MDM_UPC where where BU=:val1 and SubBU=:val2""")
            upcs=session.execute(stmt_upc,{'val1':bu_val,'val2':sub_bu_val}) 
            print(stmt_upc)
        else:
            print(bu_val)
            print(sub_bu_val)
            print(prod_name_val)
            stmt_upc=text("""select UPC,UPCName,BU,SubBU,PepsiBrand,BrandSource from MDM_UPC where BU=:val1 and SubBU=:val2 and UPCName like :val3""")
            upcs=session.execute(stmt_upc,{'val1':bu_val,'val2':sub_bu_val,'val3':filter_name}) 
            print(stmt_upc)
        
        return render_template("searchUPC.html",upcs=upcs)   

        
    

    


# @app.route("/searchUPC",methods=["GET", "POST"])
# def searchUPC(): 
#     bu_val=request.form['bu']
#     sub_bu_val=request.form['subbu']    
#     stmt=text("""select top 20 * from MDM_UPC where BU=:val1 and SubBU=:val2""")
#     upcs=session.execute(stmt,{'val1':bu_val,'val2':sub_bu_val}) 
#     print(stmt)

#     return render_template("searchUPC.html",upcs=upcs)
    
    
    


  
if __name__ == "__main__":
    # import logging
    # logging.basicConfig(filename='error.log',level=logging.DEBUG)

    app.run('pepwul151435',debug=True)