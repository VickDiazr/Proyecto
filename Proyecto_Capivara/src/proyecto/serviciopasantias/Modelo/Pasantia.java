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
public class Pasantia {
    private static Connection con;    
    public static final String driver= "com.mysql.jdbc.Driver";
    public static final String Url = "jdbc:mysql://localhost:3306/proyecto?characterEncoding=UTF-8";
    public static final String User = "root";
    public static final String Password = "";
    
    public static String RegistrarPasantia(String id, String titulo, String objg, String intro, String just, String aport, String fechai, String fechaf, String obje1,
            String obje2, String obje3, String responsable, String docente_d){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                Statement stmt1 = con.createStatement();
                String sqlresponsable = "select id from responsable where empresa = (select id from empresa where nombre = '" + responsable + "')";
                ResultSet responsableid = stmt1.executeQuery(sqlresponsable);
                responsableid.next();
                String idres = responsableid.getString(1);
                
                String sqlpasantia = "insert into pasantia (estudiante, titulo, objetivo_general, introduccion, justificacion, aplicacion_aporte, duracion, responsable, docente_director)"
                        + " values ('" + id + "', '" + titulo + "', '" + objg + "', '" + intro + "', '" + just + "', '" + aport + "', (datediff('" + fechaf + "', '" + fechai + "')/7), "
                        + "'" + idres + "', '" + docente_d + "')";
                stmt.executeUpdate(sqlpasantia);
                
                String sqlidpas = "select max(id) from pasantia";
                ResultSet rsidpas = stmt.executeQuery(sqlidpas);
                rsidpas.next();
                String pasantiaid = rsidpas.getString(1);
                
                String objetivo1 = "insert into objetivo_especifico (pasantia, descripcion) values ('" + pasantiaid + "', '" + obje1 + "')";
                stmt.executeUpdate(objetivo1);
                
                if ("".equals(obje2)){
                }
                else{
                    String objetivo2 = "insert into objetivo_especifico (pasantia, descripcion) values ('" + pasantiaid + "', '" + obje2 + "')";
                    stmt.executeUpdate(objetivo2);
                }
                
                if ("".equals(obje3)){
                }
                else{
                    String objetivo3 = "insert into objetivo_especifico (pasantia, descripcion) values ('" + pasantiaid + "', '" + obje3 + "')";
                    stmt.executeUpdate(objetivo3);
                }
                con.close();                    
                return "Aplicacion Exitosa";
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
}
