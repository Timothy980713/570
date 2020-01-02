<%@page import="model.UserBean"%>
<%@page import="model.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


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
    <div class="topheader"><center><img src="images/walogo.png"></center><center><h1>KURSUS GERAK SENI MELAYU (KGSM)</h1></center></div>
      <body bgcolor="#FBFBFB">
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
                <a href="viewClassAdmin.jsp"  style="color:#2997C1;">KELAS</a>
                <a href="viewPaymentAdmin.jsp">PEMBAYARAN</a>
                <a href="contactUs.jsp">HUBUNGI KAMI</a>
            <%} if(currentUser.getUserTypeID()==3) {%>
                <a href="viewProfile.jsp?id=<%= currentUser.getID()%>&typeid=<%= currentUser.getUserTypeID()%>">PROFIL</a>
                <a href="viewClass.jsp" >KELAS</a>
                <a href="viewPayment.jsp" >PEMBAYARAN</a>
                <a href="contactUs.jsp">HUBUNGI KAMI</a>
            <% } %>
            <a href="LogoutServlet">LOG KELUAR</a>
        </nav></center>
<br/><br/><br/><br/><br/>

<form class="formbg" name="resetForm" >
    
        <h2><center><b>SENARAI KELAS</b></center></h2>
        <% if(currentUser.getUserTypeID()==1) { %>
        <p align="right"><a href="addClass.jsp"><input type="button" style="border:1px solid; margin-right:120px; background:#E29607; height:40px; width:105px; border-radius:3px; color:#FFF;" value="+ KELAS"></a></p>
        <% } %>
        <center>
        <table  border=1 style="width:80%" align="center" >
    
        <tr>
            <td><center><b>NO</b></center></td>
            <td><center><b>NAMA KELAS</b></center></td>
            <td><center><b>SENARAI PESERTA</b></center></td>
            <td><center><b></b></center></td>
        </tr>
    
        <%@page import="java.sql.*" %> 
        <%
            Connection currentCon = null;
            ResultSet rs = null; 
            Statement stmt;
            ResultSetMetaData rsmd = null; 
            try
            {
                currentCon = ConnectionManager.getConnection ();
                stmt = currentCon.createStatement();

                rs = stmt.executeQuery("SELECT * FROM CLASSES");

                int i = 1;
                while(rs.next())
                {
                    String class_id = rs.getString(2);
                    String class_name = rs.getString(3);
                    %>
                    <tr>
                        <td><center><%= i %></center></td>
                        <td><center><%= class_name %></center></td>
                        <td>
                            <a href="viewClassParticipantAdmin.jsp?id=<%=class_id %>"><center><input type="button" style="border:1px solid; background:#008F14; height:40px; width:105px; border-radius:3px; color:#FFF;" value="LIHAT"></center></a>
                        </td>
                        <td>
                            <a href="viewOneClass.jsp?id=<%=class_id %>"><center><input type="button" style="border:1px solid; background:#0E1557; height:40px; width:105px; border-radius:3px; color:#FFF;" value="LIHAT KELAS">
                            <%if(currentUser.getUserTypeID()==1){%>
                            <a href="editClassAdmin.jsp?CLASSID=<%=rs.getString("CLASSID")%>"><center><input type="button" style="border:1px solid; background:#0E1557; height:40px; width:105px; border-radius:3px; color:#FFF;" value="KEMASKINI"></center></a>
                            <a href="DeleteClassServlet?CLASSID=<%=rs.getString("CLASSID")%>"><center><input type="button" onclick="ConfirmDelete()"style="border:1px solid; background:#900; height:40px; width:105px; border-radius:3px; color:#FFF;" value="BUANG"></center></a>
                            <% }else{ %> </td> <% } %>
                        </td>
                    </tr>
                    <%
                    i++;
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
    </table>
</form>
</div>
</div>


<script>
function ConfirmDelete()
{
    var x = confirm("Are you sure you want to delete?");
    if (x)
      return true;
  else
    return false;

}
</script>
        <footer>
          <div class="footerbg">
            <center><p>HAKCIPTA TERPELIHARA &copy; 2019 | WARIS ALAM</p></center>
          </div>
        </footer>
</body>
