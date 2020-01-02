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
import java.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;

public class UserDAO {
    
    //static Connection currentCon = null;
    //static ResultSet rs = null;
    
    public static UserBean login(UserBean bean){
        
        // preparing some objects for connection
        Connection currentCon = null;
        ResultSet rs = null;
        Statement stmt;
        String searchQuery;
        String name = bean.getName();
        String password = bean.getPass();
        String userType = bean.getUserType();
        
        try {
            // connect to DB
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            
                if(userType.equals("Pengurus")) {
                    searchQuery = "SELECT * FROM ADMINISTRATOR WHERE ADMINNAME='" + name + "' AND ADMINPASSWORD ='" + password + "'";
                    //searchQuery = "SELECT * FROM ADMINISTRATOR WHERE ADMINNAME='" + name + "' AND ADMINPASSWORD='" + password + "'";
                    rs = stmt.executeQuery(searchQuery);
                    while(rs.next())
                    {
                        String userID = rs.getString("ADMINID");
                        String userFullName = rs.getString("ADMINFULLNAME");
                        String userName = rs.getString("ADMINNAME");
                        String userPass = rs.getString("ADMINPASSWORD");
                        String userIC = rs.getString("ADMINIC");
                        String userEmail = rs.getString("ADMINEMAIL");
                        String userPhoneNo = rs.getString("ADMINPHONENO");
                        String userAddress = rs.getString("ADMINADDRESS");
                        int userTypeID = rs.getInt("USERTYPEID");
                        
                        if(name.equals(userName)&& password.equals(userPass))
                        {
                            bean.setID(userID);
                            bean.setFullName(userFullName);
                            bean.setName(userName);
                            bean.setPass(userPass);
                            bean.setIC(userIC);
                            bean.setEmail(userEmail);
                            bean.setPhoneNo(userPhoneNo );
                            bean.setAddress(userAddress);
                            bean.setUserTypeID(userTypeID);
                            
                            bean.setValid(true);
                        }
                    } 
                }
                
                if(userType.equals("Pengajar")) {
                    searchQuery = "SELECT * FROM COACH WHERE COACHNAME='" + name + "' AND COACHPASSWORD ='" + password + "'";
                    //searchQuery = "SELECT * FROM COACH WHERE COACHNAME='" + name + "' AND COACHPASSWORD='" + password + "'";
                    rs = stmt.executeQuery(searchQuery);
                    while(rs.next())
                    {
                        Blob blob = rs.getBlob("COACHIMAGE");
 
                        InputStream inputStream = blob.getBinaryStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead = -1;

                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);                  
                        }

                        byte[] imageBytes = outputStream.toByteArray();
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                        inputStream.close();
                        outputStream.close();
                        
                        String userID = rs.getString("COACHID");
                        String userFullName = rs.getString("COACHFULLNAME");
                        String userName = rs.getString("COACHNAME");
                        String userPass = rs.getString("COACHPASSWORD");
                        String userIC = rs.getString("COACHIC");
                        String userEmail = rs.getString("COACHEMAIL");
                        String userPhoneNo = rs.getString("COACHPHONENO");
                        String userAddress = rs.getString("COACHADDRESS");
                        int userTypeID = rs.getInt("USERTYPEID");
                        
                        if(name.equals(userName)&& password.equals(userPass))
                        {
                            bean.setID(userID);
                            bean.setFullName(userFullName);
                            bean.setName(userName);
                            bean.setPass(userPass);
                            bean.setIC(userIC);
                            bean.setEmail(userEmail);
                            bean.setPhoneNo(userPhoneNo );
                            bean.setAddress(userAddress);
                            bean.setUserTypeID(userTypeID);
                            bean.setBase64Image(base64Image);
                            
                            bean.setValid(true);
                        }
                    }
                }
                
                if(userType.equals("Peserta")) {
                    searchQuery = "SELECT * FROM PARTICIPANT WHERE USERNAME='" + name + "' AND USERPASSWORD ='" + password + "'";
                    //searchQuery = "SELECT * FROM PARTICIPANT WHERE USERNAME='" + name + "' AND USERPASSWORD='" + password + "'";
                    rs = stmt.executeQuery(searchQuery);
                    while(rs.next())
                    {
                        Blob blob = rs.getBlob("USERIMAGE");
 
                        InputStream inputStream = blob.getBinaryStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead = -1;

                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);                  
                        }

                        byte[] imageBytes = outputStream.toByteArray();
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                        inputStream.close();
                        outputStream.close();
                        
                        String userID = rs.getString("USERID");
                        String userFullName = rs.getString("USERFULLNAME");
                        String userName = rs.getString("USERNAME");
                        String userPass = rs.getString("USERPASSWORD");
                        String userIC = rs.getString("USERIC");
                        String userEmail = rs.getString("USEREMAIL");
                        String userPhoneNo = rs.getString("USERPHONENO");
                        String userAddress = rs.getString("USERADDRESS");
                        int userTypeID = rs.getInt("USERTYPEID");
                        
                        System.out.print(userFullName);
                        
                        
                        if(name.equals(userName)&& password.equals(userPass))
                        {
                            bean.setID(userID);
                            bean.setFullName(userFullName);
                            bean.setName(userName);
                            bean.setPass(userPass);
                            bean.setIC(userIC);
                            bean.setEmail(userEmail);
                            bean.setPhoneNo(userPhoneNo );
                            bean.setAddress(userAddress);
                            bean.setUserTypeID(userTypeID);
                            bean.setBase64Image(base64Image);
                            
                            bean.setValid(true);
                        }
                    }
                }
        }
        catch(Exception e){
                System.out.println("Log In Failed: An exception has occured! " + e);
                e.printStackTrace();
        }
        // some exception handling
        finally {
            if (rs != null) {
                try{                   
                    rs.close();
                }catch(Exception e){
                    stmt = null;
                }
            }
            if (currentCon != null) {
                try{
                    currentCon.close();
                }catch(Exception e){
                    
                }
                currentCon = null;
            }
        }
        return bean;
    }
    
    public String saveUser(UserBean bean){
        
        Connection con;
        PreparedStatement statement;
        PreparedStatement statement2;
        //ResultSet resultSet;
        
        try
        {
            String fullName = bean.getFullName();
            String userName = bean.getName();
            String password = bean.getPass();
            String ic = bean.getIC();
            String email = bean.getEmail();
            String phoneNo = bean.getPhoneNo();
            String address = bean.getAddress();
            String type = bean.getUserType();
            con = ConnectionManager.getConnection();
            
            ResultSet rs = null;
            Statement stmt;
            String searchQuery;
            stmt = con.createStatement();
            
            if(type.equalsIgnoreCase("Pengajar")){
                statement = con.prepareStatement("INSERT INTO COACH(COACHFULLNAME,COACHNAME, COACHPASSWORD,COACHIC, COACHEMAIL,COACHPHONENO, COACHADDRESS, USERTYPEID, USERTYPEDESC) VALUES( ?, ?, ?, ?, ?, ?, ?, 2 ,'PENGAJAR')");
                //statement = con.prepareStatement("INSERT INTO ADMINISTRATOR(ADMINFULLNAME,ADMINNAME, ADMINPASSWORD, ADMINIC, ADMINEMAIL, ADMINPHONENO, ADMINADDRESS, USERTYPEID, USERTYPEDESC) VALUES( ?, ?, ?, ?, ?, ?, ?, 1 ,'PENGURUS')");
                statement.setString(1, fullName); 
                statement.setString(2, userName); 
                statement.setString(3, password); 
                statement.setString(4, ic); 
                statement.setString(5, email); 
                statement.setString(6, phoneNo); 
                statement.setString(7, address); 
                
                int i = statement.executeUpdate();
                String msg=" ";
                if(i!=0){ 
                    searchQuery = "SELECT NO FROM COACH WHERE COACHNAME='" + userName + "'";
                    //searchQuery = "SELECT NO FROM ADMINISTRATOR WHERE ADMINNAME='" + userName + "'";
                    System.out.print(searchQuery);
                    rs = stmt.executeQuery(searchQuery);
                    while(rs.next())
                    {
                        int no = rs.getInt("NO");
                        System.out.print(no);
                        String userID = "C" + no;
                        //String userID = "A" + no;
                        
                        statement2 = con.prepareStatement("UPDATE COACH SET COACHID = ? WHERE NO = ?");
                        //statement2 = con.prepareStatement("UPDATE ADMINISTRATOR SET ADMINID = ? WHERE NO = ?");
                        statement2.setString(1, userID); 
                        statement2.setInt(2, no); 
                        
                        int m = statement2.executeUpdate();
                        
                        if(m!=0){
                            msg="Record has been inserted";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>"); 
                            return "SUCCESS";
                        }
                        else{  
                            msg="Failed to insert the data";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>");
                        }
                    } 
                }  
                else{  
                    msg="Failed to insert the data";
                    System.out.println("<font size='6' color=blue>" + msg + "</font>");
                }
            }
            else if(type.equalsIgnoreCase("Peserta")){
                statement = con.prepareStatement("INSERT INTO PARTICIPANT(USERFULLNAME, USERNAME, USERPASSWORD, USERIC, USEREMAIL, USERPHONENO, USERADDRESS, USERSTATUS, USERTYPEID, USERTYPEDESC) VALUES( ?, ?, ?, ?, ?, ?, ?,'AKTIF', 3 ,'PESERTA')");
                statement.setString(1, fullName); 
                statement.setString(2, userName); 
                statement.setString(3, password); 
                statement.setString(4, ic); 
                statement.setString(5, email); 
                statement.setString(6, phoneNo); 
                statement.setString(7, address); 
                
                //resultSet =  statement.executeQuery("INSERT INTO PARTICIPANT(USERFULLNAME, USERNAME, USERPASSWORD, USERIC, USEREMAIL, USERPHONENO, USERADDRESS, USERTYPEID, USERTYPEDESC) VALUES('"+fullName+"','"+userName+"', '"+password+"', '"+ic+"','"+email+"', '"+phoneNo+"', '"+address+"', 3 ,'PESERTA')");
                int i = statement.executeUpdate();
                String msg=" ";
                if(i!=0){ 
                    searchQuery = "SELECT NO FROM PARTICIPANT WHERE USERNAME='" + userName + "'";
                    rs = stmt.executeQuery(searchQuery);
                    while(rs.next())
                    {
                        int no = rs.getInt("NO");
                        String userID = "P" + no;
                        
                        statement2 = con.prepareStatement("UPDATE PARTICIPANT SET USERID = ? WHERE NO = ?");
                        statement2.setString(1, userID); 
                        statement2.setInt(2, no); 
                        
                        int m = statement2.executeUpdate();
                        
                        if(m!=0){
                            msg="Record has been inserted";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>"); 
                            return "SUCCESS";
                        }
                        else{  
                            msg="Failed to UPDATE the data";
                            System.out.println("<font size='6' color=blue>" + msg + "</font>");
                        }
                    } 
                }  
                else{  
                    msg="Failed to insert the data";
                    System.out.println("<font size='6' color=blue>" + msg + "</font>");
                }
            }
            
            
                
        }
        catch(SQLException e)
            {
                    e.printStackTrace();
            }
        return "Invalid";
    }
}
