import requests
import mysql.connector
from flask import Flask
from flask import render_template
from flask import request, Response
import time
import json
from mysql.connector import errorcode

app = Flask(__name__)

mydb = mysql.connector.connect(user="user", password="password",
										host="db",
										port="3306",
										database="makeupShop")

def add_category(name):
	try:
		
		mycursor = mydb.cursor()
		mycursor.callproc('addNewCategory',[name,])
		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"
	
	return "Succesfully inserted entry"

def add_prod(categ_id, prod_name, brand, descr, pict, price, stock):
	try:
		mycursor = mydb.cursor()
		args = (categ_id, prod_name, brand, descr, pict, price, stock)
		mycursor.callproc('addNewProduct',args)
		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"
	
	return "Succesfully inserted entry"

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

def get_category_by_id(categ_id):
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('getCategoryById', [categ_id,])

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


def update_category(categ_id,name):
	try:
		
		mycursor = mydb.cursor()
		args = (categ_id, name)
		mycursor.callproc('updateCategory',args)
		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"
	
	return "Succesfully inserted entry"

def delete_category(categ_id):
	try:
		
		mycursor = mydb.cursor()
		mycursor.callproc('deleteCategory',[categ_id,])
		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"
	
	return "Succesfully inserted entry"

def get_prods():
	products = []
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('getProducts', [])

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

def get_prods_by_id(prod_id):
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('getProductById', [prod_id,])

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

def update_prod(prod_id, categ_id, prod_name, brand, descr, pict, price, stock):
	try:
		
		mycursor = mydb.cursor()
		args = (prod_id, categ_id, prod_name, brand, descr, pict, price, stock)
		mycursor.callproc('updateProduct',args)
		mydb.commit()
		mycursor.close()

	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"
	
	return "Succesfully inserted entry"

def delete_prod(prod_id):
	try:
		
		mycursor = mydb.cursor()
		mycursor.callproc('deleteProduct',[prod_id,])
		mydb.commit()
		mycursor.close()

	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"
	
	return "Succesfully inserted entry"

def get_all_orders():
	orders = []
	try:
		mycursor = mydb.cursor()
		mycursor.callproc('getAllOrders', [])

		for result in mycursor.stored_results():
			for value in result.fetchall():
				orders.append(value)

		mydb.commit()
		mycursor.close()


	except mysql.connector.Error as err:
		if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
			return "Something is wrong with your user name or password"
		elif err.errno == errorcode.ER_BAD_DB_ERROR:
			return "Database does not exist"

	return orders

@app.route("/get_categ", methods=["GET","POST"])
def get_categ():
	categories = get_categories()
	payload = {'categories':categories}
	return payload

@app.route("/add_categ", methods=["GET","POST"])
def add_categ():
	payload = request.get_json()
	add_category(payload['categ_name'])
	return payload

@app.route("/get_categ_by_id", methods=["GET","POST"])
def get_categ_by_id():
	payload = request.get_json()
	categ = get_category_by_id(int(payload['categ_id']))
	resp = {'categ':categ}
	return resp

@app.route("/update_categ", methods=["GET","POST"])
def update_categ():
	payload = request.get_json()
	categ = update_category(int(payload['id']), payload['categ_name'])
	return payload

@app.route("/delete_categ", methods=["GET","POST"])
def delete_categ():
	payload = request.get_json()
	delete_category(payload['categ_id'])
	return payload

@app.route("/get_products", methods=["GET","POST"])
def get_products():
	products = get_prods()
	payload = {'products':products}
	return payload

@app.route("/add_product", methods=["GET","POST"])
def add_product():
	payload = request.get_json()
	add_prod(payload['categ_id'], payload['prod_name'], payload['brand'], payload['descr'], payload['pict'], payload['price'], payload['stock'])
	return payload

@app.route("/get_products_by_id", methods=["GET","POST"])
def get_products_by_id():
	payload = request.get_json()
	prod = get_prods_by_id(int(payload['prod_id']))
	resp = {'prod':prod}
	return resp

@app.route("/update_product", methods=["GET","POST"])
def update_product():
	payload = request.get_json()

	prod = update_prod(int(payload['prod_id']), payload['categ_id'], payload['prod_name'], payload['brand'], payload['descr'], payload['pict'], payload['price'], payload['stock'])
	return payload

@app.route("/delete_product", methods=["GET","POST"])
def delete_product():
	payload = request.get_json()
	delete_prod(payload['prod_id'])
	return payload

@app.route("/get_orders", methods=["GET","POST"])
def get_orders():
	orders = get_all_orders()
	payload = {'orders':orders}
	return payload

if __name__ == '__main__':
	app.run(host='0.0.0.0',port='3000',debug=True)