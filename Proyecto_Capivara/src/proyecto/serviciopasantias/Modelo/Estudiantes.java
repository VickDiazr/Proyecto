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
public class Estudiantes {
    
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
    public static String correo = "";
    public static String sede = "";
    public static String facultad = "";
    public static String programa = "";
    public static String avance = "";
    
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
                Estudiantes.nombre = rspersona.getString(4);
                Estudiantes.apellido = rspersona.getString(5);
                Estudiantes.no_id = rspersona.getString(1);
                Estudiantes.lugar = rspersona.getString(3);
                Estudiantes.telefono = rspersona.getString(7);
                Estudiantes.correo = rspersona.getString(6);
                
                /*Para la busqueda de Tipo"*/                
                String tipo_idb = rspersona.getString(2);
                String sqltipo = "select nombre from tipo_id where id = '" + tipo_idb + "'";
                ResultSet rstipo = stmt.executeQuery(sqltipo);
                rstipo.next();
                Estudiantes.tipo_id = rstipo.getString(1);
                
                /*Para la busqueda de avance y programa*/
                String sqlavance = "select programa_id, avance from estudiante where persona_id = '" + Estudiantes.no_id + "'";
                ResultSet rsavpro = stmt.executeQuery(sqlavance);
                rsavpro.next();
                
                Estudiantes.avance = rsavpro.getString(2);
                String programab = rsavpro.getString(1);
                
                String sqlprograma = "select nombre, departamento from programa where id = '" + programab + "'";
                ResultSet rsprograma = stmt.executeQuery(sqlprograma);
                rsprograma.next();
                Estudiantes.programa = rsprograma.getString(1);
                
                String departamento = rsprograma.getString(2);
                
                /*Para la busqueda de facultad*/
                String sqlfacultad = "select nombre, sede from facultad where id = (select facultad from departamento where id = '" + departamento +"')";
                ResultSet rsfacultad = stmt.executeQuery(sqlfacultad);
                rsfacultad.next();
                Estudiantes.facultad = rsfacultad.getString(1);
                String sedeb = rsfacultad.getString(2);
                
                /*Para la busqueda de sede*/
                String sqlsede = "select nombre from sede where id = '" + sedeb + "'";
                ResultSet rssede = stmt.executeQuery(sqlsede);
                rssede.next();                
                Estudiantes.sede = rssede.getString(1);
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static String Register(String id, String tipo, String lugar, String nombre, String apellido, String correo,
            String telefono, String programa){
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
                    
                    String sqlverifypro = "select ID from programa where Nombre = '" + programa + "'";
                    ResultSet rspro = stmt.executeQuery(sqlverifypro);
                    rspro.next();
                    String programaid = rspro.getString(1);
                    
                    String sqlestudiante = "insert into estudiante(PERSONA_ID, PROGRAMA_ID, AVANCE, ESTADO)"
                        + " values('" + id + "', '" + programaid + "', null, '1')";
                    stmt.executeUpdate(sqlestudiante);
                    con.close();
                    
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
    
    public static String CambiarDatos(String newpass, String usuario, String telefono){
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
                Estudiantes.nombre = rspersona.getString(4);
                Estudiantes.apellido = rspersona.getString(5);
                Estudiantes.no_id = rspersona.getString(1);
                Estudiantes.lugar = rspersona.getString(3);
                Estudiantes.telefono = rspersona.getString(7);
                Estudiantes.correo = rspersona.getString(6);
                
                /*Para la busqueda de Tipo"*/                
                String tipo_idb = rspersona.getString(2);
                String sqltipo = "select nombre from tipo_id where id = '" + tipo_idb + "'";
                ResultSet rstipo = stmt.executeQuery(sqltipo);
                rstipo.next();
                Estudiantes.tipo_id = rstipo.getString(1);
                
                /*Para la busqueda de avance y programa*/
                String sqlavance = "select programa_id from estudiante where persona_id = '" + Estudiantes.no_id + "'";
                ResultSet rsavpro = stmt.executeQuery(sqlavance);
                rsavpro.next();
                
                String programab = rsavpro.getString(1);
                
                String sqlprograma = "select nombre, departamento from programa where id = '" + programab + "'";
                ResultSet rsprograma = stmt.executeQuery(sqlprograma);
                rsprograma.next();
                Estudiantes.programa = rsprograma.getString(1);
                
                String departamento = rsprograma.getString(2);
                
                /*Para la busqueda de facultad*/
                String sqlfacultad = "select nombre, sede from facultad where id = (select facultad from departamento where id = '" + departamento +"')";
                ResultSet rsfacultad = stmt.executeQuery(sqlfacultad);
                rsfacultad.next();
                Estudiantes.facultad = rsfacultad.getString(1);
                String sedeb = rsfacultad.getString(2);
                
                /*Para la busqueda de sede*/
                String sqlsede = "select nombre from sede where id = '" + sedeb + "'";
                ResultSet rssede = stmt.executeQuery(sqlsede);
                rssede.next();                
                Estudiantes.sede = rssede.getString(1);
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
}