<%@page import="com.genius.blog.Entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.genius.blog.Dao.Dao"%>
<%@page import="com.genius.blog.Entities.Users" %>

<%
    Users user = (Users) session.getAttribute("currentUser");
%>
<!-- Starting of Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark primary-backround">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-flash"></span> Code Genius Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp"><span class="fa fa-home"></span>  Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="fa fa-sort-amount-desc"></span> Categories</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Programming Language</a></li>
                        <li><a class="dropdown-item" href="#">Data Structure</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">More...</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact</a>
                </li>
                <%
                    if (user != null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#addPostModel"><span class="fa fa-upload"></span> Add Post</a>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                if (user == null) {
            %>
            <ul class="navbar-nav me-right">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp"><span class="fa fa-user-circle-o"></span> Sign In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Register.jsp"><span class="fa fa-user-plus"></span> Sign Up</a>
                </li>
            </ul>
            <% } else {
            %>
            <ul class="navbar-nav me-right">
                <li class="nav-item">
                    <a class="nav-link" href="" data-bs-toggle="modal" data-bs-target="#Modal1"><span class="fa fa-user-circle-o"></span> <%= user.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Logout"><span class="fa fa-sign-out"></span> Logout</a>
                </li>
            </ul>

            <%-- End of Navbar --%>

            <!-- start of Modal 1 -- User Deatil -->
            <div class="modal fade" id="Modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header primary-backround text-white">
                            <h1 class="modal-title fs-5" id="exampleModalLabel"><span class="fa fa-flash"></span> Code Genous Blog</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="pro-detail">
                            <div class="container text-center">
                                <img src="img/profile/<%=user.getProfile()%>" alt="user's profile" style="max-width: 150px; border-radius: 50px;">
                                <h3 class="text-success"><%= user.getName()%></h3>
                                <!--table-->
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">User Id</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Password</th>
                                            <td><%= user.getPassword()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered Date</th>
                                            <td><%= user.getDate()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-body" id="edit-detail" style="display: none;">
                            <div class="container text-center">
                                <h3 class="text-success">Edit Detail Carefully.</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th scope="row">User Id</th>
                                                <td><%= user.getId()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Name</th>
                                                <td><input type="text" name="name" class="form-control" value="<%= user.getName()%>"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Email</th>
                                                <td><input type="email" name="email" class="form-control" value="<%= user.getEmail()%>"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Password</th>
                                                <td><input type="password" name="password" class="form-control" value="<%= user.getPassword()%>"></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Select Gender</th>
                                                <td>
                                                    <% if (user.getGender().equalsIgnoreCase("male")) { %>
                                                    <input type="radio" class="form-check-input" name="gender" id="male" value="Male" checked>
                                                    <label class="form-check-label" for="male">Male</label>
                                                    <input type="radio" class="form-check-input" name="gender" id="female" value="Female">
                                                    <label class="form-check-label" for="female">Female</label>
                                                    <%
                                                    } else {
                                                    %>
                                                    <input type="radio" class="form-check-input" name="gender" id="male" value="Male">
                                                    <label class="form-check-label" for="male">Male</label>
                                                    <input type="radio" class="form-check-input" name="gender" id="female" value="Female" checked>
                                                    <label class="form-check-label" for="female">Female</label>
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Select Profile</th>
                                                <td><input type="file" class="form-control" name="pro-img"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <button type="submit" class="btn btn-outline-success"><span class="fa fa-edit"></span>Update</button>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal"><span class="fa fa-times-circle"></span> Close</button>
                            <button type="button" class="btn btn-outline-success" id="edit-btn"><span class="fa fa-edit"></span> Edit</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--End of Model 1-->

            <!-- Start Modal 2 -- Add Post -->
            <div class="modal fade" id="addPostModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header primary-backround text-white">
                            <h1 class="modal-title fs-5" id="exampleModalLabel"><span class="fa fa-flash"></span> Code Genius Blog</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="container text-center" id="addPostContainer">
                                <h3 class="text-success">Add Post Details</h3>
                                <form action="AddPostServlet" method="post" id="addPostForm" enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <select name="category"class="form-select" id="category">
                                            <option selected disabled>---Select Category---</option>
                                            <%
                                                List<Category> list = Dao.getAllCategories();
                                                for (Category category : list) {
                                            %>
                                            <option value="<%= category.getCatId()%>"><%= category.getCatName()%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <input name="title" type="text" class="form-control" id="title" placeholder="Enter post title">
                                    </div>
                                    <div class="mb-3">
                                        <textarea name="content" class="form-control" id="content" rows="5" placeholder="Enter post content"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="pic" class="form-label">Select Post Picture</label>
                                        <input name="pic" type="file" class="form-control" id="pic">
                                    </div>
                                    <button type="submit" class="btn btn-outline-success">Submit Post</button>
                                </form>
                            </div>
                            <div class="container text-center "  id="addPostLoader" style="display: none;">
                                <div class="spinner-border text-success" role="status" style="width: 10rem; height: 10rem;">
                                </div>
                                <h3 class="text-success">Loading...</h3>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal"><span class="fa fa-times-circle"></span> Close</button>
                            <button type="button" class="btn btn-outline-success">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--End of Model 2 -- Add Post-->
            <%
                }
            %>
        </div>
    </div>
</nav>
<!--End of navbar-->
<script>
    $(document).ready(function () {
        let flag = false;
        $("#edit-btn").click(function () {
            $("#pro-detail").toggle();
            $("#edit-detail").toggle();
            if (flag === false) {
                $("#edit-btn").html("<span class='fa fa-arrow-left'></span> Back");
                flag = true;
            } else {
                $("#edit-btn").html("<span class='fa fa-edit'></span> Edit");
                flag = false;
            }
        });
    });
</script>
<script>
    $(document).ready(function () {
        $("#addPostForm").on("submit", function (event) {
            $("#addPostContainer").hide();
            $("#addPostLoader").show();
            event.preventDefault();
            let form = new FormData(this);
            $.ajax({
                url: "AddPostServlet",
                type: "POST",
                data: form,
                success: function (data, textStatus, jqXHR) {
                    if (data.trim() === "done") {
                        Swal.fire({
                            icon: 'success',
                            title: 'Good job!',
                            text: 'Your has been successfully added.!'
                        });

                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong...'
                        });
                    }
                    $("#addPostContainer").show();
                    $("#addPostLoader").hide();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Something went wrong...'
                    });
                    $("#addPostContainer").show();
                    $("#addPostLoader").hide();
                },
                processData: false,
                contentType: false
            });
        });
    });
</script>