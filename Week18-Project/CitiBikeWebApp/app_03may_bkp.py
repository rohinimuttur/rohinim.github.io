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
app.config["SQLALCHEMY_TRACK_MODIFICATION"] = False
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
    return render_template("index.html")

@app.route("/fetch")
def queryall():
    asins=session.execute("select top 10 * from MDM_ASIN")
    return render_template("update.html", asins=asins)

@app.route("/update",methods=["POST"])
def updaterec():   
    ASINVal = request.form.get("ASIN")
    ASIN_NameVal=request.form.get("ASIN_Name")

    stmt=text("""update MDM_ASIN set ASIN_Name=:val1 where ASIN=:val2""")
    session.execute(stmt,{'val1':ASIN_NameVal,'val2':ASINVal})
   
    session.commit()
    session.close()
    return redirect("/fetch")
    
    # return render_template("index.html", asins=asins)
    
    
    


  
if __name__ == "__main__":
    app.run('pepwul151435',debug=True)