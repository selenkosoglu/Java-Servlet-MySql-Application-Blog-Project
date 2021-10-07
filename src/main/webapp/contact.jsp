<%--
  Created by IntelliJ IDEA.
  User: selenkosoglu
  Date: 10.08.2021
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css" />
</head>
<body style="background-color: lavender">
<form action="contact-servlet" method="post" >
<div class="container">

    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: mediumpurple">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <a class="button" href="./index.jsp"  style="color:#FFCF33;font-family: 'Avenir Next';float: right;margin-left: 10px;font-weight: bold">Ana Sayfa</a>
            <a class="button" href="./aboutme.jsp"  style="color:#FFCF33;font-family: 'Avenir Next';float: right;font-weight: bold">Hakkımızda</a>
        </div>
    </nav>
    <div class="row">
        <h1 style="color: mediumpurple;margin-right: 20px">bizimle iletişime geçin!</h1>
    </div>
    <div class="row">
        <h4 style="text-align:center; color: mediumpurple">Sizden geri dönüş almayı çok isteriz!</h4>
    </div>
    <div class="row input-container">
        <div class="col-xs-12">
            <div class="styled-input wide">
                <input type="text" required name="name"/>
                <label style="font-family: 'Avenir Next';color: #FFCF33">Name</label>
            </div>
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="styled-input">
                <input type="text" required name="email"/>
                <label style="font-family: 'Avenir Next';color: #FFCF33">Email</label>
            </div>
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="styled-input" style="float:right;">
                <input type="text" required name="phoneNumber"/>
                <label style="font-family: 'Avenir Next';color: #FFCF33">Phone Number</label>
            </div>
        </div>
        <div class="col-xs-12">
            <div class="styled-input wide">
                <textarea required name="message"></textarea>
                <label style="font-family: 'Avenir Next';color: #FFCF33">Message</label>
            </div>
        </div>

        <div class="col-xs-12">
            <button style="float: right">
                <div class="btn-lrg submit-btn" style="font-family: 'Avenir Next'; background-color: mediumpurple; color: #FFCF33">Mesaj Yolla!</div>
            </button>
        </div>
    </div>
</div>
</form>


</body>
</html>
