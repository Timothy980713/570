<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.ClassBean"%>
<%@page import="model.UserBean"%>
<%@page import="model.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
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
input[type=date] {
	width: 50%;
	padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
input[type=time] {
	width: 10%;
	padding: 10px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
input[type=textarea] {
  width: 100%;
  height: 120px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  background-color: #ffffff;
  font-size: 16px;
  resize: none;
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
input[type=text]:focus, input[type=password]:focus, input[type=textarea]:focus, input[type=date]:focus, input[type=time]:focus {
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
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
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
                <a href="viewProfileAdmin.jsp"">PROFIL</a>
                <a href="viewClassAdmin.jsp"  style="color:#2997C1;">KELAS</a>
                <a href="listOfParticipant.jsp">PELAJAR</a>
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
            <form class="formbg" name="addClassForm" method="post" action="addClassServlet" enctype='multipart/form-data'>
                <center>
                    <table>
                        <tr>    
                            <td colspan="2"><center>
                                <input type="file" name="photo" size="50"/><br></center>
                            <td>
                        </tr>
                            <tr>
                                <td width="30%" align="right">ID Kelas :</td>
                                <td width="70%"><input type="text" id="txtbox" name="class_ID" placeholder="ID Kelas" style="width:80%; " required><br></td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">Nama Kelas :</td>
                                <td width="70%"><input type="text" id="txtbox" name="class_Name" placeholder="Nama Kelas" style="width:80%; " required><br></td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">Lokasi Kelas :</td>
                                <td width="70%"><input type="text" id="txtbox" name="class_Venue" placeholder="Lokasi Kelas"   style="width:80%; " required><br></td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">Tarikh :</td>
                                <td width="70%"><input type="text" id="txtbox" name="class_Date" placeholder="Tarikh"  style="width:80%; " required><br></td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">Masa :</td>
                                <td width="70%"><input type="text" id="txtbox" name="class_Time" placeholder="Masa" style="width:80%; " required></td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">Bayaran Kelas :</td>
                                <td width="70%"><input type="text" id="txtbox" name="class_Payment" placeholder="Bayaran"  style="width:80%; " required><br></td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">Maklumat Kelas :</td>
                                <td width="70%"><input type="textarea" id="txtbox" name="class_Desc" placeholder="Maklumat Kelas" style="width:80%;" required><br></td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">ID Pengajar:</td>
                                <td width="70%">
                                <% 
                                    UserBean userBean = new UserBean();
                                    Connection currentCon = null;
                                    ResultSet rs = null;
                                    Statement stmt;
                                    ResultSetMetaData rsmd = null; 
                                    try
                                    {
                                        currentCon = ConnectionManager.getConnection ();
                                        stmt = currentCon.createStatement();

                                        rs = stmt.executeQuery("SELECT COACHID, COACHNAME FROM COACH");
                                            
                                        int i = 1;
                                        while(rs.next())
                                        {
                                            String coachID = rs.getString("COACHID");
                                            String coachName = rs.getString("COACHNAME");
                                            %>
                                    <input type="radio" id="txtbox" name="coach_ID" id ="coach" value =<%= coachID %>><%= coachName %>  
                                        <%
                                        }
                                    }
                                    catch(Exception e){
                                        System.out.println("View Coach Has Failed: An exception has occured! " + e);
                                        e.printStackTrace();
                                    }%>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">Kategori Kelas :</td>
                                <td width="70%">
                                    <input type="radio" name="class_Category" value="Kanak-Kanak"> Kanak-kanak
                                    <input type="radio" name="class_Category" value="Dewasa"> Dewasa
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" >
                                    <center>
                                    <input type="submit" style="border:1px solid; background:#0E1557; height:40px; width:105px; border-radius:3px; color:#FFF;" 
    name="update" id="btnnav" value="Tambah Kelas">
                                    <input type="button" style="border:1px solid; background:#900; height:40px; width:105px; border-radius:3px; color:#FFF;" value="Batal">
                                    </center>
                                </td>
                            </tr>
                    </table>
                </center>
            </form>
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