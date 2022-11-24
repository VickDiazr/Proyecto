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
import proyecto.serviciopasantias.Modelo.UserCorreo;
/**
 *
 * @author snsc2
 */
public class Validar {
    private static Connection con;    
    public static final String driver= "com.mysql.jdbc.Driver";
    public static final String Url = "jdbc:mysql://localhost:3306/proyecto?characterEncoding=UTF-8";
    public static final String User = "root";
    public static final String Password = "";
    
    public static String no_id = "";
    
    public static ResultSet GetInfo(){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlpersona = "select persona.nombre, persona.apellido, persona.id from persona left join usuario on persona.id = usuario.persona where usuario.persona is null";
                ResultSet rspersona = stmt.executeQuery(sqlpersona);
                if (!rspersona.isBeforeFirst()){
                    return null;
                }
                else{
                    rspersona.next();
                    Validar.no_id = rspersona.getString(3);
                    return rspersona;
                }
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return null;
        }
        return null;
    }
    
    public static String GetRol(String id){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlestudiante = "select persona_id from estudiante where persona_id = '" + id + "'";
                ResultSet rsest = stmt.executeQuery(sqlestudiante);
                if (!rsest.isBeforeFirst()){   
                    String sqldocente = "select persona_id from docente where persona_id = '" + id + "'";
                    ResultSet rsdoc = stmt.executeQuery(sqldocente);
                    if (!rsdoc.isBeforeFirst()){   
                        String sqlresponsable = "select persona_id from responsable where persona_id = '" + id + "'";
                        ResultSet rsresp = stmt.executeQuery(sqlresponsable);
                        if (!rsresp.isBeforeFirst()){              
                            return "Error";
                        }
                        else
                        {
                            return "Responsable";
                        }
                    }
                    else{
                        return "Docente";
                    }
                }
                else{
                    return "Estudiante";
                }
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static String ValidarEstudiante(String user, String id, String avance, String correo){
        UserCorreo.generateSecurePassword();
        String password = UserCorreo.newpassword;
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqluscheck = "select * from usuario where nombre = '" + user + "'";
                ResultSet rsuser = stmt.executeQuery(sqluscheck);
                if (!rsuser.isBeforeFirst()){                
                    String sqlusuario = "insert into usuario (nombre, contrasena, persona) values ('" + user + "', '" + password + "', '" + id + "')";
                    stmt.executeUpdate(sqlusuario);
                    String sqlavance = "update estudiante set avance = '" + avance + "' where persona_id = '" + id + "'";
                    stmt.executeUpdate(sqlavance);
                    con.close();                    
                    /*UserCorreo.enviarCorreo(correo, "Estudiante", user);*/
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
    
    public static String NoValidarEstudiante(String id){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlidcheck = "select * from persona where id = '" + id + "'";
                ResultSet rsid = stmt.executeQuery(sqlidcheck);
                if (!rsid.isBeforeFirst()){ 
                    return "No Existe";
                }
                else{
                    String sqldelete = "delete from persona where id = '" + id + "'";
                    stmt.executeUpdate(sqldelete);
                    return "Proceso Exitoso";
                }
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static String ValidarEmpresas(String user, String id, String correo){
        UserCorreo.generateSecurePassword();
        String password = UserCorreo.newpassword;
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqluscheck = "select * from usuario where nombre = '" + user + "'";
                ResultSet rsuser = stmt.executeQuery(sqluscheck);
                if (!rsuser.isBeforeFirst()){                
                    String sqlusuario = "insert into usuario (nombre, contrasena, persona) values ('" + user + "', '" + password + "', '" + id + "')";
                    stmt.executeUpdate(sqlusuario);
                    con.close();                    
                    /*UserCorreo.enviarCorreo(correo, "Estudiante", user);*/
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
    
    public static String NoValidarEmpresas(String nit, String id){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlnitcheck = "select * from empresa where nit = '" + nit + "'";
                ResultSet rsnit = stmt.executeQuery(sqlnitcheck);
                if (!rsnit.isBeforeFirst()){ 
                    return "No Existe";
                }
                else{
                    String sqldelete1 = "delete from persona where id = '" + id + "'";
                    stmt.executeUpdate(sqldelete1);
                    String sqldelete = "delete from empresa where nit = '" + nit + "'";
                    stmt.executeUpdate(sqldelete);
                    return "Proceso Exitoso";
                }
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static String ValidarDocentee(String user, String id, String correo){
        UserCorreo.generateSecurePassword();
        String password = UserCorreo.newpassword;
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqluscheck = "select * from usuario where nombre = '" + user + "'";
                ResultSet rsuser = stmt.executeQuery(sqluscheck);
                if (!rsuser.isBeforeFirst()){                
                    String sqlusuario = "insert into usuario (nombre, contrasena, persona) values ('" + user + "', '" + password + "', '" + id + "')";
                    stmt.executeUpdate(sqlusuario);
                    con.close();                    
                    /*UserCorreo.enviarCorreo(correo, "Estudiante", user);*/
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
    
    public static String NoValidarDocente(String id){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlidcheck = "select * from persona where id = '" + id + "'";
                ResultSet rsid = stmt.executeQuery(sqlidcheck);
                if (!rsid.isBeforeFirst()){ 
                    return "No Existe";
                }
                else{
                    String sqldelete = "delete from persona where id = '" + id + "'";
                    stmt.executeUpdate(sqldelete);
                    return "Proceso Exitoso";
                }
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
}
