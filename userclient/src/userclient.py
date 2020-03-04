import requests
from flask import Flask
from flask import render_template
from flask import request, Response

app = Flask(__name__)

@app.route("/home", methods=["GET","POST"])
def home_page():
	return render_template("home.html")

if __name__ == '__main__':
	app.run(host='0.0.0.0',port='4000',debug=True)