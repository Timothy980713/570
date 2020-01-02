<%-- 
    Document   : deleteClass
    Created on : Dec 27, 2019, 5:11:52 AM
    Author     : tiqah isza
--%>

<%@page import="model.ConnectionManager"%>
<%@page import="model.ClassBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %> 
        <%  ClassBean classBean = new ClassBean();
            Connection currentCon = null;
            ResultSet rs = null; 
            Statement stmt=null;
            ResultSetMetaData rsmd = null; 
            try{
                    String id=request.getParameter("id");
                    currentCon = ConnectionManager.getConnection ();
                    stmt = currentCon.createStatement();

                    rs = stmt.executeQuery("DELETE CLASSES WHERE CLASSID ='"+id+"'");
     
                    System.out.println("Record is deleted from CLASSES table!");
            } 
            catch (SQLException e) 
            {      
                System.out.println(e.getMessage());    
            } 
            finally 
            {      
                    if (stmt!= null) 
                    {     
                        stmt.close();
                    }    
            }
            %>
            <script>
                windows.alert("CLASS HAS SUCCESSFULLY DELETED!");
                windows.location('viewClass.jsp');
            </script>
    
    </body>
</html>
