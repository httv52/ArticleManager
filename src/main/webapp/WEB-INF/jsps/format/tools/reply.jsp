<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script>
    $(function () {
        $(".replyComment").click(function () {
            $("#articleId").val('${sessionScope.loginUser.uid}');
            $atid = $(this).attr('id');
            var $name = $(this).parent().parent().prev().find("name").html();
            $("#commentText").val('<a href="' + $atid + '">@' + $name + '</a>');
            $("#commentText").attr("value", "<a href=" + $atid + ">@" + $name + " </a>").focus();
        });

    });
</script>
