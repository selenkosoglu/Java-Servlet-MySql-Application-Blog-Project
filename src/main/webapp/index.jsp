<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="props.Author" %><%--
  Created by IntelliJ IDEA.
  User: selenkosoglu
  Date: 10.08.2021
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="author" class="props.Author"></jsp:useBean>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/firstpage.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body style="background-color: lavender">

<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: mediumpurple">

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <a class="button" href="./contact.jsp"  style="color:#FFCF33;font-family: 'Avenir Next';padding-left: 1130px">İletişim</a>
            <a class="button" href="./aboutme.jsp"  style="color:#FFCF33;font-family: 'Avenir Next';padding-left: 20px">Hakkımızda</a>
        </div>
    </nav>
</div>

<div class="heading">
    <h1 style="color: mediumpurple;text-align: center;font-family: 'Avenir Next'">BLOGLAR</h1>
</div>
<div class="row">
    <c:if test="${dbUtil.allAuthor().size() > 0 }">
        <c:forEach items="${dbUtil.allAuthor()}" var="item">
            <div class="card">
                <div class="card-header">
                    <h1 style="color: indigo;font-family: 'Avenir Next'"><c:out value="${item.title}"></c:out> </h1>
                </div>
                <div class="card-body">
                    <p style="color:mediumpurple;font-family: 'Avenir Next'"><c:out value="${item.detail}"></c:out></p>
                    <p style="color:mediumpurple;font-family: 'Avenir Next'"><c:out value="${item.name}"></c:out></p>
                    <p style="color:mediumpurple;font-family: 'Avenir Next'"><c:out value="${item.date}"></c:out></p>
                    <a href="blog-list?bid=${item.bid}" class="btn" style="background-color: mediumpurple;color: #FFCF33;font-family: 'Avenir Next'">Devamını Oku!</a>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>









</body>
</html>
