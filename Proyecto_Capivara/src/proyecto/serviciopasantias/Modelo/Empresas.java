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
    
    public static String nombreemp = "";
    public static String nit = "";
    public static String correoemp = "";
    public static String telefonoemp = "";
    public static String ciudad = "";
    public static String nombrerep = "";
    public static String apellidorep = "";
    public static String tipo_id = "";
    public static String no_id = "";
    public static String lugar = "";
    public static String correorep = "";
    public static String telefonorep = "";    
    public static String cargorep = "";
    public static String arearep = "";
    
    public static String GetInfo(){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlpersona = "select * from persona where id = (select Persona from usuario where Nombre = '" 
                        + LoginForAll.usuario + "' and Contrasena ='" + LoginForAll.passwordu + "')";
                ResultSet rspersona = stmt.executeQuery(sqlpersona);
                rspersona.next();
                Empresas.nombrerep = rspersona.getString(4);
                Empresas.apellidorep = rspersona.getString(5);
                Empresas.no_id = rspersona.getString(1);
                Empresas.lugar = rspersona.getString(3);
                Empresas.telefonorep = rspersona.getString(7);
                Empresas.correorep = rspersona.getString(6);
                
                /*Para la busqueda de Tipo"*/                
                String tipo_idb = rspersona.getString(2);
                String sqltipo = "select nombre from tipo_id where id = '" + tipo_idb + "'";
                ResultSet rstipo = stmt.executeQuery(sqltipo);
                rstipo.next();
                Empresas.tipo_id = rstipo.getString(1);
                
                /*Para la busqueda de empresa*/
                String sqlempresa = "select * from empresa where id = (select empresa from responsable where persona_id = '" + Empresas.no_id + "')";
                ResultSet rsempresa = stmt.executeQuery(sqlempresa);
                rsempresa.next();
                
                Empresas.nombreemp = rsempresa.getString(3);
                Empresas.nit = rsempresa.getString(2);
                Empresas.correoemp = rsempresa.getString(4);
                Empresas.telefonoemp = rsempresa.getString(5);
                Empresas.ciudad = rsempresa.getString(6);
                
                /*Para la busqueda de cargo*/
                String sqlcargo = "select nombre from cargo where id = (select cargo from responsable where persona_id = '" + Empresas.no_id + "')";
                ResultSet rscargo = stmt.executeQuery(sqlcargo);
                rscargo.next();
                Empresas.cargorep = rscargo.getString(1);
                
                /*Para la busqueda de area*/
                String sqlarea = "select nombre from area where id = (select area from responsable where persona_id = '" + Empresas.no_id + "')";
                ResultSet rsarea = stmt.executeQuery(sqlarea);
                rsarea.next();
                Empresas.arearep = rsarea.getString(1);
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
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
                        Statement stmtarea = con.createStatement();
                        String sqlidarea = "select * from area where nombre = '" + area + "'";
                        ResultSet rsidarea = stmtarea.executeQuery(sqlidarea);
                        String areaexiste = "";
                        if (!rsidarea.isBeforeFirst()){
                            areaexiste = "no registrado";
                        }
                        else{
                            areaexiste = "ya registrado";
                        }
                        
                        Statement stmtcargo = con.createStatement();
                        String sqlidcargo = "select * from cargo where nombre = '" + cargo + "'";
                        ResultSet rsidcargo = stmtcargo.executeQuery(sqlidcargo);
                        String cargoexiste = "";
                        if (!rsidcargo.isBeforeFirst()){
                            cargoexiste = "no registrado";
                        }
                        else
                        {
                            cargoexiste = "ya registrado";
                        }
                        
                        String sqlempresa = "insert into empresa(NIT, NOMBRE, CORREO, TELEFONO, CIUDAD) values ('" + nit + "', '" + nombreemp +
                                "', '" + correoemp + "', '" + telefonoemp + "', '" + ciudad + "')";
                        stmt.executeUpdate(sqlempresa);
                    
                        String sqlpersona = "insert into persona(ID, TIPO_ID, LUGAR_EXP_ID, NOMBRE, APELLIDO, CORREO, TELEFONO, FIRMA)"
                            + " values('" + id + "', '" + tipoid + "', '" + lugar + "', '" + nombrerep + "', '" + apellidorep + "', '" + correorep
                            + "', '" + telefonorep + "', '1')";
                        stmt.executeUpdate(sqlpersona);
                    
                        Statement stmtemp = con.createStatement();
                        String sqlidemp = "select id from empresa where nit = '" + nit + "'";
                        ResultSet rsidemp = stmtemp.executeQuery(sqlidemp);
                        rsidemp.next();
                        String idemp = rsidemp.getString(1);
                    
                        if (areaexiste.equals("ya registrado")){
                            if (cargoexiste.equals("ya registrado")){
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
                            if (cargoexiste.equals("ya registrado")){
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
    
    public static String CambiarDatos(String newpass, String usuario, String correoemp, String telefonoemp, String correorep, String telefonorep){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlchange = "update usuario set contrasena = '" + newpass + "' where nombre = '" + usuario + "'";
                stmt.executeUpdate(sqlchange);
                
                Statement stmt2 = con.createStatement();
                String sqlchange2 = "update empresa set correo = '" + correoemp + "', telefono = '" + telefonoemp + "' where nit = '" + nit + "'";
                stmt2.executeUpdate(sqlchange2);
                
                Statement stmt3 = con.createStatement();
                String sqlchange3 = "update persona set correo = '" + correorep + "', telefono = '" + telefonorep + "' where id = '" + no_id + "'";
                stmt3.executeUpdate(sqlchange3);
                return "Datos Actualizados";
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
}
