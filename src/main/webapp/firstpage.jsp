<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
    <!--   <link rel="text/javascript" src="${pageContext.request.contextPath}/js/login.js" /> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


</head>
<body  style="background-color: lavender">
<form action="login-servlet" method="post">
    <div class="form">
        <div class="title" style="color: mediumpurple;text-align: center">Author Login</div>
        <%
            Object loginObj = request.getAttribute("loginError");
            if (loginObj != null) {
                String errorMessage = ""+loginObj;
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Hata! </strong><%=errorMessage%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>

        <% } %>
        <div class="input-container ic1">
            <input id="email" name="email" class="input" type="email" placeholder=" " />
            <div class="cut"></div>
            <label for="email" class="placeholder">E-Mail</label>
        </div>
        <div class="input-container ic2">
            <input id="password" name="password" class="input" type="password" placeholder=" " />
            <div class="cut cut-short"></div>
            <label for="email" class="placeholder">Şifre</label>
        </div>
        <div class="mb-3 form-check">
            <input name="remember" type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1" style="margin-top: 10px;text-align: center;color:#FFCF33;">Beni Hatırla</label>
        </div>
        <button type="text" class="submit" style="background-color:mediumpurple;color: #FFCF33">Giriş Yap</button>
    </div>
</form>


</body>
</html>
