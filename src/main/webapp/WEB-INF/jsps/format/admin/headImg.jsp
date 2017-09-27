<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    $(function () {
        var $myHeadImgId = '${sessionScope.loginUser.uid}';
        changeHeadImg($(".myHeadImg"), $myHeadImgId);

//        var commentHeadImg = $(".comment-list").find(".commentHeadImg");
//        commentHeadImg.each(function () {
//            var $hashId = $(this).attr("name");
//            changeHeadImg($(this), $hashId);
//        });
    });
</script>
