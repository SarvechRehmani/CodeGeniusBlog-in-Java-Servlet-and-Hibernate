<%-- 
    Document   : error
    Created on : Jul 6, 2023, 8:43:05 PM
    Author     : sarwe
--%>
<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error page</title>
        <%@include file="allCssJavaScript/CssAndJavascript.jsp" %>

    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class="primary-backround pb-5 b-background">

            <div class="container text-center text-white">
                <img src="img/computer.png" alt="Error Image" class="img-fluid" style="width: 450px;">
                <h1>Oops! Something went wrong.</h1>
                <a class="btn btn-outline-light" href="/">Go back to the homepage</a>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
