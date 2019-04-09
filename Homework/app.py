from flask import Flask, render_template
import pymongo

app = Flask(__name__)

# setup mongo connection
conn = "mongodb://localhost:27017"
client = pymongo.MongoClient(conn)

# connect to mongo db and collection
db = client.mars_db
mars_table = db.mars_table


@app.route("/")
def index():
    # write a statement that finds all the items in the db and sets it to a variable
    mars_render = list(db.mars_table.find())
    print(mars_render)

    # render an index.html template and pass it the data you retrieved from the database
    return render_template("index.html", inventory=mars_table)

@app.route("/scrape")
def scrape():

    # Run the scrape function
    mars_data = scrape_python.scrape()

    # Update the Mongo database using update and upsert=True
    db.mars_table.update({}, mars_data, upsert=True)

    # Redirect back to home page
    return redirect("/")

if __name__ == "__main__":
    app.run(debug=True)
