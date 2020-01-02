/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tiqah isza
 */
public class LogoutServlet extends HttpServlet {
    
    /*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);
        
        if(session !=null)
        {
            session.invalidate();
            request.setAttribute("errMessage", "You have logged out successfully");
            //response.sendRedirect("login.jsp");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
            System.out.println("Logged out");
        }
        //session.Destroy();
    }*/
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException {  
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
              
            request.getRequestDispatcher("index.jsp").include(request, response);  
              
            HttpSession session=request.getSession();  
            session.invalidate();  
              
            out.print("You are successfully logged out!");  
              
            out.close();
    }
}
