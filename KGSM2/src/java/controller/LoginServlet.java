/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author tiqah isza
 */

import model.*;
//import java.io.IOException;
//import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet{

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)    
                        throws ServletException, java.io.IOException { 
        try{
            UserBean user = new UserBean();
            
            String utype = request.getParameter("utype");
            System.out.print(utype);
            
            String uname = request.getParameter("userName");
            System.out.print(uname);
            
            String upass = request.getParameter("userPass");
            System.out.print(upass);
            
            user.setUserType(utype);
            user.setName(uname);
            user.setPass(upass);
            
            /*if(utype.equals("Pengurus") && uname.equals("admin") && upass.equals("admin123"))
            {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);
                request.getRequestDispatcher("homeAdmin.jsp").forward(request,response);
            }*/
            
            //UserDAO loginDao = new UserDAO();
            user = UserDAO.login(user);
            //boolean valid = loginDao.login(user);

            if (user.isValid()){
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);
                request.getRequestDispatcher("home.jsp").forward(request,response);
                
                //response.sendRedirect("home.jsp"); // logged-in page
            }
            else
            {
                request.setAttribute("errMessage",user.isValid());
                //JOptionPane.showMessageDialog(null,"error password/username");
                //request.getRequestDispatcher("index.jsp").forward(request,response);
                response.sendRedirect("index.jsp");
            }
        }
        catch (Throwable e){
            System.out.println(e);
            e.printStackTrace();
        }
    }
}
  
