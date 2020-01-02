/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tiqah isza
 */
import java.sql.*;

public class ConnectionManager {
    static Connection con;
    
    private static final String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String DB_CONNECTION = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "kgsm";
    private static final String DB_PASSWORD = "kgsm";
    
    public static Connection getConnection(){
        try{
          
            Class.forName(DB_DRIVER);
            
            try{
              con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
              System.out.println("connected");
  
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }catch(ClassNotFoundException e){
            System.out.println(e);
        }
        return con;
    }
    
}
