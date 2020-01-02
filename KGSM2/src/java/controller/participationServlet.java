/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ClassBean;
import model.ClassDAO;
import model.ConnectionManager;
import model.UserBean;

/**
 *
 * @author tiqah isza
 */
public class participationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            ClassBean classes = new ClassBean();
            UserBean userbean = new UserBean();
            
            String userid = request.getParameter("uid");
            String classid = request.getParameter("cid");
            
            classes.setclass_ID(classid);
            userbean.setID(userid);
            
            ResultSet rs = null, rs2 = null;
            Connection conn = null; 
            PreparedStatement statement, statement3, statement4;
            conn = ConnectionManager.getConnection();
            String sql = "INSERT INTO PARTICIPATION(USERID, CLASSID, DATEOFPARTICIPATION) VALUES (?,?,SYSDATE)";
            statement = conn.prepareStatement(sql);
            statement.setString(1,userid);
            statement.setString(2, classid);  
                    
            int row = statement.executeUpdate();
            Statement statement2 = conn.createStatement();
            
            if (row > 0) {
                String sql2 = "SELECT CLASSPAYMENT FROM CLASSES WHERE CLASSID ='"+classid+"'";
                rs = statement2.executeQuery(sql2);
                    while(rs.next())
                    {
                        float pay = rs.getFloat("CLASSPAYMENT");
                        System.out.print(pay);
                        String sql3 ="INSERT INTO PAYMENT(DATEPAY, STATUSPAY, CATEGORYPAY, AMOUNTPAY, USERID, CLASSID) VALUES(SYSDATE,'UNPAID','Yuran Penyertaan',?,?,?)";
                        statement3 = conn.prepareStatement(sql3);
                        statement3.setFloat(1, pay); 
                        statement3.setString(2, userid); 
                        statement3.setString(3, classid); 
                        
                        int row2 = statement3.executeUpdate();
                        if(row2 > 0)
                        {
                            String sql4 = "SELECT NO FROM PAYMENT WHERE CLASSID ='"+classid+"' AND USERID ='"+userid+"'";
                            rs2 = statement2.executeQuery(sql4);
                            while(rs2.next())
                            {
                                int no = rs2.getInt("NO");
                                System.out.print(pay);
                                String pyid = "PY" + no;
                                String sql5 ="UPDATE PAYMENT SET PAYMENTID = ? WHERE NO = ?";
                                statement4 = conn.prepareStatement(sql5);
                                statement4.setString(1, pyid); 
                                statement4.setInt(2, no);
                                
                                int row3 = statement4.executeUpdate();
                                if(row2 > 0)
                                {
                                    System.out.print("File uploaded and saved into database");
                                    response.sendRedirect("viewClass.jsp"); 
                                }
                            }
                        }
                    }
            }
            else{
                    response.sendRedirect("viewOneClass.jsp?id="+classid);
            }
        }
        catch (SQLException ex) { 
            ex.printStackTrace();
        } 
    }   
}
