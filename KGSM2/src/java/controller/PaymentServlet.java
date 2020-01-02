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
import model.PaymentDAO;
import model.UserBean;

/**
 *
 * @author tiqah isza
 */
public class PaymentServlet extends HttpServlet{

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)    
                        throws ServletException, java.io.IOException { 
            PaymentDAO paymentDAO = new PaymentDAO();
        
            String pay; 
            String paymentID = request.getParameter("paymentID");  
            System.out.print(paymentID);
            
            pay = paymentDAO.makePayment(paymentID);
            System.out.print(pay);
            if(pay.equals("SUCCESS"))
            {
                System.out.print("You Have Successfully SIGNED UP");
                request.getRequestDispatcher("viewPayment.jsp").forward(request,response);
            }
            else
            {
                request.setAttribute("errMessage",pay);
                //JOptionPane.showMessageDialog(null,"error password/username");
                //request.getRequestDispatcher("invalidLogin.jsp").forward(request,response);
                response.sendRedirect("index.jsp");
            }
    }
}
