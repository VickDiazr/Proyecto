/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
 package proyecto.serviciopasantias.Modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author snsc2
 */
public class Docentes {
    private static Connection con;    
    public static final String driver= "com.mysql.jdbc.Driver";
    public static final String Url = "jdbc:mysql://localhost:3306/proyecto?characterEncoding=UTF-8";
    public static final String User = "root";
    public static final String Password = "";

    public static String nombre = "";
    public static String apellido = "";
    public static String tipo_id = "";
    public static String no_id = "";
    public static String lugar = "";
    public static String telefono = "";
    public static String extension = "";
    public static String correo = "";    
    public static String departamento = "";
   
    public static String Register(String id, String tipo, String lugar, String nombre, String apellido, String correo,
            String telefono, String departamento, String extension){
        con = null;
        try{
            Class.forName(driver);            
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlverifyid = "select * from persona where ID = '" + id + "'";
                ResultSet rsid = stmt.executeQuery(sqlverifyid);
                
                if (!rsid.isBeforeFirst()){                
                    String sqlverifytipo = "select ID from tipo_id where Nombre = '" + tipo + "'";
                    ResultSet rstipo = stmt.executeQuery(sqlverifytipo);
                    rstipo.next();
                    String tipoid = rstipo.getString(1);
                    
                    String sqlpersona = "insert into persona(ID, TIPO_ID, LUGAR_EXP_ID, NOMBRE, APELLIDO, CORREO, TELEFONO, FIRMA)"
                        + " values('" + id + "', '" + tipoid + "', '" + lugar + "', '" + nombre + "', '" + apellido + "', '" + correo
                        + "', '" + telefono + "', '1')";
                    stmt.executeUpdate(sqlpersona);
                    
                    String sqlverifypro = "select ID from departamento where Nombre = '" + departamento + "'";
                    ResultSet rspro = stmt.executeQuery(sqlverifypro);
                    rspro.next();
                    String departamentoid = rspro.getString(1);
                    if ("null".equals(extension)){
                        String sqldocente = "insert into docente(PERSONA_ID, DEPARTAMENTO, EXTENSION) values('" + id + "', '" + departamentoid + "', null)";
                        stmt.executeUpdate(sqldocente);
                        con.close();    
                    }
                    else{
                        String sqldocente = "insert into docente(PERSONA_ID, DEPARTAMENTO, EXTENSION) values('" + id + "', '" + departamentoid + "', '" + extension +"')";
                        stmt.executeUpdate(sqldocente);
                        con.close();    
                    }
                    return "Registro Exitoso";
                }
                else{
                    return "Ya Registrado";
                }
            }
        }      
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static String GetInfo(){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlpersona = "select * from persona where id = (select Persona from usuario where Nombre = '" 
                        + LoginForAll.usuario + "' and Contrasena ='" + LoginForAll.passwordu + "')";
                ResultSet rspersona = stmt.executeQuery(sqlpersona);
                rspersona.next();
                Docentes.nombre = rspersona.getString(4);
                Docentes.apellido = rspersona.getString(5);
                Docentes.no_id = rspersona.getString(1);
                Docentes.lugar = rspersona.getString(3);
                Docentes.telefono = rspersona.getString(7);
                Docentes.correo = rspersona.getString(6);
                
                /*Para la busqueda de Tipo"*/                
                String tipo_idb = rspersona.getString(2);
                String sqltipo = "select nombre from tipo_id where id = '" + tipo_idb + "'";
                ResultSet rstipo = stmt.executeQuery(sqltipo);
                rstipo.next();
                Docentes.tipo_id = rstipo.getString(1);
                
                /*Para la busqueda de codigo de departamento*/
                String sqlcoddep = "select departamento, extension from docente where persona_id = '" + Docentes.no_id + "'";
                ResultSet rscoddep = stmt.executeQuery(sqlcoddep);
                rscoddep.next();
                
                String coddep = rscoddep.getString(1);
                Docentes.extension = rscoddep.getString(2);
                
                String sqldepar = "select nombre from departamento where id = '" + coddep + "'";
                ResultSet rsdepar = stmt.executeQuery(sqldepar);
                rsdepar.next();
                Docentes.departamento = rsdepar.getString(1);
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static String CambiarDatos(String newpass, String usuario, String telefono, String extension){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlchange = "update usuario set contrasena = '" + newpass + "' where nombre = '" + usuario + "'";
                stmt.executeUpdate(sqlchange);
                
                Statement stmt2 = con.createStatement();
                String sqlchange2 = "update persona set telefono = '" + telefono + "' where id = '" + no_id + "'";
                stmt2.executeUpdate(sqlchange2);
                
                Statement stmt3 = con.createStatement();
                if ("null".equals(extension)){
                    String sqlchange3 = "update docente set extension = null where persona_id = '" + no_id + "'";
                    stmt3.executeUpdate(sqlchange3);                
                }
                else{
                    String sqlchange3 = "update docente set extension = '" + extension + "' where persona_id = '" + no_id + "'";
                    stmt3.executeUpdate(sqlchange3);            
                }
                return "Datos Actualizados";
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static String GetInfoValidar(String id){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlpersona = "select * from persona where id = '" + id + "'";
                ResultSet rspersona = stmt.executeQuery(sqlpersona);
                rspersona.next();
                Docentes.nombre = rspersona.getString(4);
                Docentes.apellido = rspersona.getString(5);
                Docentes.no_id = rspersona.getString(1);
                Docentes.lugar = rspersona.getString(3);
                Docentes.telefono = rspersona.getString(7);
                Docentes.correo = rspersona.getString(6);
                
                /*Para la busqueda de Tipo"*/                
                String tipo_idb = rspersona.getString(2);
                String sqltipo = "select nombre from tipo_id where id = '" + tipo_idb + "'";
                ResultSet rstipo = stmt.executeQuery(sqltipo);
                rstipo.next();
                Docentes.tipo_id = rstipo.getString(1);
                
                /*Para la busqueda de codigo de departamento*/
                String sqlcoddep = "select departamento, extension from docente where persona_id = '" + Docentes.no_id + "'";
                ResultSet rscoddep = stmt.executeQuery(sqlcoddep);
                rscoddep.next();
                
                String coddep = rscoddep.getString(1);
                Docentes.extension = rscoddep.getString(2);
                
                String sqldepar = "select nombre from departamento where id = '" + coddep + "'";
                ResultSet rsdepar = stmt.executeQuery(sqldepar);
                rsdepar.next();
                Docentes.departamento = rsdepar.getString(1);
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
}
