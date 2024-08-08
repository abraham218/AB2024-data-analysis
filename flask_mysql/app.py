from flask import Flask, render_template
import mysql.connector
import os

app = Flask(__name__)

# Configure MySQL connection
db_config = {
    'host': os.getenv('MYSQL_HOST', 'db'),
    'user': os.getenv('MYSQL_USER', 'root'),
    'password': os.getenv('MYSQL_PASSWORD', 'password'),
    'database': os.getenv('MYSQL_DATABASE', 'user_db')
}

def get_users():
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT name, phone FROM users")
    users = cursor.fetchall()
    cursor.close()
    conn.close()
    return users

@app.route('/')
def index():
    users = get_users()
    return render_template('index.html', users=users)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

