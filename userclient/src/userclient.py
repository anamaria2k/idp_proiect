import requests
from flask import Flask
from flask import render_template
from flask import request, Response

app = Flask(__name__)

@app.route("/home", methods=["GET","POST"])
def home_page():
	return render_template("home.html")

@app.route("/products", methods=["GET"])
def products_page():
	return render_template("products.html")

@app.route("/register", methods=["GET"])
def register_page_get():
	return render_template("register.html")

@app.route("/register", methods=["POST"])
def register_page_post():

	return render_template("register.html", message=message)

@app.route("/login", methods=["GET"])
def login_page_get():
	return render_template("login.html")

@app.route("/login", methods=["POST"])
def login_page_post():
	return render_template("login.html")


@app.route("/logout", methods=["GET"])
def logout_page():
	return render_template("home.html")

@app.route("/cart", methods=["GET"])
def cart_page_get():
	total_price = 0
	return render_template("cart.html", total_price=total_price)

@app.route("/currentCart", methods=["POST"])
def add_products():
	return render_template("cart.html")

@app.route("/endCart", methods=["POST"])
def cart_finish():
	return render_template("endCart.html")


if __name__ == '__main__':
	app.run(host='0.0.0.0',port='4000',debug=True)