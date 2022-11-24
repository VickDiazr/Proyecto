/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto.serviciopasantias.Modelo;

import java.util.Properties;
import javax.swing.JOptionPane;
import javax.mail.*;
import javax.mail.internet.*;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import org.apache.commons.lang3.RandomStringUtils;
import javax.mail.PasswordAuthentication;

/**
 *
 * @author snsc2
 */
public class UserCorreo {
    private static Connection con;    
    public static final String driver= "com.mysql.jdbc.Driver";
    public static final String Url = "jdbc:mysql://localhost:3306/proyecto?characterEncoding=UTF-8";
    public static final String User = "root";
    public static final String Password = "";
    public static String correo = "";
    public static String newpassword = "";
    public static String newusuario = "";
    
    public static String ValidarCuenta(String id){
        con = null;
        try{
            Class.forName(driver);
            con = (Connection) DriverManager.getConnection(Url, User, Password);
            if (con != null){
                Statement stmt = con.createStatement();
                String sqlpersona = "select correo from persona where id = '" + id + "'";
                ResultSet rspersona = stmt.executeQuery(sqlpersona);
                rspersona.next();
                UserCorreo.correo = rspersona.getString(1);
            }
        }
        catch (ClassNotFoundException | SQLException e){
            return e.getMessage();
        }
        return "Error";
    }
    
    public static void generateSecurePassword() {  
        // generate a string of upper case letters having length 2  
        String upperCaseStr = RandomStringUtils.random(2, 65, 90, true, true);  
         
        // generate a string of lower case letters having length 2  
        String lowerCaseStr = RandomStringUtils.random(2, 97, 122, true, true);  
          
        // generate a string of numeric letters having length 2  
        String numbersStr = RandomStringUtils.randomNumeric(2);  
          
        // generate a string of alphanumeric letters having length 2  
        String totalCharsStr = RandomStringUtils.randomAlphanumeric(2);  
          
        // concatenate all the strings into a single one  
        String demoPassword = upperCaseStr.concat(lowerCaseStr)  
          .concat(numbersStr)    
          .concat(totalCharsStr);  
          
        // create a list of Char that stores all the characters, numbers and special characters   
        List<Character> listOfChar = demoPassword.chars()  
                .mapToObj(data -> (char) data)  
                .collect(Collectors.toList());  
          
        // use shuffle() method of the Collections to shuffle the list elements   
        Collections.shuffle(listOfChar);  
          
        //generate a random string(secure password) by using list stream() method and collect() method  
        String password = listOfChar.stream()  
                .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append)  
                .toString();  

        UserCorreo.newpassword = password;
    }
    
    public static void enviarCorreo(String correo, String check, String user){
        UserCorreo.generateSecurePassword();
        String newcontraseña = UserCorreo.newpassword;
        
        String correoEnvia = "ssiabatto@unal.edu.co";
        String contraseña = "tqaevhwrecbfqhzm";
        String host = "smtp.gmail.com";
        
        Properties objetocorreo = System.getProperties();
        
        objetocorreo.put("mail.stmp.host", host);
        objetocorreo.put("mail.stmp.port", 587);
        objetocorreo.put("mail.smtp.tls.enable", "true");
        objetocorreo.put("mail.smtp.auth", "true");
        
         Session session = Session.getInstance(objetocorreo, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(correoEnvia, contraseña);

            }

        });
        session.setDebug(true);
        
        try{
            MimeMessage mail = new MimeMessage(session);
            mail.setFrom(new InternetAddress (correoEnvia));
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
            mail.setSubject("Usuario Registrado en Servicio de Pasantías");
            if ("Estudiante".equals(check)){
                String mensaje = "¡Bienvenido Estudiante!\nSu usuario es: " + user + "\n Su contraseña es: " + newcontraseña;
                mail.setText(mensaje);
            }
            else if ("Docente".equals(check)){
                String mensaje = "¡Bienvenido Docente!\nSu usuario es: " + user + "\n Su contraseña es: " + newcontraseña;
                mail.setText(mensaje);
            }
            else if ("Empresa".equals(check)){
                String mensaje = "¡Bienvenido Empresario!\nSu usuario es: " + user + "\n Su contraseña es: " + newcontraseña;
                mail.setText(mensaje);
            }
            
            Transport.send(mail);
            JOptionPane.showMessageDialog(null, "Se ha enviado un correo con el usuario y la contraseña.");
            
        }catch (Exception ex){
            JOptionPane.showMessageDialog(null, "Error de envio de correo...\n" + ex);
        }        
    }
}
