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
public class LoginForAll {
    private static Connection con;    
    public static String usuario = "";
    public static String passwordu = "";
    public static final String driver= "com.mysql.jdbc.Driver";
    public static final String Url = "jdbc:mysql://localhost:3306/proyecto?characterEncoding=latin1";
    public static final String User = "root";
    public static final String Password = "";    
    
    private static int rs_id;
    
    public static String Login(String user, String password){
        LoginForAll.usuario = user;
        LoginForAll.passwordu = password;
        con = null;
        try{
            Class.forName(driver);            
            con = (Connection) DriverManager.getConnection(Url, User, Password);            
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlest = "select * from estudiante where Persona_id = (select Persona from usuario where Nombre= '" + user + "'and Contrasena ='"+password+"')";
                ResultSet rsest = stmt.executeQuery(sqlest); 
                if (!rsest.isBeforeFirst()){
                    String sqldoc = "select * from docente where `Persona_id` = (select `Persona` from usuario where `Nombre`= '" + user + "'and `Contrasena` ='"+password+"')";
                    ResultSet rsdoc = stmt.executeQuery(sqldoc);
                    if (!rsdoc.isBeforeFirst()){
                        String sqlemp = "select * from responsable where `Persona_id` = (select `Persona` from usuario where `Nombre`= '" + user + "'and `Contrasena` ='"+password+"')";
                        ResultSet rsemp = stmt.executeQuery(sqlemp);
                        if (!rsemp.isBeforeFirst()){
                            String sqlcom = "select * from comite_asesor where Persona_id = (select Persona from usuario where Nombre = '" + user + "'and Contrasena ='"+password+"')";
                            ResultSet rscom = stmt.executeQuery(sqlcom);
                            if (!rscom.isBeforeFirst()){
                                con.close();
                                return "Error";
                            }
                            else{
                                return "Comite";
                            }
                        }
                        else{
                            String responsable = "select id from responsable where Persona_id = (select Persona from usuario where Nombre = '"+user+"' and Contrasena = '"+password+"')";
                            ResultSet rsresponsable = stmt.executeQuery(responsable);                            
                            rsresponsable.first();                            
                            rs_id = rsresponsable.getInt(1);                            
                            con.close();
                            return "Empresa";
                        }
                    }
                    else{
                        con.close();
                        return "Docente";
                    }
                }
                else{
                    con.close();
                    return "Estudiante";
                }
            }            
        }        
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static int getRs_id() {
        return rs_id;
    }

    public void setRs_id(int rs_id) {
        this.rs_id = rs_id;
    }
}
