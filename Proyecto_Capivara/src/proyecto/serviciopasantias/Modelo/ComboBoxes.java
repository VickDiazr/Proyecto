/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto.serviciopasantias.Modelo;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.DefaultComboBoxModel;

/**
 *
 * @author snsc2
 */
public class ComboBoxes {
    
    private static Connection con;    
    public static final String driver= "com.mysql.jdbc.Driver";
    public static final String Url = "jdbc:mysql://localhost:3306/proyecto?characterEncoding=UTF-8";
    public static final String User = "root";
    public static final String Password = "";
    
    public DefaultComboBoxModel getValuesSede(){
        con = null;
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        try{
            Class.forName(driver);            
            con = (Connection) DriverManager.getConnection(Url, User, Password);            
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlsede = "select nombre from sede";
                ResultSet rs = stmt.executeQuery(sqlsede);
                while(rs.next()){
                    modelo.addElement(rs.getString(1));
                }
                con.close();
                rs.close();
            }
        }
        catch (Exception e){System.out.println(e);}
        return modelo;
    }
    
    public DefaultComboBoxModel getValuesFacultad(){
        con = null;
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        try{
            Class.forName(driver);            
            con = (Connection) DriverManager.getConnection(Url, User, Password);            
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlfacultad = "select nombre from facultad";
                ResultSet rs = stmt.executeQuery(sqlfacultad);
                while(rs.next()){
                    modelo.addElement(rs.getString(1));
                }
                con.close();
                rs.close();
            }
        }
        catch (Exception e){System.out.println(e);}
        return modelo;
    }
    
    public DefaultComboBoxModel getValuesDepartamento(){
        con = null;
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        try{
            Class.forName(driver);            
            con = (Connection) DriverManager.getConnection(Url, User, Password);            
            if (con != null){
                Statement stmt = con.createStatement();
                String sqldepartamento = "select nombre from departamento";
                ResultSet rs = stmt.executeQuery(sqldepartamento);
                while(rs.next()){
                    modelo.addElement(rs.getString(1));
                }
                con.close();
                rs.close();
            }
        }
        catch (Exception e){System.out.println(e);}
        return modelo;
    }
    
    public DefaultComboBoxModel getValuesTipoID(){
        con = null;
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        try{
            Class.forName(driver);            
            con = (Connection) DriverManager.getConnection(Url, User, Password);            
            if (con != null){
                Statement stmt = con.createStatement();
                String sqltipoid = "select nombre from tipo_id";
                ResultSet rs = stmt.executeQuery(sqltipoid);
                while(rs.next()){
                    modelo.addElement(rs.getString(1));
                }
                con.close();
                rs.close();
            }
        }
        catch (Exception e){System.out.println(e);}
        return modelo;
    }
    
    public DefaultComboBoxModel getValuesPrograma(){
        con = null;
        DefaultComboBoxModel modelo = new DefaultComboBoxModel();
        try{
            Class.forName(driver);            
            con = (Connection) DriverManager.getConnection(Url, User, Password);            
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlprograma = "select nombre from programa";
                ResultSet rs = stmt.executeQuery(sqlprograma);
                while(rs.next()){
                    modelo.addElement(rs.getString(1));
                }
                con.close();
                rs.close();
            }
        }
        catch (Exception e){System.out.println(e);}
        return modelo;
    }
}
