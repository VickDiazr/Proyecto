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
public class Docentes {
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






    
    public static String Register(String id, String tipo, String lugar, String nombre, String apellido, String correo,
            String telefono, String departamento){
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
                    
                    String sqlverifypro = "select ID from departamento where Nombre = '" + departamento + "'";
                    ResultSet rspro = stmt.executeQuery(sqlverifypro);
                    rspro.next();
                    String departamentoid = rspro.getString(1);
                    
                    String sqldocente = "insert into docente(PERSONA_ID, DEPARTAMENTO) values('" + id + "', '" + departamentoid + "')";
                    stmt.executeUpdate(sqldocente);
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
}
