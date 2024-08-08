from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
import time

app = Flask(__name__)

# Retry logic for MySQL connection
for _ in range(5):
    try:
        db = mysql.connector.connect(
            host="db",
            user="root",
            password="password",
            database="users_db"
        )
        break
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        print("Retrying in 5 seconds...")
        time.sleep(5)
else:
    raise Exception("Could not connect to the MySQL database.")

@app.route('/')
def index():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM users")
    data = cursor.fetchall()
    return render_template('index.html', users=data)

@app.route('/add', methods=['POST'])
def add_user():
    cursor = db.cursor()
    name = request.form['name']
    address = request.form['address']
    phone = request.form['phone']
    cursor.execute("INSERT INTO users (name, address, phone) VALUES (%s, %s, %s)", (name, address, phone))
    db.commit()
    return redirect(url_for('index'))

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)

