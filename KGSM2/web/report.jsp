
<%@page import="model.ConnectionManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.ReportBean"%>
<%@page import="model.UserBean"%>
<!DOCTYPE html>
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
    margin-right: 10px;
    margin-top: 15px;    /* if you want it vertically middle of the navbar. */
}
.navigation-bar > a {
    vertical-align: top;
    padding-right: 10px;
    padding-left: 10px;
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
	border-top: 1px solid black;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
hr.new3 {
  border-top: 1px dotted gray;
}
div.c {
  text-align: right;
}
</style>
</head>

<body bgcolor="#FBFBFB">
    <div class="topheader"><center><img src="images/walogo.png"/></center><center><h1>KURSUS GERAK SENI MELAYU (KGSM)</h1></center></div>
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
                <a href="listOfParticipant.jsp" >PELAJAR</a>
                <a href="viewPaymentAdmin.jsp">PEMBAYARAN</a>
                <!--<a href="viewReport.jsp" style="color:#2997C1;">LAPORAN</a>-->
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
            <br/><br/><br/>
            <%
            float wholePayment=0;
            try{
            
                ReportBean report = new ReportBean();

                String month = request.getParameter("month");

                report.setMonth(month);

                Connection currentCon = null;
                ResultSet rs = null;
                ResultSetMetaData rsmd = null;
                Statement stmt;
                float tot=0;

                currentCon = ConnectionManager.getConnection();
                stmt = currentCon.createStatement();

                rs = stmt.executeQuery("SELECT CLASSID\n" +
                                        "FROM CLASSES\n" +
                                        "WHERE to_char(CLASSID, 'mm') = '" + month + "'");
                rsmd = rs.getMetaData();
                
                ResultSet rs2 = null;
                ResultSetMetaData rsmd2 = null;
                Statement stmt2 = null;
                while(rs.next())
                {
                    String classID = rs.getString(1);

                    rs2 = stmt2.executeQuery("SELECT A.className, B.classID, A.coachID, C.coachName\n" +
                                            "FROM Classes A, Participation B, Coach C\n" +
                                            "WHERE A.classID = B.classID\n" +
                                            "AND A.coachID = C.coachID\n" +
                                            "AND A.classID = '" + classID + "'");
                    rsmd2 = rs2.getMetaData();
                    
                    ResultSet rs3 = null, rs4 = null;
                    ResultSetMetaData rsmd3 = null, rsmd4 = null;
                    Statement stmt3=null, stmt4=null;
                    while(rs2.next())
                    {
                        String className = rs2.getString(1);
                        String bclassID = rs2.getString(2);
                        String coachID= rs2.getString(3);
                        String coachName = rs2.getString(4);
                        
                        rs3 = stmt3.executeQuery("SELECT COUNT(userID)\n" +
                                                "FROM Participation\n" +
                                                "WHERE classID = (SELECT classID\n" +
                                                                "FROM Classes\n" +
                                                                "WHERE classID = '" + bclassID + "'\n" +
                                                                "AND to_char(classDate, 'mm') = '" + month + "')");
                        while(rs3.next())
                        {
                            int numOfParticipant = rs3.getInt(1);
                            %>

                            <b>ID Kelas: </b> <%= bclassID %><br />
                            <b>Nama Kelas:</b> <%= className %><br />
                            <b>ID jurulatih:</b> <%= coachID %><br />
                            <b>Nama jurulatih:</b> <%= coachName %><br/>
                            <b>Jumlah peserta: </b> <%= numOfParticipant %><br /><br />

                            <table>
                            <tr>
                                <th><center>Bil</center></th>
                                <th><center>ID pengguna</center></th>
                                <th><center>Nama</center></th>
                                <th><center>Status</center></th>
                                <th><center>Jumlah Amaun (RM)</center></th>
                            </tr>
                            <%
                            
                            rs4 = stmt4.executeQuery("SELECT A.userID, A.userName, A.userStatus\n" +
                                                    "FROM Participant A, Participation B\n" +
                                                    "WHERE A.userID = B.userID\n" +
                                                    "AND classID = '" + bclassID + "'");
                            rsmd4 = rs4.getMetaData();
                            int i=1;
                            ResultSet rs5 = null;
                            Statement stmt5=null;
                            while(rs4.next())
                            {
                                String userID = rs4.getString(1);
                                String userName = rs4.getString(2);
                                String userStatus= rs4.getString(3);

                                rs5 = stmt5.executeQuery("SELECT A.amountPay, B.userID, B.classID\n" +
                                                    "FROM Payment A, Participation B\n" +
                                                    "WHERE A.userID = B.userID\n" +
                                                    "AND A.classID = B.classID\n" +
                                                    "AND A.classID = '" + bclassID + "'\n" +
                                                    "AND A.userID = '" + userID + "'");

                                float payment = rs5.getFloat(1);
                                %>
                                <tr>
                                    <td><center><%= i %></center></td>
                                    <td><center><%= userID %></center></td>
                                    <td><center><%= userName %></center></td>
                                    <td><center><%= userStatus %></center></td>
                                    <td><center><%= payment %></center></td>
                                </tr>
                                <%
                                i++;
                                tot += payment;
                            }%>
                            <tr>
                                <th colspan=4><center>JUMLAH:</center></th>
                                <td><center><%= tot %></center></td>
                            </tr>
                            <%
                        }%>
                        </table>
                        <%
                    }
                    wholePayment += tot;
                }%>
                <div class="c">
                    <br /><b>JUMLAH BAYARAN PADA BULAN <%= month %>: RM<%= wholePayment %></b>
                </div>
            <%
            }
            catch(Exception e){
                    System.out.println("UNABLE TO VIEW REPORT " + e);
                    e.printStackTrace();
            }%>
            
            <center>
                <input type="button" style="border:1px solid; background:#0E1557; height:40px; width:105px; border-radius:3px; color:#FFF;" value="Download">
            </center><br />

        <footer>
          <div class="footerbg">
            <center><p>HAKCIPTA TERPELIHARA &copy; 2019 | WARIS ALAM</p></center>
          </div>
        </footer>
</body>
</html>