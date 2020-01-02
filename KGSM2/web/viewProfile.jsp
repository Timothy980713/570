<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="model.ConnectionManager"%>
<%@page import="model.UserBean"%>
<!DOCTYPE html>
<html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>ONE</title>
<style>
body, html {
    height: 100%;
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    color: #4A4A52;
}
.bg {
    background-image: url(images/Backgrounds.jpg);
    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
input[type=text], input[type=password] {
    width: 60%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
button, input[class=btnLogin]{
    background-color: #70c4f1;
    color: white;
    padding: 16px 40px;
    margin: -5px 0;
    border: none;
    cursor: pointer;
    width: 15%;
    border-radius: 25px;
  }
.cancelbtn {
  background-color: #7B0703;
}
button:hover {
    opacity: 0.8;
}
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}
.container {
    padding: 50px;
}
span.psw {
    float: right;
    padding-top: -1000px;
}
.modal {
    display: none; 
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
}
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; 
    border: 1px solid #888;
    width: 80%; 
}
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}
@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 10%;
    }
}
.centered {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    Color: black;
}
.centered1 {
    position: absolute;
    top: 60%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: black;
}
input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}
.cancelbtn {
  float: left;
  width: 50%;
}
.signupbtn {
  position: center;
  width: 50%;
}
 
.close1 {
    position: absolute;
    right: 35px;
    top: 15px;
    font-size: 40px;
    font-weight: bold;
    color: #f1f1f1;
}
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
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
    margin-right: 20px;
    margin-top: 15px;    /* if you want it vertically middle of the navbar. */
}
.navigation-bar > a {
    vertical-align: top;
    padding-right: 10px;
    padding-left: 10px;
    margin-right: 10px;
    margin-left: 10px;
    height: 80px;        /* if you want it to take the full height of the bar */
    line-height: 80px;    /* if you want it vertically middle of the navbar */
    color: #4A4A52;
    text-decoration: none;
    font-weight: bold;
}
.navigation-bar > a:hover{
    vertical-align: top;
    padding-right: 10px;
    padding-left: 10px;
    margin-right: 10px;
    margin-left: 10px;
    height: 80px;        /* if you want it to take the full height of the bar */
    line-height: 80px;    /* if you want it vertically middle of the navbar */
    color: #010B23;
    text-decoration: none;
    font-weight: bold;
}
.formbg {
  padding-top: 1em;
  padding-bottom: 1em;
  background-color:  #f0f5f5;
  border:2px solid #112A54;
  padding-right: 1em;
  padding-left: 1em;
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
.reset{
    width: 100%;  /* i'm assuming full width */ /* change it to desired width */
  padding-top: 10px;
  padding-bottom: 10px;
  background-color: #C3C3C3;
  color: white;
}
hr { 
  display: block;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
  margin-left: auto;
  margin-right: auto;
  border-style: inset;
  border-width: 1px;
} 
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 5px;
  text-align: left;
}
</style>
<script type="text/javascript">
function ConfirmDelete()
{
  var answer = confirm ("Adakah awak yakin untuk tidak sertai kelas?");
  if (answer)
  {   
     alert ( "Anda sudah tidak sertai kelas tersebut" );
     return true;
  }
  else{
    return false;
  }
    }

// -->
</script> 
    </head>
    <body>
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
                <a href="viewClassAdmin.jsp">KELAS</a>
                <a href="listOfParticipant.jsp">PELAJAR</a>
                <a href="viewPaymentAdmin.jsp"  style="color:#2997C1;">PEMBAYARAN</a>
                <!--<a href="viewReport.jsp">LAPORAN</a>-->
            <%} if(currentUser.getUserTypeID()==2){ %>
                <a href="viewProfile.jsp?id=<%= currentUser.getID()%>&typeid=<%= currentUser.getUserTypeID()%>" style="color:#2997C1;">PROFIL</a>
                <a href="viewClassAdmin.jsp" >KELAS</a>
                <a href="viewPaymentAdmin.jsp">PEMBAYARAN</a>
                <a href="contactUs.jsp">HUBUNGI KAMI</a>
            <%} if(currentUser.getUserTypeID()==3) {%>
                <a href="viewProfile.jsp?id=<%= currentUser.getID()%>&typeid=<%= currentUser.getUserTypeID()%>" style="color:#2997C1;">PROFIL</a>
                <a href="viewClass.jsp">KELAS</a>
                <a href="viewPayment.jsp">PEMBAYARAN</a>
                <a href="contactUs.jsp">HUBUNGI KAMI</a>
            <% } %>
            <a href="LogoutServlet">LOG KELUAR</a>
        </nav></center>
<br><br><br>
    <% 
    UserBean userBean = new UserBean();
    Connection currentCon;
    currentCon = null;
    ResultSet r = null;
    Statement stmts;
    
    String id=request.getParameter("id");
    System.out.print(id);
    int typeid=Integer.parseInt(request.getParameter("typeid"));
    System.out.print(typeid);
    try{
        currentCon = ConnectionManager.getConnection();
        stmts = currentCon.createStatement();
        if(typeid==3 ){
            r = stmts.executeQuery("SELECT * FROM PARTICIPANT WHERE USERID='"+id+"'");
            int i=1;
            while(r.next())
            {
                Blob blob = r.getBlob("USERIMAGE");
 
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
                
                userBean.setBase64Image(base64Image);
                String userID = r.getString(1);
                String fullname = r.getString(5);
                String uname = r.getString(4);
                String ic =  r.getString(3);
                String phoneno =  r.getString(6);
                String email =  r.getString(7);
                String pass=  r.getString(2);
                String address=  r.getString(13);
                String status = r.getString(9);
                %>
<form class="formbg" name="resetForm" method="post">
    <center><h>PROFIL</h></center>
	<hr>
	<br>
   <table style="width:100%">
    <tr>
      <th>Gambar </th>
      <td><img src="data:image/jpg;base64,<%= userBean.getBase64Image() %>" width="200" height="200"/><br></td>

    </tr>
    <tr>
      <th>Nama Penuh </th>
      <td><%= fullname %></td>
    </tr>
     <tr>
      <th>Kata Laluan </th>
      <td><%= pass %></td>
    </tr>
    <tr>
      <th>No Kad Pengenalan </th>
      <td><%= ic %></td>
    </tr>
    <tr>
      <th>Alamat </th>
      <td><%= address %></td>
    </tr>
    <tr>
      <th>No Telefon </th>
      <td><%= phoneno %></td>
    </tr>
    <tr>
      <th>Email </th>
      <td><%= email %></td>
    </tr>
    <tr>
      <th>Status </th>
      <td><%= status %></td>
    </tr>
    <tr>
          <td colspan="2"><div class="w3-bar">
                  <center><a href="editProfile.jsp?id=<%= userID %>" class="w3-btn w3-indigo">Sunting</a> </center>
          </td>
    </tr>
    <br>
  </table>

   <%   } 
    }
    if(typeid==2){
              r = stmts.executeQuery("SELECT * FROM COACH WHERE COACHID='"+id+"'");
              int i=1;
              while(r.next())
              {
                Blob blob = r.getBlob("COACHIMAGE");
 
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
                
                userBean.setBase64Image(base64Image);
                String userID = r.getString(2);
                String fullname = r.getString(12);
                String uname = r.getString(4);
                String ic =  r.getString(3);
                String phoneno =  r.getString(6);
                String email =  r.getString(8);
                String pass=  r.getString(7);
                String address=  r.getString(5);

    %>

  <form class="formbg" name="resetForm" method="post">
      <center><h>PROFIL</h></center>
          <hr>
          <br>
     <table style="width:100%">
    <tr>
      <th>Gambar </th>
      <td><img src="data:image/jpg;base64,<%= userBean.getBase64Image() %>" width="200" height="200"/><br></td>

    </tr>
    <tr>
      <th>Nama Penuh </th>
      <td><%= fullname %></td>
    </tr>
     <tr>
      <th>Kata Laluan </th>
      <td><%= pass %></td>
    </tr>
    <tr>
      <th>No Kad Pengenalan </th>
      <td><%= ic %></td>
    </tr>
    <tr>
      <th>Alamat </th>
      <td><%= address %></td>
    </tr>
    <tr>
      <th>No Telefon </th>
      <td><%= phoneno %></td>
    </tr>
    <tr>
      <th>Email </th>
      <td><%= email %></td>
    </tr>
    <tr>
          <td colspan="2"><div class="w3-bar">
                  <center><a href="editProfile.jsp?id=<%= userID %>" class="w3-btn w3-indigo">Sunting</a></td></center>
    </tr>
                  <br>
  </table>
  <%    } 
    }  
}
catch(Exception e){
    e.printStackTrace();
}%>
<br>
	<br>
	<hr>
	<center><h>KELAS</h></center>
	<hr>
	<br>
	<div class="w3-container">
	<table class="w3-table-all">
    <thead>
      <center><tr class="w3-light-blue">
        <th>Kelas ID</th>
        <th>Nama Kelas</th>
        <th>Tempat Kelas</th>
		<th>Hari Kelas</th>
		<th>Masa Kelas</th>
		<th>Kategori Kelas</th>
		<th>Bayaran Kelas</th>
                <% if(currentUser.getUserTypeID()==3 ){ %>
		<th><center>Butang</center></th>
                       <% }%>
      </tr>
    </thead>
   
    <%
        Connection currentCons = null;
        ResultSet rs,rs1 = null;
        Statement stmt;
        int i =1;
        try{
            currentCons = ConnectionManager.getConnection();
            stmt = currentCons.createStatement();
            if(typeid==3 ){ 
            rs = stmt.executeQuery("SELECT PC.CLASSID,CLASSNAME,CLASSVENUE,CLASSDATE,CLASSTIME,CLASSCATEGORY,CLASSPAYMENT FROM CLASSES C, PARTICIPANT P, PARTICIPATION PC WHERE P.USERID= PC.USERID AND PC.CLASSID=C.CLASSID AND PC.USERID='"+id+"'");      
            while(rs.next())
            {
                String classId= rs.getString(1);
                String className = rs.getString(2);
                String classVenue = rs.getString(3);
                String classDate = rs.getString(4);
                String classTime = rs.getString(5);
                String classCategory = rs.getString(6);
                float classPayment = rs.getFloat(7);
                
                System.out.print(classId);
                System.out.print(className);
                System.out.print(classVenue);
                System.out.print(classDate);
                System.out.print(classTime);
                System.out.print(classCategory);
                System.out.print(classPayment);
        %>
        <tr>
            <td><center><%= i %></center></td>
            <td><center><%= className %></center></td>
            <td><center><%= classVenue %></center></td>
            <td><center><%= classDate %></center></td>
            <td><center><%= classTime %></center></td>
            <td><center><%= classCategory %></center></td>
            <td><center><%= classPayment %></center></td>
            <td><div class="w3-bar">
		<center><a onclick="ConfirmDelete()" href="DeleteParticipation.jsp?id=<%=id %>&classid=<%= classId %>&typeid=<%= typeid %>"  class="w3-btn w3-indigo">Tidak Sertai</a>
		</div></td></center>
        </tr>
            <% i++;} }
            
            if(typeid==2){ 
            rs1 = stmt.executeQuery("SELECT CLASSNAME,CLASSVENUE,CLASSDATE,CLASSTIME,CLASSCATEGORY,CLASSPAYMENT FROM CLASSES CL, COACH C WHERE C.COACHID=CL.COACHID AND COACHID='"+id+"'");              
            
            while(rs1.next())
            {
                String className1 = rs1.getString(1);
                String classVenue1 = rs1.getString(2);
                String classDate1 = rs1.getString(3);
                String classTime1 = rs1.getString(4);
                String classCategory1 = rs1.getString(5);
                float classPayment1 = rs1.getFloat(6);
                
                System.out.print(className1);
                System.out.print(classVenue1);
                System.out.print(classDate1);
                System.out.print(classTime1);
                System.out.print(classCategory1);
                System.out.print(classPayment1);
        %>
        <tr>
            <td><center><%= i %></center></td>
            <td><center><%= className1 %></center></td>
            <td><center><%= classVenue1 %></center></td>
            <td><center><%= classDate1 %></center></td>
            <td><center><%= classTime1 %></center></td>
            <td><center><%= classCategory1 %></center></td>
            <td><center><%= classPayment1 %></center></td>
         
        </tr>
            <% i++;} 
    } 
}
catch(Exception e){
     e.printStackTrace();
} %>
  </table>
</div>
<br>
        </form>
      </div>

        <footer>
          <div class="footerbg">
            <center><p>HAKCIPTA TERPELIHARA &copy; 2019 | WARIS ALAM</p></center>
          </div>
        </footer>
</body>
</html
