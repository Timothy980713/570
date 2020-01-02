<%@page import="model.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
    width: 100%;
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
input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}
 
.clearfix::after {
    content: "";
    clear: both;
    display: table;
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
    padding-right: 20px;
    padding-left: 20px;
    margin-right: 20px;
    margin-left: 20px;
    height: 80px;        /* if you want it to take the full height of the bar */
    line-height: 80px;    /* if you want it vertically middle of the navbar */
    color: #4A4A52;
    text-decoration: none;
    font-weight: bold;
    font-size: 14px;
}
.navigation-bar > a:hover{
    vertical-align: top;
    padding-right: 20px;
    padding-left: 20px;
    margin-right: 20px;
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
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {
  vertical-align: middle;
}
/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  height: 80%;
  position: relative;
  margin: auto;
}
/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}
/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
.active {
  background-color: #717171;
}
/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}
@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}
@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}
/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
.split {
  height: 100%;
  width: 50%;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 20px;
}
.left {
  float:left;
  background-color: white;
}
.right {
  float: right;
  background-color: white;
}
.centered {
  top: 50%;
  left: 50%;
  text-align: center;
  margin-right: 15%;
  margin-left: 15%;
}
.icon-bar {
  position: fixed;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}
.icon-bar a {
  display: block;
  text-align: center;
  padding: 16px;
  transition: all 0.3s ease;
  color: white;
  font-size: 20px;
}
.icon-bar a:hover {
  background-color: #000;
}
.facebook {
  background: #3B5998;
  color: white;
}
.linkedin {
  background: #007bb5;
  color: white;
}
.youtube {
  background: #bb0000;
  color: white;
}
.twitter {
  background: #55ACEE;
  color: white;
}
.google {
  background: #dd4b39;
  color: white;
}
</style>
</head>
<body bgcolor="#FBFBFB">
<div class="icon-bar">
  <p>Temui KGSM</p>
  <a href="https://www.facebook.com/" class="facebook"><i class="fa fa-facebook"></i></a> 
  <a href="https://twitter.com/" class="twitter"><i class="fa fa-twitter"></i></a> 
  <a href="https://www.google.com/" class="google"><i class="fa fa-google"></i></a> 
  <a href="https://www.linkedin.com/" class="linkedin"><i class="fa fa-linkedin"></i></a>
  <a href="https://www.youtube.com/" class="youtube"><i class="fa fa-youtube"></i></a> 
</div>
    <div class="topheader"><center><img src="images/walogo.png"></center><center><h1>KURSUS GERAK SENI MELAYU (KGSM)</h1></center></div>
      
        <div class="container">
        <center><nav class="navigation-bar">
            <%UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser"); %>
            <% if(currentUser.getName()==null) {
                session.invalidate(); 
                response.sendRedirect("index.jsp");
            } %>
            <h4>Hello, <%= currentUser.getFullName() %>!</h4> 
            <a href="home.jsp" style="color:#2997C1;" >HALAMAN UTAMA</a>
            <% if(currentUser.getUserTypeID()==1){ %>
                <a href="viewProfileAdmin.jsp">PROFIL</a>
                <a href="viewClassAdmin.jsp">KELAS</a>
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
                <a href="viewPayment.jsp" >PEMBAYARAN</a>
                <a href="contactUs.jsp">HUBUNGI KAMI</a>
            <% } %>
            <a href="LogoutServlet">LOG KELUAR</a>
        </nav></center>
<br><br><br><br><br><br>
      
     <div class="slideshow-container">

<div class="mySlides fade">
  <center><img src="images/pic6.jpg" style="width:800px;height:300px;"></center>
</div>

<div class="mySlides fade">
    <center><img src="images/pic5.jpg" style="width:800px;height:300px;"></center>
</div>

<div class="mySlides fade">
    <center><img src="images/pic7.jpg" style="width:800px;height:300px;"></center>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

    </div>
 <hr>
 <center><img src="images/pic8.jpg" style="margin-bottom: 100px;"></center>

<div class="split left">
  <div class="centered">
    <h2>TENTANG KAMI</h2>
    <p>Kursus Gerak Seni Melayu atau ?KGSM? merupakan sebuah program Silat & Budaya Melayu yang disusun rancang berdasarkan falsafah memperluaskan dan memperdalamkan skop pengalaman dan keilmuan dalam bidang seni silat dan budaya Melayu kepada pelbagai peringkat di sekolah, IPT, Pertubuhan mahupun Syarikat Korporat .

Program ini bukan sahaja bertumpu dalam hal-hal seni silat dan budaya semata-mata akan tetapi ia jua akan disokong pelbagai aktiviti yang mampu mengintegrasikan perhubungan di antara penuntut dengan masyarakat serta dengan alam sekeliling. Melalui penglibatan dalam program ini mereka bukan sahaja mendapat pendedahan dalam bidang seni dan budaya bahkan juga cemerlang dalam pendidikan, budaya kerja yang lebih baik, berketrampilan serta mesra dengan masyarakat serta alam sekeliling. Maka pendedahan inilah sewajarnya dipupuk dan ditanam dari peringkat usia remaja malah juga pada usia dewasa agar apa yang akan diterima kelak akan mempertingkatkan kesedaran terhadap nilai-nilai agama, moral, sejarah, ketahanan dan disiplin diri.

Pada kesedaran inilah WarisAlam ingin berkongsi pengalaman yang baik dalam KGSM. KGSM ini merupakan pengenalan awal : asas seni Melayu, dibentuk dalam beberapa pakej agar bersesuaian dengan kehendak pemintaan semasa.

 </p>
  </div>
</div>
<div class="split right">
  <div class="centered">
<br><br><br>
<iframe src="http://free.timeanddate.com/clock/i72k8onu/n122/tlmy40/fn13/fs18/fc09f/tc000/ftb/bas2/bat1/bacfff/pa8/tt0/tw0/td1/th2/ts1/ta1/tb4" frameborder="0" width="184" height="62"></iframe>
<br><br><br>
<iframe src="http://free.timeanddate.com/clock/i72k8onu/n122/szw160/szh160/hoc000/hbw2/hfceee/cf100/hncccc/fdi76/mqc000/mql10/mqw4/mqd98/mhc000/mhl10/mhw4/mhd98/mmc000/mml10/mmw1/mmd98" frameborder="0" width="160" height="160"></iframe>


<br><br><br>

  </div>
</div>

<script>
var slideIndex = 0;
showSlides();
function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>

        <footer>
          <div class="footerbg">
            <center><p>HAKCIPTA TERPELIHARA &copy; 2019 | WARIS ALAM</p></center>
          </div>