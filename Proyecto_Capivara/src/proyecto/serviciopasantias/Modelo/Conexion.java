/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto.serviciopasantias.Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author CHAPARRO
 */
public class Conexion 
{
    
    public static final String driver= "com.mysql.jdbc.Driver";

    
    
    private static Connection con;
    
    private static final boolean conectado = false;

    public static Connection conectar()
    {
        
        try 
        {
            
            if (conectado == false)
            {               
                
                               
                Class.forName(driver);
            
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto?characterEncoding=latin1", "root", ""); 
             
            }

            return con; 
        } 
        catch (ClassNotFoundException | SQLException e) 
        {
            JOptionPane.showMessageDialog(null,"Error al crear la conexión "+e.getMessage());
            
            throw new RuntimeException("Error al crear la conexión");
        }
    }
}
