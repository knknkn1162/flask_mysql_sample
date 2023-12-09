import os
from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)


class DBManager:
    def __init__(self):
        host = os.environ["DB_HOST"]
        if host == "localhost":
            # name of the mysql service as set in the docker compose file
            host = "db"
        db = os.environ["DB_NAME"]
        user = os.environ["DB_USER"]
        password = os.environ["DB_PASSWORD"]
        self.connection = mysql.connector.connect(
            user=user,
            password=password,
            host=host,
            database=db
        )
        self.cursor = self.connection.cursor()
    
    def get_records(self):
        self.cursor.execute('SELECT title, price FROM product')
        rec = []
        for c in self.cursor:
            app.logger.info('result: %s', c)
            rec.append({'title': c[0], 'price': c[1]})
        return rec

    def insert_record(self, title, price):
        self.cursor.execute("insert into product (title, price) values ('{0}', {1})".format(title, price))


conn = DBManager()

@app.route('/')
def index():
  return render_template("index.html")


@app.route('/show')
def show():
    _items = conn.get_records()
    items = [item for item in _items]

    return render_template('show.html', items=items)

@app.route('/new', methods=['POST'])
def new():
    title = request.form['title']
    price = int(request.form['price'])
    app.logger.info('result: %s %d', title, price)
    conn.insert_record(title, price)

    return redirect(url_for('show'))

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)