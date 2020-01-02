/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
/**
 *
 * @author User
 */

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConnectionManager;


public class DeleteClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			
			PrintWriter out=response.getWriter();
			response.setContentType("text/html");
			
			
			String class_ID = request.getParameter("CLASSID");
			
		 Connection currentCon = null;
                 ResultSet rs = null; 
                 Statement stmt;
                 ResultSetMetaData rsmd = null; 
			
			
			
			try {
	    	currentCon = ConnectionManager.getConnection ();
                stmt = currentCon.createStatement();
	        int i = stmt.executeUpdate("delete from CLASSES where CLASSID="+ class_ID);
	        
	        if(i!=0){
	        	out.println("SuccessfulLy deleted the class");

	      
	        	
	                }
		        }
			

	        catch (Exception e2) {
	            System.out.println(e2);
	        }
	 
	        out.close();
			
	}
}