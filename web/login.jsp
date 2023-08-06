<%-- 
    Document   : login
    Created on : Jul 5, 2023, 1:54:48 AM
    Author     : sarwe
--%>

<%@page import="com.genius.blog.msg.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page : Code Genius Blog</title>
        <%@include file="allCssJavaScript/CssAndJavascript.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div style="height:80.4vh;">
            <main class="d-flex align-items-center primary-backround b-background pb-5" style="height: 70vh;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 offset-4">
                            <div class="card mt-3">
                                <div class="card-header primary-backround text-white text-center">
                                    <span class="fa fa-user-circle fa-3x"></span>
                                    <h1>LOGIN</h1>                                
                                </div>
                                <%                                    Message msg = (Message) session.getAttribute("msg");
                                    if (msg != null) {
                                %>
                                <div class="alert <%= msg.getType() %>" role="alert">
                                    <%= msg.getContent() %>
                                </div>
                                <%
                                    session.removeAttribute("msg");
                                    }
                                %>

                                <div class="card-body">
                                    <form action="LoginServlet" method="post">
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleInputPassword1" class="form-label">Password</label>
                                            <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-outline-success">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
