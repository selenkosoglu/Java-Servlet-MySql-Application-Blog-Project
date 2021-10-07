
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="props.Author" %>
<%@ page import="props.Blog" %><%--
  Created by IntelliJ IDEA.
  User: selenkosoglu
  Date: 10.08.2021
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body style="background-color: lavender">
<div class="container">

    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: mediumpurple">

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <a class="button" href="./index.jsp"  style="color:#FFCF33;font-family: 'Avenir Next';padding-left: 1000px">Ana Sayfa</a>
            <a class="button" href="./aboutme.jsp"  style="color:#FFCF33;font-family: 'Avenir Next';padding-left: 20px ">Hakkımızda</a>
            <a class="button" href="./contact.jsp"  style="color:#FFCF33;font-family: 'Avenir Next';padding-left: 20px ">İletişim</a>
        </div>
    </nav>

    <section class="ftco-section">
        <div class="container">
            <%
                Blog blog = (Blog) request.getAttribute("blog");
            %>
            <h1 style="color: indigo;text-align: center;font-family: 'Avenir Next'"><%=blog.getTitle()%></h1>
            <div style="color: indigo;text-align: center;font-family: 'Avenir Next'">
                <%=blog.getBlog()%>
            </div>
        </div>
    </section>






</div>






</body>
</html>
