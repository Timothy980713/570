<%-- 
    Document   : index
    Created on : Dec 23, 2019, 3:43:41 PM
    Author     : tiqah isza
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>ONE</title>
<link rel="shortcut icon" href="images/eureka.ico"/>
<style>
body, html {
	height: 100%;
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}
.bg {
	background-image: url(images/Backgrounds.jpg);
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
button, input[class=btnLogin]{
    background-color: #0D7A76;
    color: white;
    padding: 16px 40px;
    margin: -5px 0;
    border: none;
    cursor: pointer;
    width: 100%;
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
	Color: black;
}
input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}
.cancelbtn, .signupbtn {
  float: left;
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
</style>

<!--<script language="JavaScript" type="text/javascript" src="view/js/registration.js"></script>-->
</head>

<body>
<div class="bg"></div>
<div class="centered"><button onclick="document.getElementById('id01').style.display='block'" style="width:100%;">Daftar Masuk</button></div>

<div id="id01" class="modal">
  
  <form class="modal-content animate" method="get" action="LoginServlet">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
    <h1>Daftar Masuk</h1>
        <p>Sila isi maklumat di bawah.</p>
        <hr>
        <label for="uname"><b>Daftar masuk sebagai:</b></label>
        <input type="radio" name="utype" id="admin" value="Pengurus"> Pengurus
        <input type="radio" name="utype" id="coach" value="Pengajar">Pengajar
        <input type="radio" name="utype" id="participants" value="Peserta">Peserta
        
    <br /><br />
      <label for="uname"><b>Nama pengguna</b></label>
      <input type="text" placeholder="Masukkan nama pengguna" name="userName" id="userName" /required>
<br /><br />
   
      <label for="psw"><b>Kata laluan</b></label>
      <input type="password" placeholder="Masukkan kata laluan" name="userPass" id="userPass" /required>
      <br>
      <a href="forgotpassword.jsp" style="color:black;" id="forgot">Terlupa kata laluan?</a><br> 
      <br><br>
      <input type="submit" class="btnLogin" name="Login" id="btnLogin" value="Daftar Masuk" />
	  <br><br>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Ingat Maklumat Log Masuk
      </label>
    </div>
  </form>
</div>

<div class="centered1"><button onclick="document.getElementById('id02').style.display='block'" style="width:100%;">Daftar Akaun</button></div>

<div id="id02" class="modal">
  <span onclick="document.getElementById('id02').style.display='none'" class="close1" title="Close Modal">&times;</span>
   
  <form class="modal-content" method="post" action="SignupServlet" enctype='multipart/form-data'>
  
    <div class="container">
      <h1>Daftar Akaun</h1>
      <p>Sila isi maklumat di bawah.</p>
      <hr>
      
      <label for="fname"><b>Masukkan Gambar Anda</b></label>
      <input type="file" name="photo" size="50"/><br>
      
      <label for="fname"><b>Nama penuh</b></label>
      <input type="text" placeholder="Masukkan nama penuh" name="fname" id="fname" required>
      
      <label for="uname"><b>Nama pengguna</b></label>
      <input type="text" placeholder="Masukkan nama pengguna" name="uname" id="uname" required>
      
      <label for="uname"><b>No kad pengenalan</b></label>
      <input type="text" placeholder="Masukkan no kad pengenalan" name="noic" id="noic" required>
        
      <label for="psw"><b>Kata laluan</b></label>
      <input type="password" placeholder="Masukkan kata laluan" name="psw" id="psw" required>
      
      <label for="psw2"><b>Pengesahan kata laluan</b></label>
      <input type="password" placeholder="Masukkan kata laluan" name="psw2" id="psw2" required>
	  
      <label for="email"><b>E-mel</b></label>
      <input type="text" placeholder="Masukkan e-mel" name="email" id="email" required>
      
      <label for="phoneno"><b>Telefon</b></label>
      <input type="text" placeholder="Masukkan no. telefon" name="phoneno" id="phoneno" required>
     
      <label for="address"><b>Alamat</b></label>
      <input type="text" placeholder="Masukkan alamat" name="address" id="address" required>

      <label for="daftar"><b>Daftar sebagai: </b></label>
      <input type=radio name="utype" id="peserta" value="Peserta"> Peserta
      <input type=radio name="utype" id="pengajar" value="Pengajar"> Pengajar <br><br>
      
      <p>Dengan membuat akaun ini, anda bersetuju dengan terma dan privasi kami.</p>
	  <br>
      <div class="clearfix">
        <button type="button" onclick="window.location.href='index.jsp'" class="cancelbtn">Batal</button>
        <button type="submit" class="signupbtn" >Daftar masuk</button>
      </div>
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
// Get the modal
var modal = document.getElementById('id02');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>
