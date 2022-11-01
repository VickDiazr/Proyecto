/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto.serviciopasantias.Modelo;
import java.sql.Connection;
import proyecto.serviciopasantias.Controlador.Conexion;
        
/**
 *
 * @author snsc2
 */


public class PruebaConexion {
    
    public Connection Test(){
        Connection con = null;
        try{
            Conexion conectar = new Conexion();
            con = conectar.getConexion();
        }
        catch (Exception e){
            System.out.println("Error: " + e.getMessage());
        }
        return con;
    }
}
