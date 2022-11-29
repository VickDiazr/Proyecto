
package proyecto.serviciopasantias.Modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
/**
 *
 * @author j_e_g
 */
public class Actividad 
{
    //ACTIVIDAD
    private static String titulo;
    private static String fecha_inicio;
    private static String fecha_fin;
    private static String ubicacion;
    private static String descripcion;
    private static int tipologia;
    
    
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

}
