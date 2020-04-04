import requests
from flask import Flask
from flask import render_template, request, Response, make_response, redirect

app = Flask(__name__)


@app.route("/home", methods=["GET","POST"])
def home_page():
	r = requests.get("http://userserver:5000/get_name_categ").json()
	full_name = r['full_name']
	categories = r['categories']
	return render_template("home.html", user_name=full_name, categories=categories)

@app.route("/products", methods=["GET","POST"])
def products_page():
	id_prod = request.args.get('id_prod')
	payload = {"id_prod": id_prod}
	r = requests.get("http://userserver:5000/get_name_categ").json()

	full_name = r['full_name']
	categories = r['categories']

	det = requests.post("http://userserver:5000/products", json=payload).json()
	products = det['products']
	cookie_string = det['cookie']

	ret = make_response(render_template("products.html", id_prod=int(id_prod), user_name=full_name, categories=categories, products=products))
	if 'sessionid' not in request.cookies:
		ret.set_cookie('sessionid', cookie_string)
	return ret


@app.route("/register", methods=["GET"])
def register_page_get():
	r = requests.get("http://userserver:5000/register").json()
	categories = r['categories']

	return render_template("register.html", categories=categories)

@app.route("/register", methods=["POST"])
def register_page_post():
	name1 = request.form['name1']
	name2 = request.form['name2']
	email = request.form['email']
	address = request.form['address']
	phone = request.form['phone']
	psw1 = request.form['psw']
	psw2 = request.form['psw-repeat']


	payload = {'name1' : name1, 'name2' : name2, 'email' : email, 'address' : address, 'phone' : phone, 'psw1' : psw1, 'psw2' : psw2}


	resp = requests.post("http://userserver:5000/register", json=payload).json()

	if resp['message'] == "":
		return render_template("registerOK.html", categories=resp['categories'])
	else:
		return render_template("register.html", message=resp['message'], name1=name1, name2=name2, email=resp['email'], address=address, phone=phone, psw1=psw1, psw2=psw2, categories=resp['categories'])		
	

@app.route("/login", methods=["GET"])
def login_page_get():
	r = requests.get("http://userserver:5000/get_name_categ").json()
	categories = r['categories']

	return render_template("login.html", categories=categories)

@app.route("/login", methods=["POST"])
def login_page_post():
	r = requests.get("http://userserver:5000/get_name_categ").json()
	categories = r['categories']

	mail = request.form['mail']
	psw = request.form['psw']

	payload = {'mail': mail, 'psw': psw}

	resp = requests.post("http://userserver:5000/login", json=payload).json()

	message = resp['message']
	full_name = resp['full_name']
	user_id = resp['user_id']

	if resp['message'] == "":
		ret = make_response(render_template("loginOK.html", user_name=full_name, categories=categories))
		ret.set_cookie('userid', user_id)
		return ret
	else:
		return render_template("login.html", message=message, categories=categories)



@app.route("/logout", methods=["GET"])
def logout_page():
	r = requests.get("http://userserver:5000/get_name_categ").json()
	categories = r['categories']
	
	res = make_response(render_template("home.html", categories=categories))
	res.set_cookie('sessionid', '', expires=0)
	res.set_cookie('userid', '', expires=0)
	return res

@app.route("/endCart", methods=["GET","POST"])
def cart_page_get():

	r = requests.get("http://userserver:5000/get_name_categ").json()
	full_name = r['full_name']
	categories = r['categories']

	payload = {'item_id': ""}

	item_id = request.args.get('item_id')
	if item_id:
		payload['item_id'] = item_id

	resp = requests.post("http://userserver:5000/cart", json=payload).json()
	'''cart_details = resp['cart_details']
	total_price = resp['total_price']'''

	return render_template("cart.html", user_name=full_name, categories=categories, total_price=0)

@app.route("/cart", methods=["POST"])
def add_products():
	return render_template("cart.html")

@app.route("/endCart", methods=["POST"])
def cart_finish():
	return render_template("endCart.html")


if __name__ == '__main__':
	app.run(host='0.0.0.0',port='4000',debug=True)