/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DbM_Final;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Yale Chu
 */
public class MySQLConn extends HttpServlet {
    
    public static Connection getMySQLConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String connectionURL = "jdbc:mysql://209.222.10.150:3306/DBM_Final";
        Connection conn = DriverManager.getConnection(connectionURL, "DBM_Final", "123");
        return conn;
    }
  
}
