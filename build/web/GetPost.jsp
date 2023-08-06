<%@page import="java.util.List"%>
<%@page import="com.genius.blog.Entities.Post"%>
<%@page import="com.genius.blog.Entities.Users"%>
<%@page import="com.genius.blog.Dao.Dao"%>
<div class="row">
    <%
        int cId = Integer.parseInt(request.getParameter("cId"));
        List<Post> list;
        if (cId == 0) {
            list = Dao.getAllPosts();
        } else {
            list = Dao.getPostsById(cId);
        }
        Users u =(Users) session.getAttribute("currentUser");
        for (Post p : list) {
        
    %>
    <div class="col-md-6">
        <div class="card m-2">
            <img src="img/blogPics/<%= p.getpPic()%>" alt="<%= p.getpTitle() + "'s picture"%>" class="card-img-top"/>
            <div class="card-header primary-backround text-white"><b><%= p.getpTitle()%></b></div>
            <div class="card-body"><%= p.getpContent()%></div>
            <div class="card-footer text-center">
                <a href="BlogPost.jsp?PostId=<%= p.getpId()%>"  class="btn btn-outline-success  btn-sm">Read more</a>

                <a id="like<%= p.getpId() %>" href="#!" onclick="likeFunction(<%= p.getpId()%>,<%= u.getId()%>)" class="btn btn-outline-success btn-sm no<%= p.getpId() %>"><spane class="fa fa-thumbs-o-up"></spane><span class="cc<%= p.getpId() %>"><%= Dao.countLikesOnPost(p.getpId())%></span></a>
                <a href="#"  class="btn btn-outline-success  btn-sm"><span class="fa fa-comments-o"></span><span> 20</span></a>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>