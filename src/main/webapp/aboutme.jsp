<%--
  Created by IntelliJ IDEA.
  User: selenkosoglu
  Date: 10.08.2021
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutme.css" />

</head>
<body style="background-color: lavender">
<header class='masthead'>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light " style="background-color: cornsilk">
            <div class="container-fluid">

            </div>
            <div class="collapse navbar-collapse" id="navbarSupportedContent" style="float: right">

                <a class="button" href="./contact.jsp" style="margin-left: 30px">İletişim  </a>

            </div>  <div class="collapse navbar-collapse" id="navbarSupportedContent1" style="float: right">

            <a class="button" href="./index.jsp" style="margin-left: 10px"> Ana Sayfa</a>
        </div>

        </nav>
    </div>
    <p class='masthead-intro' style="color:mediumpurple">merhaba!</p>
    <h1 class='masthead-heading' style="color:indigo">Hakkımızda</h1>
</header>
<section class="introduction-section" style="text-align: center">
    <h1>Ön Bilgi</h1>
    <p>BilgeAdam Teknoloji</p>
    <p>Şeker Bank Java Yazılım Programı</p>
</section>
<section class="location-section" style="text-align: center">
    <h1>Nereliyiz?</h1>
    <p>İstanbul, Türkiye </p>
</section>
<section class="questions-section" style="text-align: center">
    <h1>Daha Fazla..</h1>
    <h2>Eğitmen:</h2>
    <p>Hakan Özer</p>
    <h2>Öğrenci Sayısı:</h2>
    <p>16</p>
    <h2>Kullanılan dil:</h2>
    <p>Java</p>
    <h2>Kullanılan IDE:</h2>
    <p>IntelliJ</p>
</section>

<footer class="content-footer">
    <p style="margin-right: 25px">Sosyal Medya:</p>
    <ul class="social">
        <li><a class="css-is-deranged" href="https://github.com/selenkosoglu" style="margin-left: 5px">GitHub</a></li>
    </ul>

</footer>
</body>
</html>
