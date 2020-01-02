<%-- 
    Document   : viewOneClassParticipant
    Created on : Dec 26, 2019, 7:49:33 AM
    Author     : User
--%>


<%@page import="model.ClassBean"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="model.UserBean"%>
<%@page import="model.ConnectionManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ONE</title>

<style>
body, html {
    height: 100%;
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    color: #4A4A52;
}
input[type=text], input[type=password] {
    width: 60%;
    padding: 12px 20px;
    box-sizing: border-box;
}
.bg {
    background-image: url(images/Backgrounds.jpg);
    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

.imgcontainer {
    text-align: center;
    position: relative;
}
.container {
    padding: 50px;
}
.centered {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: black;
}
.centered1 {
    position: absolute;
    top: 60%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: black;
}

.topnav{
  text-align: center;
}
.navigation-bar {
    width: 100%;  /* i'm assuming full width */
    height: 80px; /* change it to desired width */
/* change to desired color */
}
.logo {
    display: inline-block;
    vertical-align: top;
    width: 50px;
    height: 50px;
    margin-right: 10px;
    margin-top: 15px;    /* if you want it vertically middle of the navbar. */
}
.navigation-bar > a {
    vertical-align: top;
    padding-right: 20px;
    padding-left: 20px;
    margin-right: 10px;
    margin-left: 20px;
    height: 80px;        /* if you want it to take the full height of the bar */
    line-height: 80px;    /* if you want it vertically middle of the navbar */
    color: #4A4A52;
    text-decoration: none;
    font-weight: bold;
}

.navigation-bar > a:hover{
    vertical-align: top;
    padding-right: 20px;
    padding-left: 20px;
    margin-right: 10px;
    margin-left: 20px;
    height: 80px;        /* if you want it to take the full height of the bar */
    line-height: 80px;    /* if you want it vertically middle of the navbar */
    color: #010B23;
    text-decoration: none;
    font-weight: bold;
}


.formbg {
  padding-top: 1em;
  padding-bottom: 1em;
  background-color:  white;
  padding-right: 1em;
}
.topheader{
  width: 100%;  /* i'm assuming full width */ /* change it to desired width */
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #70c4f1;/* change to desired color */
  color: white;
}
.footerbg{
  width: 100%;  /* i'm assuming full width */ /* change it to desired width */
  padding-top: 10px;
  padding-bottom: 10px;
  background-color: #C3C3C3;
  color: white;
}
</style>
<script language="JavaScript" type="text/javascript" src="view/js/registration.js"></script>
</head>
<body bgcolor="#FBFBFB">
    <div class="topheader"><center><img src="images/walogo.png"/><h1>KURSUS GERAK SENI MELAYU (KGSM)</h1></center></div>
        <div class="container">
        <center><nav class="navigation-bar">
            <%UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser"); %>
            <% if(currentUser.getName()==null) {
                session.invalidate(); 
                response.sendRedirect("index.jsp");
            } %>
            <h4>Hello, <%= currentUser.getFullName() %>!</h4> 
            <a href="home.jsp">HALAMAN UTAMA</a>
            <% if(currentUser.getUserTypeID()==1){ %>
                <a href="viewProfileAdmin.jsp">PROFIL</a>
                <a href="viewClassAdmin.jsp"  style="color:#2997C1;">KELAS</a>
                <a href="listOfParticipant.jsp">PELAJAR</a>
                <a href="viewPaymentAdmin.jsp">PEMBAYARAN</a>
                <!--<a href="viewReport.jsp">LAPORAN</a>-->
            <%} if(currentUser.getUserTypeID()==2){ %>
                <a href="viewProfile.jsp?id=<%= currentUser.getID()%>&typeid=<%= currentUser.getUserTypeID()%>">PROFIL</a>
                <a href="viewClassAdmin.jsp" style="color:#2997C1;">KELAS</a>
                <a href="viewPaymentAdmin.jsp">PEMBAYARAN</a>
                <a href="contactUs.jsp">HUBUNGI KAMI</a>
            <%} if(currentUser.getUserTypeID()==3) {%>
                <a href="viewProfile.jsp?id=<%= currentUser.getID()%>&typeid=<%= currentUser.getUserTypeID()%>">PROFIL</a>
                <a href="viewClass.jsp" style="color:#2997C1;">KELAS</a>
                <a href="viewPayment.jsp" >PEMBAYARAN</a>
                <a href="contactUs.jsp">HUBUNGI KAMI</a>
            <% } %>
            <a href="LogoutServlet">LOG KELUAR</a>
        </nav></center>
<br><br><br><br><br><br>
<form class="formbg" name="resetForm" method="post">
    <%@page import="java.sql.*" %> 
    <%
        String id = request.getParameter("id");
        
	Connection currentCon = null;
        ResultSet rs = null; 
        Statement stmt;
        ResultSetMetaData rsmd = null; 
        try
        {   ClassBean classBean = new ClassBean();
            currentCon = ConnectionManager.getConnection ();
            stmt = currentCon.createStatement();

            rs = stmt.executeQuery("SELECT * FROM CLASSES WHERE CLASSID ='"+id+"'");

            int i = 1;
            while(rs.next())
            {
                Blob blob = rs.getBlob("CLASSIMAGE");
 
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                inputStream.close();
                outputStream.close();
                
                classBean.setBase64Image(base64Image);
                String class_ID = rs.getString(2);
                String class_name = rs.getString(3); 
                String class_date = rs.getString(4);
                String class_time = rs.getString(5);
                String class_venue = rs.getString(6);
                String class_category = rs.getString(8);
                String class_payment = rs.getString(9);
                String coach_id = rs.getString(10);
                String class_desc = rs.getString(11); 
                %>
                <table  border=1px style="width:70%" align="center">
                    <h2><center><b>Kelas <%= class_name %></b></center></h2>
                    <center><img src="data:image/jpg;base64,<%= classBean.getBase64Image() %>" width="150" height="150"/></center>
                    <tr>
                        <td align="right"><b>Kelas ID :</b></td>
                        <td><%= class_ID %></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Nama Kelas :</b></td>
                        <td><%= class_name %></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Kategori Kelas :</b></td>
                        <td><%= class_category %></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Lokasi Kelas :</b></td>
                        <td><%= class_venue %></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Tarikh :</b></td>
                        <td><%= class_date %></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Waktu :</b></td>
                        <td><%= class_time %></td>
                    </tr>
                    <tr>
                        <td align="right"><b> Yuran Kelas (RM) :</b></td>
                        <td><%= class_payment %></td>
                    </tr>
                    <tr>
                        <td align="right"><b> ID Pengajar :</b></td>
                        <td><%= coach_id %></td>
                    </tr>
                    <tr>
                        <td align="right"><b>Butiran Kelas :</b></td>
                        <td><%= class_desc %></td>
                    </tr>
                <%
            }
            rs.close();
            stmt.close();
            currentCon.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        %>
    <br>
    <tr align="center">
        <td>&nbsp;</td>
        <% if(currentUser.getUserTypeID()==3){ %>
        <td>
            <br>
                <a href="participationServlet?uid=<%= currentUser.getID()%>&cid=<%= id %>"><input type="button" style="border:1px solid; background:#008F14; height:40px; width:105px; border-radius:3px; color:#FFF;" value="Daftar"></a>
                
                <input type="button" style="border:1px solid; background:#0E1557; height:40px; width:105px; border-radius:3px; color:#FFF;" value="Kembali"  onClick="javascript:history.back()">
        </td>
        <% } %>
    </tr>
    
    </table>
</form>
   
 
            </div>
        
        </center>
      </div>
    </div>
</div>
</div>

<script>
</script>
        <footer>
          <div class="footerbg">
            <center><p>HAKCIPTA TERPELIHARA &copy; 2019 | WARIS ALAM</p></center>
          </div>
        </footer>
</body>
</html