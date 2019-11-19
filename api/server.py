import os
import cx_Oracle
from flask import Flask

db_user = os.environ.get('DB_USERNAME', 'USERNAME_NOSET')
db_password = os.environ.get('DB_PASSWORD', 'PASSWORD_NOSET')
db_connect = os.environ.get('DB_CONNECT_DESCRIPTOR', "localhost:1521/foo")
service_port = port=os.environ.get('PORT', '5000')

app = Flask(__name__)

@app.route('/')
def index():
    connection = cx_Oracle.connect(db_user, db_password, db_connect)
    cur = connection.cursor()
    cur.execute("SELECT 'Hello, World from Oracle DB!' FROM DUAL")
    col = cur.fetchone()[0]
    cur.close()
    connection.close()
    return col

if __name__ == '__main__':
      app.run(host='0.0.0.0', port=int(service_port))
