<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(function () {
        var $firstList = $("#navList").find('li.first').length;
        var $secondList = $("#navList").find('li.second').length;
        for (var i = 0; i < $firstList; i++) {
            $("#navList").children("li.first").eq(i).removeClass("active");
        }
        for (var i = 0; i < $secondList; i++) {
            $("#navList").children("li.second").eq(i).removeClass("active");
        }

        var $faState = '<i class="fa fa-angle-down text"></i><i class="fa fa-angle-up text-active"></i>';
        var $faState_active = '<i class="fa fa-angle-up text"></i><i class="fa fa-angle-down text-active"></i>';

        $(".faState").html($faState);

        var $firstCode = ${firstCode} -1;
        var $secondCode = ${secondCode} -1;
        $("#navList").children("li.first").eq($firstCode).addClass("active");

        if ($secondCode >= 0) {
            $("#navList").find('span.faState').eq($firstCode - 1).html($faState_active);
            $("#navList").children("li.first").eq($firstCode).find("li.second").eq($secondCode).addClass("active");
        }

    });
</script>