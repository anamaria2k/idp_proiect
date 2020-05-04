import requests
import mysql.connector
from flask import Flask
from flask import render_template
from flask import request, Response
import time
import json
from mysql.connector import errorcode
from prometheus_flask_exporter import PrometheusMetrics

userserver = Flask(__name__)
PrometheusMetrics(app)

mydb = mysql.connector.connect(user="user", password="password",
										host="db",
										port="3306",
										database="makeupShop")


login_user_id = 0
cookie_session_id = 0

def generate_cookie():
	myTime = time.time()
	return str(myTime)

def verify_user_cookie():
	global login_user_id
	name = ""
	user_id = login_user_id
	if user_id != 0:	
		name = get_user_name(user_id)
	return name



def get_full_name():
	full_name = ""
	name = verify_user_cookie()

	if name:
		name = name[0]
		full_name = name[0] + " " + name[1]
	return full_name


def get_full_name_by_id(user_id):
	name = get_user_name(user_id)[0]
	full_name = name[0] + " " + name[1]
	return full_name


def get_user_id(mail):
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('getUserId', [mail,])

		for result in mycursor.stored_results():
			# this is a tuple (id)
			return result.fetchall()[0]

		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

def get_user_name(user_id):
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('getUserDetails', [user_id,])

		for result in mycursor.stored_results():
			# this is a tuple (firstName, lastName)
			return result.fetchall()

		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"



def get_categories():
	categories = []
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('getCategoryName', [])
		for result in mycursor.stored_results():
			for value in result.fetchall():
				categories.append(value)

		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return categories

def get_products(categ_id):
	products = []
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('findProducts', [categ_id,])

		for result in mycursor.stored_results():
			for value in result.fetchall():
				products.append(value)

		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return products

def get_cart_details(session_id):
	cart_details = []
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('getCartDetails', [session_id,])

		for result in mycursor.stored_results():
			for value in result.fetchall():
				cart_details.append(value)

		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return cart_details

def get_total_price(session_id):
	try:
		mycursor = mydb.cursor()
		total_price = mycursor.callproc('getTotalPriceCart', (session_id, ''))[1]

		mydb.commit()
		mycursor.close()
		if total_price == None:
			total_price = 0


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return total_price


def verify_email(email):
	try:
		mycursor = mydb.cursor()
		counter = mycursor.callproc('findEmail', (email, ''))[1]

		mydb.commit()
		mycursor.close()

	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return counter

def verify_account(email, password):
	try:
		mycursor = mydb.cursor()
		counter = mycursor.callproc('verifyAccount', (email, password, ''))[2]

		mydb.commit()
		mycursor.close()

	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return counter


def insert_user(firstName, lastName, email, address, mobile, psw):
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('insertUser', [firstName,lastName,email,address,mobile,psw])

		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return "Successfully inserted in table"

def add_to_cart(product_id, pieces, session_id):
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('addToCart', [product_id,pieces,session_id])


		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return "Successfully inserted in table"

def delete_item(item_id):
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('deleteItemCart', [item_id,])


		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return "Successfully deleted"

def finish_order(user_id, session_id):
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('finishOrder', [user_id,session_id])


		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return "Successfully inserted in table"


@userserver.route("/get_name_categ", methods=["GET"])
def home_page():
	categories = get_categories()
	full_name = get_full_name()
	payload = {'full_name': full_name, 'categories':categories}
	return payload

@userserver.route("/products", methods=["GET","POST"])
def products_page():
	global cookie_session_id
	payload = request.get_json()
	products = get_products(payload['id_prod'])
	cookie_string = generate_cookie()
	if cookie_session_id == 0:
		cookie_session_id = cookie_string
	res = {'products':products}


	return res


@userserver.route("/register", methods=["GET", "POST"])
def register_page_post():
	categories = get_categories()
	response = {'categories': categories, 'message': "", 'email': ""}
	payload = request.get_json()


	if not payload:
		return response
	else:
		counter = verify_email(payload["email"])
		if payload['psw1'] != payload['psw2']:
			response['email'] = payload['email']
			response['message'] = "Please re-introduce your password correctly!"
		elif counter > 0:
			response['message'] = "The introduced address is already registered!"
		elif response['message'] == "":
			insert_user(payload['name1'], payload['name2'], payload['email'], payload['address'], payload['phone'], payload['psw1'])

	return response

@userserver.route("/login", methods=["GET","POST"])
def login_page_post():
	global login_user_id
	payload = request.get_json()
	
	ok = verify_account(str(payload['mail']), str(payload['psw']))
	resp = {'message': "", 'full_name': ""}
	
	if ok == 1:
		user_id = get_user_id(payload['mail'])[0]
		# generate user Cookie
		full_name = get_full_name_by_id(user_id)
		resp['full_name'] = full_name
		login_user_id = user_id
	elif ok == 0:
		resp['message'] = "This account does not exist."

	return resp

@userserver.route("/logout", methods=["GET"])
def logout_page():
	global login_user_id
	global cookie_session_id
	login_user_id = 0
	cookie_session_id = 0
	resp = {'login_user_id': "0"}
	
	return resp

@userserver.route("/cart", methods=["GET", "POST"])
def cart_page_get():
	global cookie_session_id
	session_id = cookie_session_id
	res =  {'cart_details': "", 'total_price': ""}

	payload = request.get_json()
	if payload['item_id'] != "":
		delete_item(payload['item_id'])

	cart_details = get_cart_details(session_id)
	total_price = get_total_price(session_id)
	res['cart_details'] = cart_details
	res['total_price'] = str(total_price)

	return res
	
@userserver.route("/currentCart", methods=["GET","POST"])
def add_products():
	global cookie_session_id
	session_id = cookie_session_id

	resp = {'cart_details': "", 'total_price': ""}

	payload = request.get_json()
	if payload['item_id'] != "":
		delete_item(payload['item_id'])

	product_id = payload['product_id']
	pieces = payload['pieces']
	add_to_cart(product_id, pieces, session_id)

	cart_details = get_cart_details(session_id)
	total_price = get_total_price(session_id)


	resp['cart_details'] = cart_details
	resp['total_price'] = str(total_price)

	return resp

@userserver.route("/endCart", methods=["GET","POST"])
def cart_finish():
	global login_user_id
	global cookie_session_id
	resp = {'cookie_session_id': "0"}
	
	finish_order(login_user_id, cookie_session_id)
	cookie_session_id = 0
	
	return resp



if __name__ == '__main__':
	userserver.run(host='0.0.0.0',port='5000')