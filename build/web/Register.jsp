<%-- 
    Document   : Register
    Created on : Jul 5, 2023, 2:51:43 AM
    Author     : sarvech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page :  Code Genius Blog</title>
        <%@include file="allCssJavaScript/CssAndJavascript.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class="primary-backround pb-5 b-background">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-3">
                        <div class="card">
                            <div class="card-header text-center primary-backround text-white">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <h1>REGISTRATION</h1>
                            </div>
                            <div class="card-body" id="reg-form">
                                <form id="register" action="RegisterServlet" method="POST">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Full Name</label>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter name here" aria-describedby="emailHelp" required>
                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email address</label>
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email here" aria-describedby="emailHelp" required>
                                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password here" required>
                                    </div>
                                    <label for="gender">Select Gender : </label>
                                    <input class="form-check-input" type="radio" name="gender" id="male" value="Male">
                                    <label class="form-check-label" for="male">Male</label>
                                    <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
                                    <label class="form-check-label" for="female">Female</label>
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" name="check" id="check">
                                        <label class="form-check-label" for="check">Agree terms and conditions</label>
                                    </div>
                                    <button type="submit" class="btn btn-outline-success">Submit</button>
                                </form>
                            </div>
                            <div class="card-body text-center" id="loader" style="display: none;">
                                <div class="spinner-border text-success" role="status" style="width: 10rem; height: 10rem;">
                                </div>
                                <h3 class="text-success">Loading...</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <%@include file="footer.jsp" %>
    <script>
        $(document).ready(function () {
            console.log("loaded");
            $('#register').on('submit', function (event) {
                event.preventDefault();
                $('#reg-form').hide();
                $('#loader').show();
                let form = new FormData(this);
                $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data)
                        $('#reg-form').show();
                        $('#loader').hide();
                        if (data.trim() === "success") {
                            Swal.fire({
                                icon: 'success',
                                title: 'Good job!',
                                text: 'You are successfully registered.!'
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'You dont agree terms and conditions.'
                            });
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR)
                        $('#reg-form').show();
                        $('#loader').hide();
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Error: '+JqXHR
                        });
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>
</body>
</html>
