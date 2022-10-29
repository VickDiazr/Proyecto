import Model.Estudiantes

def Login(user, password):
    resultado = False
    try:
        Model.Estudiantes.LoginQuery(user, password)
        return True
    except:
        resultado = False
        return resultado
    finally:
        return resultado
    

