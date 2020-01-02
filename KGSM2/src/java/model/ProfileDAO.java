/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;


/**
 *
 * @author Win8
 */
public class ProfileDAO {
  public String updateUser( UserBean bean){

              
        Connection con;
        PreparedStatement statement;
        PreparedStatement statement2;
        //ResultSet resultSet;
        try
        {   
            String id = bean.getID();
            String fullName = bean.getFullName();
            String password = bean.getPass();
            String ic = bean.getIC();
            String email = bean.getEmail();
            String phoneNo = bean.getPhoneNo();
            String address = bean.getAddress();
            int typeID = bean.getUserTypeID();
            String fullNames = bean.getFullName();
            con = ConnectionManager.getConnection();
            
            ResultSet rs = null;
            Statement stmt;
            String searchQuery;
            stmt = con.createStatement();
            
            if(typeID==2){
                statement = con.prepareStatement("UPDATE COACH SET COACHFULLNAME=?,COACHIC=?,COACHPHONENO=?, COACHADDRESS=?,COACHEMAIL=?,COACHPASSWORD=? WHERE COACHID =?");
                statement.setString(1, fullName); 
                statement.setString(2, ic);         
                statement.setString(3, phoneNo); 
                statement.setString(4, address);
                statement.setString(5, email); 
                statement.setString(6, password);
                statement.setString(7, id); 
                
                
                //resultSet = statement.executeQuery("INSERT INTO COACH(COACHFULLNAME,COACHNAME, COACHPASSWORD,COACHIC, COACHEMAIL,COACHPHONENO, COACHADDRESS, USERTYPEID, USERTYPEDESC) VALUES('"+fullName+"','"+userName+"', '"+password+"','"+ic+"', '"+email+"', '"+phoneNo+"', '"+address+"', 2 ,'PENGAJAR')");
                int i = statement.executeUpdate();
                System.out.print("dao"+i);
                String msg;
                if(i!=0){
                            msg="SUCCESSFULLY UPDATED";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>"); 
                            return "SUCCESS";
                        }
                        else{  
                            msg="Failed to UPDATE the data";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>");
                        }
  }  
               
                if(typeID==1){
                statement = con.prepareStatement("UPDATE ADMINISTRATOR SET ADMINFULLNAME=?,ADMINIC=?,ADMINPHONENO=?, ADMINADDRESS=?,ADMINEMAIL=?,ADMINPASSWORD=? WHERE ADMINID =?");
                statement.setString(1, fullName); 
                statement.setString(2, ic);         
                statement.setString(3, phoneNo); 
                statement.setString(4, address);
                statement.setString(5, email); 
                statement.setString(6, password);
                statement.setString(7, id); 
                
                
                
                //resultSet = statement.executeQuery("INSERT INTO COACH(COACHFULLNAME,COACHNAME, COACHPASSWORD,COACHIC, COACHEMAIL,COACHPHONENO, COACHADDRESS, USERTYPEID, USERTYPEDESC) VALUES('"+fullName+"','"+userName+"', '"+password+"','"+ic+"', '"+email+"', '"+phoneNo+"', '"+address+"', 2 ,'PENGAJAR')");
                int i = statement.executeUpdate();
                System.out.print("dao"+i);
                String msg;
                if(i!=0){
                            msg="SUCCESSFULLY UPDATED";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>"); 
                            return "SUCCESS";
                        }
                        else{  
                            msg="Failed to UPDATE the data";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>");
                        }
  }  
                if(typeID==3){
                statement = con.prepareStatement("UPDATE PARTICIPANT SET USERFULLNAME=?,USERIC=?,USERPHONENO=?, USERADDRESS=?,USEREMAIL=?,USERPASSWORD=? WHERE USERID =?");
                statement.setString(1, fullName); 
                statement.setString(2, ic);         
                statement.setString(3, phoneNo); 
                statement.setString(4, address);
                statement.setString(5, email); 
                statement.setString(6, password);
                statement.setString(7, id); 
                
                
                
                //resultSet = statement.executeQuery("INSERT INTO COACH(COACHFULLNAME,COACHNAME, COACHPASSWORD,COACHIC, COACHEMAIL,COACHPHONENO, COACHADDRESS, USERTYPEID, USERTYPEDESC) VALUES('"+fullName+"','"+userName+"', '"+password+"','"+ic+"', '"+email+"', '"+phoneNo+"', '"+address+"', 2 ,'PENGAJAR')");
                int i = statement.executeUpdate();
                System.out.print("dao"+i);
                String msg;
                if(i!=0){
                            msg="SUCCESSFULLY UPDATED";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>"); 
                            return "SUCCESS";
                        }
                        else{  
                            msg="Failed to UPDATE the data";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>");
                        }
  }  
}
 catch(SQLException e)
       {
          e.printStackTrace();
        }
        return "Failed";
  }
}