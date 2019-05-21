import pandas as pd
#from shapely.geometry import Point, shape

from flask import Flask
from flask import render_template
import json

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
    #dfnew=dfnew.sort_values(by=['start_station_latitude'],ascending=[True])
    #unique_values = dfnew['start station name'].unique()
    return dfnew.to_json(orient='records')
    
  
 
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)