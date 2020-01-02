/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author User
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author
 */
import java.sql.*;
import java.util.*;
import java.sql.*;
import model.ClassBean;

public class ClassDAO {
    
    static Connection currentCon = null; 
    
    public static ClassBean addClass(ClassBean classes){
    
        String class_ID = classes.getclass_ID();
        String class_Name =classes.getclass_Name(); 
        String class_Desc = classes.getclass_Desc(); 
        String class_Venue = classes.getclass_Venue(); 
        String class_Date = classes.getclass_Date();
        String class_Time = classes.getclass_Time();
        String class_Payment = classes.getclass_Payment();
        String coach_ID = classes.getCoach_ID();
        String class_Category = classes.getclass_Category ();
            
        try{
    
            currentCon = ConnectionManager.getConnection(); 
            PreparedStatement ps = currentCon.prepareStatement("INSERT INTO CLASSES(CLASSID,CLASSNAME,CLASSVENUE,CLASSDATE, CLASSTIME, CLASSPAYMENT, CLASSDESC, COACHID,CLASSCATEGORY)"+"values(?,?,?,?,?,?,?,?,?)");

            ps.setString(1, class_ID);
            ps.setString(2, class_Name);
            ps.setString(4, class_Date);
            ps.setString(3, class_Venue);
            ps.setString(6, class_Payment);
            ps.setString(7, class_Desc);
            ps.setString(5, class_Time);
            ps.setString(8, coach_ID);
            ps.setString(9, class_Category);
    
            int i = ps.executeUpdate();

            if (i>0){
                System.out.println("Successfully added");
                classes.setValid(true);
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        finally{
    
            if (currentCon != null){
                try{
                    currentCon.close();
                }catch(Exception e){
                    currentCon = null;
                }
            }
        }
        return classes;
    }
}