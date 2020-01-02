/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserBean;
import model.UserDAO;
import javax.servlet.http.Part;
import model.ConnectionManager;

/**
 *
 * @author tiqah isza
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class SignupServlet extends HttpServlet{
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)    
                        throws ServletException, java.io.IOException { 
                
        UserDAO signupDAO = new UserDAO();
        UserBean user = new UserBean();
        
        String psw = request.getParameter("psw");
        String psw2 = request.getParameter("psw2");
        if(psw.equals(psw2)){
            user.setPass(psw);
        }
        
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
        
        String ic = request.getParameter("noic");
        String utype = request.getParameter("utype");
        
        user.setFullName(request.getParameter("fname"));
        user.setName(request.getParameter("uname"));
        //user.setPass(request.getParameter("psw"));
        user.setIC(ic);
        user.setEmail(request.getParameter("email"));
        user.setPhoneNo(request.getParameter("phoneno"));
        user.setAddress(request.getParameter("address"));
        user.setUserType(utype);
        
        String saveUser = signupDAO.saveUser(user);
        Connection conn = null; 
        PreparedStatement statement;
        
        if(saveUser.equals("SUCCESS"))
        {
            try {
                conn = ConnectionManager.getConnection();
                if(utype.equals("Pengajar"))
                {   
                    String sql = "UPDATE COACH SET COACHIMAGE = ? WHERE COACHIC = ?";
                    statement = conn.prepareStatement(sql);
                    
                    if (inputStream != null) {
                        statement.setBlob(1, inputStream);
                    }
                    statement.setString(2,ic);
                    
                    int row = statement.executeUpdate();
                    
                    if (row > 0) {
                        System.out.print("File uploaded and saved into database");
                    }
                }
                else if(utype.equals("Peserta"))
                {
                    String sql = "UPDATE PARTICIPANT SET USERIMAGE = ? WHERE USERIC = ? ";
                    statement = conn.prepareStatement(sql);
                    
                    if (inputStream != null) {
                        statement.setBlob(1, inputStream);
                    }
                    statement.setString(2,ic);
                    
                    int row = statement.executeUpdate();
                    if (row > 0) {
                        System.out.print("File uploaded and saved into database");
                    }
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
                System.out.print("You Have Successfully SIGNED UP");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        }
        else
        {
            request.setAttribute("errMessage",saveUser);
            //JOptionPane.showMessageDialog(null,"error password/username");
            //request.getRequestDispatcher("invalidLogin.jsp").forward(request,response);
            response.sendRedirect("index.jsp");
        }
    }
}
