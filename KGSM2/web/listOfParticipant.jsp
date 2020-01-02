<%@page import="model.UserBean"%>
<%@page import="model.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ONE</title>

</head>
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
    <div class="topheader"><center><img src="images/walogo.png"></center><center><h1>KURSUS GERAK SENI MELAYU (KGSM)</h1></center></div>
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
                <a href="viewClassAdmin.jsp" >KELAS</a>
                <a href="listOfParticipant.jsp" style="color:#2997C1;">PELAJAR</a>
                <a href="viewPaymentAdmin.jsp">PEMBAYARAN</a>
                <!--<a href="viewReport.jsp">LAPORAN</a>-->
            <%} if(currentUser.getUserTypeID()==2){ %>
                <a href="viewProfile.jsp?id=<%= currentUser.getID()%>&typeid=<%= currentUser.getUserTypeID()%>">PROFIL</a>
                <a href="viewClassAdmin.jsp">KELAS</a>
                <a href="viewPaymentAdmin.jsp">PEMBAYARAN</a>
                <a href="contactUs.jsp">HUBUNGI KAMI</a>
            <%} if(currentUser.getUserTypeID()==3) {%>
                <a href="viewProfile.jsp?id=<%= currentUser.getID()%>&typeid=<%= currentUser.getUserTypeID()%>">PROFIL</a>
                <a href="viewClass.jsp">KELAS</a>
                <a href="viewPayment.jsp">PEMBAYARAN</a>
                <a href="contactUs.jsp">HUBUNGI KAMI</a>
            <% } %>
            <a href="LogoutServlet">LOG KELUAR</a>
        </nav></center>
        <br><br><br><br><br><br>
                    
    <table  border=1px style="width:70%" align="center">
        <h2><center><b>SENARAI NAMA PESERTA</b></center></h2>
        <br/>
        <center>
        <form action="listOfParticipant.jsp" method="post">
            CARI PESERTA: <input type="text" name="search"> 
            <input type="submit" value="CARI">
        </form>
        </center>
            <%@page import="java.sql.*" %> 
            <%
                String search = request.getParameter("search");
                Connection currentCon = null;
                ResultSet rs = null; 
                Statement stmt;
                ResultSetMetaData rsmd = null; 
                try
                {
                    currentCon = ConnectionManager.getConnection ();
                    stmt = currentCon.createStatement();

                    rs = stmt.executeQuery("SELECT * FROM PARTICIPANT WHERE USERID LIKE '%"+search+"%' OR USERNAME LIKE '%"+search+"%' OR USERFULLNAME LIKE '%"+search+"%'"
                            + "OR USERPASSWORD LIKE '%"+search+"%' OR USERIC LIKE '%"+search+"%' OR USERPHONENO LIKE '%"+search+"%'"
                            + "OR USEREMAIL LIKE '%"+search+"%' OR USERADDRESS LIKE '%"+search+"%' OR USERSTATUS LIKE '%"+search+"%' ");

                    int i = 1;
                    if(rs.next())
                    {    
                        %>
                        <table  border=1 style="width:80%" align="center">
                        <br><br>
                        <tr>
                            <td><center><b>NO</b></center></td>
                            <td><center><b>ID PENGGUNA</b></center></td>
                            <td><center><b>NAMA PENGGUNA</b></center></td>
                            <td><center><b>NAMA PENUH</b></center></td>
                            <td><center><b>KATA LALUAN</b></center></td>
                            <td><center><b>NOMBOR IC</b></center></td>
                            <td><center><b>NOMBOR TELEFON</b></center></td>
                            <td><center><b>EMAIL</b></center></td>
                            <td><center><b>ALAMAT</b></center></td>
                            <td><center><b>STATUS</b</center></td>
                            <td>&nbsp;</td>
                        </tr>
                        <%
                        while(rs.next())
                        {
                            String userID = rs.getString(1);
                            String userName = rs.getString(4);
                            String userFName = rs.getString(5);
                            String userPass= rs.getString(2);
                            String userIC = rs.getString(3);
                            String userPhone = rs.getString(6);
                            String userEmail = rs.getString(7);
                            String userAddress = rs.getString(13);
                            String userStatus = rs.getString(9);
                            String userTypeID = rs.getString(12);
                            %>
                            <tr>
                                <td><center><%= i %></center></td>
                                <td><center><%= userID %></center></td>
                                <td><center><%= userName %></center></td>
                                <td><center><%= userFName %></center></td>
                                <td><center><%= userPass %></center></td>
                                <td><center><%= userIC %></center></td>
                                <td><center><%= userPhone %></center></td>
                                <td><center><%= userEmail %></center></td>
                                <td><center><%= userAddress %></center></td>
                                <td><center><%= userStatus %></center></td>
                                <td>
                                    <div class="w3-bar">
                                        <center><a href="viewProfile.jsp?id=<%= userID %>&typeid=<%= userTypeID %>" class="w3-btn w3-indigo">Lihat Profil</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                            i++;
                        }
                        rs.close();
                        stmt.close();
                        currentCon.close();
                    }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }%>
                </table>
                </div>
        <footer>
          <div class="footerbg">
            <center><p>HAKCIPTA TERPELIHARA &copy; 2019 | WARIS ALAM</p></center>
          </div>
        </footer>
</body>
</html