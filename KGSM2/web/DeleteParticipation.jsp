<%-- 
    Document   : DeleteParticipation
    Created on : Jan 1, 2020, 12:51:34 AM
    Author     : Win8
--%>

<%@page import="model.ConnectionManager"%>
<%@page import="model.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONE</title>
    </head>
    <body>
        <%@page import="java.sql.*" %> 
        <%  UserBean user = new UserBean();
            Connection currentCon = null;
            ResultSet rs; 
            Statement stmt=null;
            ResultSetMetaData rsmd = null; 
            try{
                    String id=request.getParameter("id");
                    String classid=request.getParameter("classid");
                    int typeid=Integer.parseInt(request.getParameter("typeid"));
                    currentCon = ConnectionManager.getConnection ();
                    stmt = currentCon.createStatement();

                    rs = stmt.executeQuery("DELETE from PARTICIPATION where CLASSID='"+ classid+"' AND USERID='"+id+"'");
     
                    System.out.println("Record is deleted from PARTICIPATION table!");
                     response.sendRedirect("viewProfile.jsp?id="+id+"&typeid="+typeid);
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
                windows.alert("PARTICIPATION HAS SUCCESSFULLY DELETED!");
                windows.location('viewProfile.jsp');
            </script>
    
    </body>
</html>

