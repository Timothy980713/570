/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserBean;
import model.ProfileDAO;
/**
 *
 * @author Win8
 */
public class ProfileServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)    
                        throws ServletException, java.io.IOException { 
                
        ProfileDAO editDAO = new ProfileDAO();
        UserBean user = new UserBean();
        
        String ps = request.getParameter("currentPassword");
        user.setPass(ps);
        
        int ut = Integer.parseInt(request.getParameter("userType"));
        System.out.print(ut);
        user.setID(request.getParameter("id"));
        user.setFullName(request.getParameter("userName"));
        //user.setPass(request.getParameter("psw"));
        user.setIC(request.getParameter("userIC"));
        user.setEmail(request.getParameter("userEmail"));
        user.setPhoneNo(request.getParameter("userPhoneNo"));
        user.setAddress(request.getParameter("userAddress"));
        user.setUserTypeID(Integer.parseInt(request.getParameter("userType")));
        
        String updateUser = editDAO.updateUser(user);
        if(updateUser.equals("SUCCESS"))
        {
            System.out.print("Your PROFILE Have Successfully UPDATED");
            
                request.getRequestDispatcher("home.jsp").forward(request,response);
           
        }
        else
        {
            request.setAttribute("errMessage",updateUser);
            //JOptionPane.showMessageDialog(null,"error password/username");
            //request.getRequestDispatcher("invalidLogin.jsp").forward(request,response);
            response.sendRedirect("editProfile.jsp");
        }
        }
    }
