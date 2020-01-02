/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import java.sql.*;
/**
 *
 * @author tiqah isza
 */
public class PaymentDAO {
    
    
    public String makePayment(String paymentID){
    
        Connection currentCon;
        PreparedStatement pstatement;
        
        try {
                // connect to DB
                currentCon = ConnectionManager.getConnection();
                pstatement = currentCon.prepareStatement("UPDATE PAYMENT \n" +
                                                        "SET DATEPAY = SYSDATE, STATUSPAY ='PAID'\n" +
                                                        "WHERE PAYMENTID = ?");
                pstatement.setString(1, paymentID);

                int i = pstatement.executeUpdate();
                System.out.print("dao" + i);
                String msg;
                if(i!=0){ 
                    msg="Status SUCCESSFULLY UPDATED";
                    System.out.println("<font size='6' color=blue>" + msg + "</font>"); 
                    return "SUCCESS";
                }
                else{  
                    msg="Failed to UPDATE the status";
                    System.out.println("<font size='6' color=blue>" + msg + "</font>");
                }
        }
        catch(SQLException e){
                e.printStackTrace();
        }
        return "Failed";
    }
}
