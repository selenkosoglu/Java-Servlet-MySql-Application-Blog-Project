
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="props.Author" %>
<%@ page import="props.Blog" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Author author = util.isLogin(request, response); %>

<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>

<html>
<head>
    <title>Blog Update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body style="background-color: lavender">
<div class="container">

    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: mediumpurple">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="color:#FFCF33">Hoş Geldiniz <%=author.getName()%> ! </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <a class="button" href="./blog.jsp"  style="color:#FFCF33">Blog'a Geri      Dön</a>
            <a class="button" href="logout"  style="color:#FFCF33">Çıkış Yap</a>


        </div>
    </nav>


    <div class="row">
        <div class="col-sm-6">
            <h2 style="color: mediumpurple">Şifre Değiştir</h2>


            <%
                Object loginObj = request.getAttribute("passwordError");
                if (loginObj != null) {
                    String errorMessage = ""+loginObj;
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Hata! </strong><%=errorMessage%>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>

            <% } %>
            <form action="passwordchange" method="post" >
                <div class="mb-3">
                    <input type="text" name="old_password" placeholder="Eski Şifreniz" class="form-control" required />
                </div>
                <div class="mb-3">
                    <input type="text" name="new_password"  placeholder="Yeni Şifreniz" class="form-control" required />
                </div>
                <button class="btn"  style="color:#FFCF33;background-color: mediumpurple"> Değiştir </button>
            </form>


        </div>

    </div>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</div>
</body>
</html>

