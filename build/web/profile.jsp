<%@page import="com.genius.blog.msg.Message"%>
<%@page import="com.genius.blog.Entities.Users" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="allCssJavaScript/CssAndJavascript.jsp" %>

<%@include file="navbar.jsp" %>
<%    if (user == null) {
        response.sendRedirect("login.jsp");
    } else {
        Message msg = (Message) session.getAttribute("msg");
        if (msg != null) {
%>
<div class="alert <%= msg.getType()%>" role="alert">
    <%= msg.getContent()%>
</div>
<%
        session.removeAttribute("msg");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page : Code Genius Blog</title>
    </head>
    <body>
        <div class="container  mt-4" id="postContainer">
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="list-group">
                        <a href="#" onclick="getPosts(0, this)" class="act list-group-item list-group-item-success active" aria-current="true">
                            All Posts
                        </a>
                        <%
                            List<Category> catList = Dao.getAllCategories();
                            for (Category c : catList) {
                        %>
                        <a href="#" onclick="getPosts(<%= c.getCatId()%>, this)" class="act list-group-item list-group-item-success"><%= c.getCatName()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="container text-center" id="PostLoader" style="display: none;">
                        <div class="spinner-border text-success" role="status" style="width: 10rem; height: 10rem;">
                        </div>
                        <h3 class="text-success">Loading...</h3>
                    </div>
                    <div class="container" id="showPost">

                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script>
        function getPosts(catId, temp) {
            $("#showPost").hide();
            $("#PostLoader").show();
            $(".act").removeClass("active");
            $.ajax({
                url: "GetPost.jsp",
                data: {cId: catId},
                success: function (data, textStatus, jqXHR) {
                    $("#showPost").show();
                    $("#PostLoader").hide();
                    $("#showPost").html(data);
                    $(temp).addClass("active");
                }
            });
        }
        $(document).ready(function () {
            console.log("loaded");
            getPosts(0, $(".act")[0]);
        });
    </script>
    <script>

        var liked = false;
        function likeFunction(pId, uId) {
            var count = $(".cc" + pId).html();
            if (liked) {

                let d = {
                    postId: pId,
                    userId: uId,
                    operation: "dislike"
                }
                $.ajax({
                    url: "LikeServlet",
                    data: d,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if (data.trim === "true") {
                            count++;
                            $(".cc" + pId).text(count);
                            $(".no"+pId).removeClass("btn-success");
                            $(".no"+pId).addClass("btn-outline-success");
                            liked = false;
                        }
                    }, error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        return;
                    }
                });
            } else {
                let d = {
                    postId: pId,
                    userId: uId,
                    operation: "like"
                }
                $.ajax({
                    url: "LikeServlet",
                    data: d,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if (data.trim() === "true") {
                            count++;
                            $(".cc" + pId).text(count);
                            $(".no"+pId).removeClass("btn-outline-success");
                            $(".no"+pId).addClass("btn-success");
                            liked = true;
                        }
                    }, error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        return;
                    }
                });
            }
        }
    </script>
</html>
<%
    }
%>
