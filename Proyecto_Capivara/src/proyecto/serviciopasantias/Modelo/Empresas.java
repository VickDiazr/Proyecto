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
public class Empresas {
    
    private static Connection con;    
    public static final String driver= "com.mysql.jdbc.Driver";
    public static final String Url = "jdbc:mysql://localhost:3306/proyecto?characterEncoding=UTF-8";
    public static final String User = "root";
    public static final String Password = "";
    
    public static String Register(String nit, String nombreemp, String correoemp, String telefonoemp, String ciudad, String id, String tipo, String lugar,
            String nombrerep, String apellidorep, String correorep, String telefonorep, String cargo, String area){
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
                    
                    String sqlverifynit = "select * from empresa where NIT = '" + nit + "'";
                    ResultSet rsnit = stmt.executeQuery(sqlverifynit);
                    
                    if (!rsnit.isBeforeFirst()){
                        String sqlempresa = "insert into empresa(NIT, NOMBRE, CORREO, TELEFONO, CIUDAD) values ('" + nit + "', '" + nombreemp +
                                "', '" + correoemp + "', '" + telefonoemp + "', '" + ciudad + "')";
                        stmt.executeUpdate(sqlempresa);
                    
                        String sqlpersona = "insert into persona(ID, TIPO_ID, LUGAR_EXP_ID, NOMBRE, APELLIDO, CORREO, TELEFONO, FIRMA)"
                            + " values('" + id + "', '" + tipoid + "', '" + lugar + "', '" + nombrerep + "', '" + apellidorep + "', '" + correorep
                            + "', '" + telefonorep + "', '1')";
                        stmt.executeUpdate(sqlpersona);
                    
                        Statement stmtarea = con.createStatement();
                        String sqlidarea = "select * from area where nombre = '" + area + "'";
                        ResultSet rsidarea = stmtarea.executeQuery(sqlidarea);
                        String areaexiste;
                        if (!rsidarea.isBeforeFirst()){
                            areaexiste = "falso";
                        }
                        else
                        {
                            areaexiste = "verdadero";
                        }
                    
                        Statement stmtcargo = con.createStatement();
                        String sqlidcargo = "select * from cargo where nombre = '" + cargo + "'";
                        ResultSet rsidcargo = stmtcargo.executeQuery(sqlidcargo);
                        String cargoexiste;
                        if (!rsidcargo.isBeforeFirst()){
                            cargoexiste = "falso";
                        }
                        else
                        {
                            cargoexiste = "verdadero";
                        }
                    
                        Statement stmtemp = con.createStatement();
                        String sqlidemp = "select id from empresa where nit = '" + nit + "'";
                        ResultSet rsidemp = stmtemp.executeQuery(sqlidemp);
                        rsidemp.next();
                        String idemp = rsidemp.getString(1);
                    
                        if (areaexiste.equals("falso")){
                            if (cargoexiste.equals("falso")){
                                rsidarea.next();
                                rsidcargo.next();
                                String areaid = rsidarea.getString(1);
                                String cargoid = rsidcargo.getString(1);
                            
                                String sqlresponsable = "insert into responsable (PERSONA_ID, EMPRESA, CARGO, AREA) values('" + id 
                                        + "', '" + idemp + "', '" + cargoid + "', '" + areaid + "')";
                                stmt.executeUpdate(sqlresponsable);
                            }
                            else{                        
                                String sqlcargo = "insert into cargo (NOMBRE) values ('" + cargo + "')";
                                stmt.executeUpdate(sqlcargo);
                        
                                Statement stmtcargo2 = con.createStatement();
                                String sqlidcargo1 = "select id from cargo where nombre = '" + cargo + "'";
                                ResultSet rsidcargo1 = stmtcargo2.executeQuery(sqlidcargo1);
                                rsidcargo1.next();
                                String cargoid = rsidcargo1.getString(1);
                        
                                rsidarea.next();
                                String areaid = rsidarea.getString(1);
                                String sqlresponsable = "insert into responsable (PERSONA_ID, EMPRESA, CARGO, AREA) values('" + id 
                                        + "', '" + idemp + "', '" + cargoid + "', '" + areaid + "')";
                                stmt.executeUpdate(sqlresponsable);
                            }
                        }
                        else{
                            if (cargoexiste.equals("falso")){
                                rsidcargo.next();
                                String cargoid = rsidcargo.getString(1);

                                String sqlarea = "insert into area (NOMBRE) values ('" + area + "')";
                                stmt.executeUpdate(sqlarea);
                                
                                Statement stmtarea2 = con.createStatement();
                                String sqlidarea1 = "select id from area where nombre = '" + area + "'";
                                ResultSet rsidarea1 = stmtarea2.executeQuery(sqlidarea1);
                                rsidarea1.next();
                                String areaid = rsidarea1.getString(1);
                            
                                String sqlresponsable = "insert into responsable (PERSONA_ID, EMPRESA, CARGO, AREA) values('" + id 
                                        + "', '" + idemp + "', '" + cargoid + "', '" + areaid + "')";
                                stmt.executeUpdate(sqlresponsable);
                            }
                            else{
                                String sqlcargo = "insert into cargo (NOMBRE) values ('" + cargo + "')";
                                stmt.executeUpdate(sqlcargo);
                                
                                Statement stmtcargo2 = con.createStatement();
                                String sqlidcargo1 = "select id from cargo where nombre = '" + cargo + "'";
                                ResultSet rsidcargo1 = stmtcargo2.executeQuery(sqlidcargo1);
                                rsidcargo1.next();
                                String cargoid = rsidcargo1.getString(1);
                            
                                String sqlarea = "insert into area (NOMBRE) values ('" + area + "')";
                                stmt.executeUpdate(sqlarea);
                                
                                Statement stmtarea2 = con.createStatement();
                                String sqlidarea1 = "select id from area where nombre = '" + area + "'";
                                ResultSet rsidarea1 = stmtarea2.executeQuery(sqlidarea1);
                                rsidarea1.next();
                                String areaid = rsidarea1.getString(1);
                            
                                String sqlresponsable = "insert into responsable (PERSONA_ID, EMPRESA, CARGO, AREA) values('" + id 
                                    + "', '" + idemp + "', '" + cargoid + "', '" + areaid + "')";
                                stmt.executeUpdate(sqlresponsable);
                            }
                        }
                        con.close();
                    
                        return "Registro Exitoso";
                    }
                    else{
                        return "Empresa Ya Registrada";
                    }
                }
                else{
                    return "Usuario Ya Registrado";                    
                }
            }
        }      
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
}
