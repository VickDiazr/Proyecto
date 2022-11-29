
package proyecto.serviciopasantias.Modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.sql.ResultSet;
import static proyecto.serviciopasantias.Modelo.Empresas.Password;

/**
 *
 * @author j_e_g
 */
public class Actividad 
{
    //ACTIVIDAD
    public static String titulo;
    public static String fecha_inicio;
    public static String fecha_fin;
    public static String ubicacion;
    public static String descripcion;
    public static String tipologia;
    public static String responsable;
    
    //BASE DE DATOS
    private static Connection con;    
    public static final String driver= "com.mysql.jdbc.Driver";
    public static final String Url = "jdbc:mysql://localhost:3306/proyecto?characterEncoding=UTF-8";
    public static final String User = "root";
    public static final String Password = "";
    
    
    public static String Register(String titulo, String tipologia, String fecha_inicio, String fecha_fin, String ubicacion, String descripcion, int rs_id){
        con = null;
        try{
            Class.forName(driver);            
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();                                
                String sqlactividad = "Insert into actividad (TITULO, DESCRIPCION, TIPOLOGIA, FECHA_INICIO, FECHA_FIN, UBICACION, RESPONSABLE) values"
                                    + "('" + titulo + "', '" +descripcion + "', '" + tipologia + "', '" + fecha_inicio +"','"
                                      +fecha_fin+"','"+ubicacion+"','"+rs_id+"') ";
                stmt.executeUpdate(sqlactividad);                
                con.close();
                return "Registro Exitoso";
            }
        }      
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static ResultSet GetInfo(){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlactividad = "select id, titulo, descripcion, tipologia, fecha_inicio, fecha_fin, ubicacion, responsable from actividad";
                ResultSet rsactividad = stmt.executeQuery(sqlactividad);
                if (!rsactividad.isBeforeFirst()){
                    return null;
                }
                else{
                    rsactividad.next();
                    responsable = rsactividad.getString(8);
                    return rsactividad;
                }
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return null;
        }
        return null;
    }
    
    public static String GetEmpresa(String id){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlactividad = "select nombre from empresa where id = (select empresa from responsable where id = '" + id + "')";
                ResultSet rsactividad = stmt.executeQuery(sqlactividad);
                if (!rsactividad.isBeforeFirst()){
                    return null;
                }
                else{
                    rsactividad.next();
                    responsable = rsactividad.getString(1);
                    return responsable;
                }
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return null;
        }
        return null;
    }

    public static String GetInfoValidar(String id){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlpersona = "select * from actividad where id = '" + id + "'";
                ResultSet rspersona = stmt.executeQuery(sqlpersona);
                rspersona.next();
                Actividad.titulo = rspersona.getString(2);
                Actividad.descripcion = rspersona.getString(3);
                Actividad.tipologia = rspersona.getString(4);
                Actividad.fecha_inicio = rspersona.getString(5);
                Actividad.fecha_fin = rspersona.getString(6);
                Actividad.ubicacion = rspersona.getString(7);
                String preresponsable = rspersona.getString(8);
                
                /*Para la busqueda del nombre de empresa"*/                            
                String sqlnombre = "select nombre from empresa where id = (select empresa from responsable where id = '" + preresponsable + "')";
                ResultSet rstipo = stmt.executeQuery(sqlnombre);
                rstipo.next();
                Actividad.responsable = rstipo.getString(1);
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
}
