<%-- 
    Document   : BlogPost
    Created on : Jul 10, 2023, 2:39:21 AM
    Author     : sarwe
--%>
<%@page import="java.text.DateFormat"%>
<%@page errorPage="error.jsp" %>
<%@page import="com.genius.blog.Entities.Post"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.genius.blog.helper.FactoryProvider"%>
<%@include file="allCssJavaScript/CssAndJavascript.jsp" %>

<%@include file="navbar.jsp" %>
<%    if (user == null) {
        response.sendRedirect("login.jsp");
    }
    int pId = Integer.parseInt(request.getParameter("PostId"));
    Post post;
    Session s = FactoryProvider.getFactory().openSession();
    post = (Post) s.load(Post.class, pId);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= post.getpTitle()%> : Code Genius Blog</title>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v17.0" nonce="1ILwUdzF"></script>

    <style>
        .postTitle{
            font-size: 35px;
            font-weight: 100;
        }
        .postContent{
            font-size: 20px;
            font-weight: 100;
        }
        .postInfo{
            border: solid #e2e2e2;
        }
        .PostDate{
            font-style: italic;
            font-weight: bold;
        }
    </style>

</head>
<body>
    <div class="container">
        <div class="row my-4">
            <div class="col-md-8 offset-2">
                <div class="card">
                    <div class="card-header text-white primary-backround">
                        <h4 class="postTitle"><%= post.getpTitle()%></h4>
                    </div>
                    <img src="img/blogPics/<%= post.getpPic()%>" class="img-card-top">
                    <div class="card-body">
                        <div class="row my-3 pt-3 postInfo">
                            <div class="col-md-10">
                                <p class="userName"><a href="#" class="link-success link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"><%= post.getuPId().getName()%></a>: has posted</p> 
                            </div>
                            <div class="col-md-2">
                                <p class="PostDate"><%= DateFormat.getDateInstance().format(post.getpDate())%></p>
                            </div>
                        </div>
                        <p class="postContent"><%= post.getpContent()%></p>
                    </div>
                    <div class="card-footer text-center primary-backround">

                        <a id="like" href="#!" onclick="doLike(<%= post.getpId()%>,<%= user.getId()%>)" class="btn btn-outline-light"><spane class="fa fa-thumbs-o-up"></spane> <span class="cc"><%= Dao.countLikesOnPost(post.getpId())%> </span></a>
                        <a href="#"  class="btn btn-outline-light"><span class="fa fa-comments-o"></span><span> 20</span></a>
                    </div>
                    <div class="card-footer">
<div class="fb-comments" data-href="http://localhost:9494/CodeGeniusBlog/BlogPost.jsp?PostId=6#" data-width="12" data-numposts="5"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        s.close();
    %>
    <%@include file="footer.jsp" %>

</body>
</html>
