<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="props.Author" %>
<%@ page import="utils.DBUtil" %>
<%@ page import="props.Blog" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Author author = util.isLogin(request, response); %>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<html>
<head>
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

                <a class="button" href="./passwordchange.jsp"  style="color:#FFCF33;margin-left: 30px">Şifre Değiştir</a>
                <a class="button" href="logout"  style="color:#FFCF33">Çıkış Yap</a>
            </div>
    </nav>


            <div class="row">
                <div class="col-sm-4">
                    <h2 style="color: mediumpurple">Blog Ekle</h2>
                    <form action="blog-servlet" method="post" >
                        <div class="mb-3">
                            <input type="text" name="title" placeholder="Başlık" class="form-control" required />
                        </div>
                        <div class="mb-3">
                            <input type="text" name="detail" placeholder="Detay" class="form-control" required />
                        </div>
                        <div class="mb-3">
                            <textarea name="blog" placeholder="Blog" class="form-control" required></textarea>
                        </div>
                        <button class="btn"  style="color:#FFCF33;background-color: mediumpurple"> Kaydet </button>
                    </form>
                </div>
                <div class="col-sm-8">
                    <h2 style="color: mediumpurple">Blog Listesi</h2>

                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Başlık</th>
                            <th scope="col">Blog</th>
                            <th scope="col">Detay</th>
                            <th scope="col" >Düzenle</th>
                            <th scope="col" >Sil</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%
                            int aid = author.getAid();
                        %>
                        <c:if test="${ dbUtil.allBlog(aid).size() == 0 }">
                            <tr>Ürün Yok</tr>
                        </c:if>
                        <c:if test="${ dbUtil.allBlog(aid).size() > 0 }">
                            <c:forEach items="${ dbUtil.allBlog(aid) }" var="item" >
                                <tr>
                                    <th scope="row"><c:out value="${item.bid}"></c:out></th>
                                    <td><c:out value="${item.title}"></c:out></td>
                                    <td><c:out value="${item.blog}"></c:out></td>
                                    <td><c:out value="${item.detail}"></c:out></td>
                                    <td>
                                        <a href="blog-update?bid=${item.bid}" class="btn btn-warning btn-sm" style="background-color: mediumpurple;color:#FFCF33">Düzenle</a>
                                    </td>
                                    <td>
                                        <a onclick="return show_alert()" href="blog-servlet?bid=${item.bid}" class="btn btn-danger btn-sm" style="background-color:mediumpurple;color:#FFCF33">Sil</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>

                        </tbody>

                    </table>

                </div>
            </div>

</div>
</body>
</html>
