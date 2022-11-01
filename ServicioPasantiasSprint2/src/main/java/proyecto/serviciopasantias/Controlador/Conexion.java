/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto.serviciopasantias.Controlador;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author snsc2
 */

	


public class Conexion {
    
    public static final String Url = "jdbc:mysql://localhost:3306/proyecto";
    public static final String User = "root";
    public static final String Password = "ssiabatto";
            
    public Connection getConexion(){
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(Url, User, Password);
        }
        catch (Exception e){
            System.out.println("Error: " + e.getMessage());
        }
        return con;
    }    
}
