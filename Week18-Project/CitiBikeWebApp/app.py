import pandas as pd
#from shapely.geometry import Point, shape

from flask import Flask,render_template,request,redirect
from pymongo import MongoClient
import json
from bson import json_util
from bson.json_util import dumps
from flask_pymongo import PyMongo
import json


MONGODB_HOST = 'localhost'
MONGODB_PORT = 27017
DBS_NAME = 'citibike'
COLLECTION_NAME = 'bikeinfo'
FIELDS = {'tripduration': True, 'starttime': True, 'stoptime': True, 'start station id': True, 'start station name': True,'start station latitude':True,
           'start station longitude':True ,'end station id':True,'end station name':True,'end station latitude':True,'end station longitude':True,
           'bikeid':True,'usertype':True,'birth year':True,'gender':True,'lat_dist':True,'lon_dist':True,'lat_miles':True,'lon_miles':True,'totaldistance':True,
           'Speed':True,'date':True,'Time_day':True,'age':True,'weight':True,'calories_burned':True,'_id': False}


app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/data")
def get_data():
    # Code from the previous section: Data preparation
    dfnew=pd.read_csv('input/sample1.csv')
    dfnew=dfnew.dropna()
    dfnew['birth year']=dfnew['birth year'].astype(int)
    dfnew['yearofride']=dfnew.date.str[:7]
    dfnew.loc[dfnew['gender'] == 1, 'gender'] = 'Male'
    dfnew.loc[dfnew['gender'] == 2, 'gender'] = 'Female'
    dfnew.loc[dfnew['gender'] == 0, 'gender'] = 'Other'    
    return dfnew.to_json(orient='records')
    


     
 
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)