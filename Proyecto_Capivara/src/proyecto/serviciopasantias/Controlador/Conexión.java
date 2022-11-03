
package proyecto.serviciopasantias.Controlador;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;




public class Conexión {
    
    private static Connection con;
    
    public static final String driver="com.mysql.jdbc.Driver";
    public static final String Url = "jdbc:mysql://localhost:3306/scripttestnicos";
    public static final String User = "root";
    public static final String Password = "";
    
    
    public void conectorr(){
        con=null;
        try{
            Class.forName(driver);
            
            con= (Connection) DriverManager.getConnection(Url, User, Password);
            
            if (con!=null){
                System.out.println("Soy GEi");
            }
            
        }
        
        
        catch (ClassNotFoundException | SQLException e){
            System.out.println("Error: " + e.getMessage());
        }
    }
    
}
