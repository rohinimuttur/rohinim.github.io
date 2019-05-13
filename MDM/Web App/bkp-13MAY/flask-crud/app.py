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

@app.route("/searchASIN",methods=["GET", "POST"])
def searchASIN(): 
    bu_val=request.form['bu']
    sub_bu_val=request.form['subbu']
    # bu_val = 'Beverages'
    # sub_bu_val='PBC'
    stmt=text("""select top 20 * from MDM_ASIN where BU=:val1 and SubBU=:val2""")
    asins=session.execute(stmt,{'val1':bu_val,'val2':sub_bu_val}) 
    print(stmt)
    return render_template("searchASIN.html",asins=asins)
    
    
    


  
if __name__ == "__main__":
    # import logging
    # logging.basicConfig(filename='error.log',level=logging.DEBUG)

    app.run('pepwul151435',debug=True)