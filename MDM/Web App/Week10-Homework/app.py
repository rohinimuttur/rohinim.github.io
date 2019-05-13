from flask import Flask, jsonify
import numpy as np

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
import pandas as pd


app = Flask(__name__)

engine = create_engine("sqlite:///Resources/hawaii.sqlite",connect_args={'check_same_thread': False})

Base = automap_base()
Base.prepare(engine, reflect=True)
Measurement = Base.classes.measurement
Station = Base.classes.station
session = Session(engine)

@app.route("/")
def welcome():
    return (
        f"Welcome to the Weather API!<br/>"
        f"Available Routes:<br/>"
        f"/api/v1.0/precipitation<br/>"
        f"/api/v1.0/stations<br/>"
        f"/api/v1.0/tobs<br/>"
        f"/api/v1.0/start/2016-12-25<br/>"
        f"/api/v1.0/start-end/2016-09-01/2017-04-01"
    )

@app.route("/api/v1.0/stations")
def ret_stations():
    """Return a list of all station names"""   
    results=pd.read_sql('Select distinct station from Station',session.bind)   
    results.dropna(inplace=True)
    return jsonify(results.to_dict())

@app.route("/api/v1.0/precipitation")
def ret_prcp():
    """Return a list of precipitation values"""   
    df2=pd.read_sql("select date,prcp as precipitation from Measurement where date between '2016-08-24'and '2017-08-23' order by date ",session.bind)  
    #df2['date'] =  pd.to_datetime(df2['date'])
    df2=df2.set_index('date')
    df2.dropna(inplace=True)
    return jsonify(df2.to_dict())

@app.route("/api/v1.0/tobs")
def ret_tobs():
    """Return a list of precipitation values"""   
    df2=pd.read_sql("select date,tobs as `Temp Observation Values` from Measurement where date between '2016-08-24'and '2017-08-23' order by date ",session.bind)  
    #df2['date'] =  pd.to_datetime(df2['date'])
    df2=df2.set_index('date')
    df2.dropna(inplace=True)
    return jsonify(df2.to_dict())

@app.route("/api/v1.0/start/<start_date>")
def ret_start_date(start_date):      
    df2=pd.read_sql(f"select min(tobs) as TMIN,max(tobs) as TMAX,avg(tobs) as TAVG from measurement where date>='{start_date}'",session.bind)     
    return jsonify(df2.to_dict())

@app.route("/api/v1.0/start-end/<start_date>/<end_date>")
def ret_start_date_end_date(start_date,end_date):      
    df2=pd.read_sql(f"select min(tobs) as TMIN,max(tobs) as TMAX,avg(tobs) as TAVG from measurement where date>='{start_date}' and date<='{end_date}'",session.bind)     
    return jsonify(df2.to_dict())

if __name__ == "__main__":
    app.run(debug=True)
