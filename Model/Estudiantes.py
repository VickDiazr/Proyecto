from distutils.log import Log
from logging import exception
from matplotlib.pyplot import connect
import mysql.connector
from mysql.connector import Error
import Model.ConecctionDB as DB

def LoginQuery(user, password):
    resultado = DB.connection()
    cursor = DB.connection.cursor()
    if DB.connection() == True:
        try:
            query = "select * from proyecto.usuario where `Nombre` = " + user + "and `Contrasena` = " + password
            DB.connection.cursor.execute(query)
            queryresult = cursor.fetchall()
            if cursor.rowcount() == 0:
                return False
            else:
                return True
        except:
            return False
    else:
        return False