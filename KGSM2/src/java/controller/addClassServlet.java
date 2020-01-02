/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.ClassDAO;
import model.ClassBean;
import model.ConnectionManager;

/**
 *
 * @author User
 */
@WebServlet("/uploadServlet2")
@MultipartConfig(maxFileSize = 16177215)
public class addClassServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            ClassBean classes = new ClassBean(); 
            
            String id = request.getParameter("class_ID");
            
            classes.setclass_ID(id);
            classes.setclass_Name(request.getParameter("class_Name"));
            classes.setclass_Desc(request.getParameter("class_Desc"));
            classes.setclass_Venue(request.getParameter("class_Venue"));
            classes.setclass_Date(request.getParameter("class_Date"));
            classes.setclass_Time(request.getParameter("class_Time"));
            classes.setclass_Payment(request.getParameter("class_Payment"));
            classes.setCoach_ID(request.getParameter("coach_ID"));
            classes.setclass_Category(request.getParameter("class_Category"));
            
            InputStream inputStream = null;
            // obtains the upload file part in this multipart request
            Part filePart = request.getPart("photo");
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }
            
            classes = ClassDAO.addClass(classes);
            
            Connection conn = null; 
            PreparedStatement statement;
        
            if (classes.isValid()){
                try {
                    conn = ConnectionManager.getConnection();
                    String sql = "UPDATE CLASSES SET CLASSIMAGE = ? WHERE CLASSID = ?";
                    statement = conn.prepareStatement(sql);
                    
                    if (inputStream != null) {
                        statement.setBlob(1, inputStream);
                    }
                    statement.setString(2,id);
                    
                    int row = statement.executeUpdate();
                    
                    if (row > 0) {
                        System.out.print("File uploaded and saved into database");
                    }
                }
                catch (SQLException ex) { 
                    ex.printStackTrace();
                } 
                finally {
                    if (conn != null) {
                        // closes the database connection
                        try {
                            conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                }
                System.out.print("You Have Successfully SIGNED UP");
                response.sendRedirect("viewClassAdmin.jsp"); 
            }
            else{
                    response.sendRedirect("addClass.jsp");
            }
        }
        catch (Throwable theException){
                    System.out.println(theException);
        }
    }
}
  
        
