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
public class ComiteAsesor {
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
    public static String programa = "";
    
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
                ComiteAsesor.nombre = rspersona.getString(4);
                ComiteAsesor.apellido = rspersona.getString(5);
                ComiteAsesor.no_id = rspersona.getString(1);
                ComiteAsesor.lugar = rspersona.getString(3);
                ComiteAsesor.telefono = rspersona.getString(7);
                ComiteAsesor.correo = rspersona.getString(6);
                
                /*Para la busqueda de Tipo"*/                
                String tipo_idb = rspersona.getString(2);
                String sqltipo = "select nombre from tipo_id where id = '" + tipo_idb + "'";
                ResultSet rstipo = stmt.executeQuery(sqltipo);
                rstipo.next();
                ComiteAsesor.tipo_id = rstipo.getString(1);
                
                /*Para la busqueda de programa*/
                String sqlprograma = "select nombre from programa where id = (select programa_id from comite_asesor where persona_id = '" + ComiteAsesor.no_id + "')";
                ResultSet rsprograma = stmt.executeQuery(sqlprograma);
                rsprograma.next();
                
                ComiteAsesor.programa = rsprograma.getString(1);
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
}
