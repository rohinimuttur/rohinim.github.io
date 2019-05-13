from flask import Flask, render_template 
#from FlaskWebProject7  
import app  
  
import pyodbc  
  
from datetime import datetime  
  
from flask import render_template, redirect, request  
 
app = Flask(__name__)
 
# creating connection Object which will contain SQL Server Connection  
connection = pyodbc.connect("Driver={SQL Server Native Client 11.0};"
                      "Server=PEPWDS01340\SQLITGECMETA1T, 60108;"
                      "Database=MDM;"
                      "Trusted_Connection=yes;")
  
cursor = connection.cursor()  
cursor.execute("SELECT * FROM MDM_ASIN;")  
s = "<table style='border:1px solid red'>"  
for row in cursor:  
    s = s + "<tr>"  
for x in row:  
    s = s + "<td>" + str(x) + "</td>"  
s = s + "</tr>"  
  
  
connection.close()  
  
@app.route('/')  
def index():
    print("Hello")
@app.route('/home')  
def home():  
  
    return "<html><body>" + s + "</body></html>"  

if __name__ == "__main__":
    app.run(debug=True)