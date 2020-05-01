import requests
from flask import Flask
from flask import render_template, request, Response, make_response, url_for, redirect
import ast


app = Flask(__name__)

@app.route("/login", methods=["GET"])
def get_loginMethod():
    return render_template("login.html")

@app.route("/login", methods=["POST"])
def post_loginMethod():
	user = request.form['uname']
	password = request.form['psw']
	# if the admin's password is wrong, refresh login page
	if (user == 'admin' and password == 'anaana'):
		return redirect(url_for('get_categories'))
	return render_template("login.html")

@app.route("/categories", methods=["GET"])
def get_categories():
	categ_id = ""
	categ_name = ""

	r = requests.get("http://adminserver:3000/get_categ").json()
	categories = r['categories']
	
	categ_id = request.args.get('update_id')
	if categ_id is None:
		delete_id = request.args.get('delete_id')
		if delete_id is None:
			return render_template("categories.html", categories=categories, categ_id="", categ_name="")
		payload = {"categ_id":delete_id}
		if delete_id != "":
			ret = requests.post("http://adminserver:3000/delete_categ", json=payload).json()
			r = requests.get("http://adminserver:3000/get_categ").json()
			categories = r['categories']
			return render_template("categories.html", categories=categories, categ_id="", categ_name="")
	payload = {"categ_id":categ_id}
	if categ_id != "":
		ret = requests.post("http://adminserver:3000/get_categ_by_id", json=payload).json()
		categ_id = ret['categ'][0][0]
		categ_name = ret['categ'][0][1]


	return render_template("categories.html", categories=categories, categ_id=categ_id, categ_name=categ_name)

@app.route("/categories", methods=["POST"])
def post_categories():
	

	funct_id = request.form['funct_id']
	categ_name = request.form['categ_name']
	
	if categ_name != "":
		if funct_id == "":
			payload = {"categ_name": categ_name}
			ret = requests.post("http://adminserver:3000/add_categ", json=payload).json()
		else:
			payload = {"id": funct_id, "categ_name": categ_name}
			ret = requests.post("http://adminserver:3000/update_categ", json=payload).json()
	
	r = requests.get("http://adminserver:3000/get_categ").json()
	categories = r['categories']
	return render_template("categories.html", categories=categories, categ_id="", categ_name="")

@app.route("/products", methods=["GET"])
def get_products():
	r = requests.get("http://adminserver:3000/get_categ").json()
	categories = r['categories']
	r = requests.get("http://adminserver:3000/get_products").json()
	products = r['products']

	prod_id = request.args.get('update_id')
	if prod_id is None:
		delete_id = request.args.get('delete_id')
		if delete_id is None:
			return render_template("products.html", categories=categories, products=products, 
						prod_id = "", categ_id = "", name = "", brand = "", 
						descr = "", pict = "", price = "", stock = "")
		payload = {"prod_id":delete_id}
		if delete_id != "":
			ret = requests.post("http://adminserver:3000/delete_product", json=payload).json()
			r = requests.get("http://adminserver:3000/get_categ").json()
			categories = r['categories']
			r = requests.get("http://adminserver:3000/get_products").json()
			products = r['products']
			return render_template("products.html", categories=categories, products=products, 
						prod_id = "", categ_id = "", name = "", brand = "", 
						descr = "", pict = "", price = "", stock = "")
	payload = {"prod_id":prod_id}
	if prod_id != "":
		ret = requests.post("http://adminserver:3000/get_products_by_id", json=payload).json()
		prod_id = ret['prod'][0][0]
		categ_id = ret['prod'][0][1]
		name = ret['prod'][0][2]
		brand = ret['prod'][0][3]
		descr = ret['prod'][0][4]
		pict = ret['prod'][0][5]
		price = ret['prod'][0][6]
		stock = ret['prod'][0][7]
	return render_template("products.html", categories=categories, products=products, 
		prod_id = prod_id, categ_id = categ_id, name = name, brand = brand, 
		descr = descr, pict = pict, price = price, stock = stock)

@app.route("/products", methods=["POST"])
def post_products():
	
	funct_id = request.form['funct_id']
	prod_name = request.form['prod_name']
	categ_id = request.form['categ']
	brand = request.form['brand']
	descr = request.form['description']
	pict = request.form['picture']
	price = request.form['price']
	stock = request.form['stock']

	
	if prod_name != "" and brand != "" and price != "" and stock != "":
		if funct_id == "":
			payload = {"categ_id": categ_id, "prod_name": prod_name, "brand": brand, "descr": descr, "pict": pict, "price": price, "stock": stock}
			ret = requests.post("http://adminserver:3000/add_product", json=payload).json()
		else:
			payload = {"prod_id": funct_id, "categ_id": categ_id, "prod_name": prod_name, "brand": brand, "descr": descr, "pict": pict, "price": price, "stock": stock}
			ret = requests.post("http://adminserver:3000/update_product", json=payload).json()

	r = requests.get("http://adminserver:3000/get_categ").json()
	categories = r['categories']
	r = requests.get("http://adminserver:3000/get_products").json()
	products = r['products']

	return render_template("products.html", categories=categories, products=products, 
		prod_id = "", categ_id = "", name = "", brand = "", 
		descr = "", pict = "", price = "", stock = "")

@app.route("/orders", methods=["GET"])
def get_orders():
	ret = requests.get("http://adminserver:3000/get_orders").json()
	return render_template("orders.html", orders=ret['orders'])

if __name__ == '__main__':
	app.run(host='0.0.0.0',port='2000',debug=True)