function doLike(pId, uId) {
    console.log(pId + " : " + uId);

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
                let c = $(".cc" + pId).html();
                c++;
                $(".cc" + pId).html(c);
                $("#like" + pId).removeAttr("onclick");
                $("#like" + pId).attr("onclick", "deleteLike(" + pId + "," + uId + ")");

                $("#like" + pId).removeClass("btn-outline-success");
                $("#like" + pId).addClass("btn-success");

            }

        }, error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
        }

    });

}
function deleteLike(pId, uId) {
    console.log(pId + " :: " + uId);
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
                let c = $(".cc" + pId).html();
                Number(c);
                c--;
                $(".cc" + pId).html(c);
            }
        }, error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            return;
        }
    });
    $("#like" + pId).removeAttr("onclick");
    $("#like" + pId).attr("onclick", "doLike(" + pId + "," + uId + ")");
    $("#like" + pId).removeClass("btn-success");
    $("#like" + pId).addClass("btn-outline-success");
}
$(document).ready(function () {

});