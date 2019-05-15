from flask import Flask
from flask import render_template
from pymongo import MongoClient
import json
from bson import json_util
from bson.json_util import dumps

app = Flask(__name__)

MONGODB_HOST = 'localhost'
MONGODB_PORT = 27017
DBS_NAME = 'citibike'
COLLECTION_NAME = 'bikeinfo'
FIELDS = {'tripduration': True, 'starttime': True, 'stoptime': True, 'start_station_id': True, 'start_station_name': True,'start_station_latitude':True,
           'start_station_longitude':True,'end_station_id':True,'end_station_name':True,'end_station_latitude':True,'end_station_longitude':True,
           'bikeid':True,'usertype':True,'birth_year':True,'gender':True,'_id': False}


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/donorschoose/projects")
def donorschoose_projects():
    connection = MongoClient(MONGODB_HOST, MONGODB_PORT)
    collection = connection[DBS_NAME][COLLECTION_NAME]
    projects = collection.find(projection=FIELDS, limit=100000)
    #projects = collection.find(projection=FIELDS)
    json_projects = []
    for project in projects:
        json_projects.append(project)
    json_projects = json.dumps(json_projects, default=json_util.default)
    connection.close()
    return json_projects

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5000,debug=True)