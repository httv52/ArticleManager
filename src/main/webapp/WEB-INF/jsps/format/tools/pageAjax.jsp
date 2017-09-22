<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(function () {
        /*仪表盘*/
        $("#indexPage").click(function () {
            $.ajax({
                type: "POST",
                url: '<c:url value="/admin/indexPage"/> ',
                dataType: "html",   //返回值类型       使用json的话也可以，但是需要在JS中编写迭代的html代码，如果格式样式
                cache: false,
                success: function (data) {
                    //var json = eval('('+msg+')');//拼接的json串
                    $('#content').html(data);
                },
                error: function (error) {
                    alert(error);
                }
            });
        });

        $("#articleManege").click(function () {
            $.ajax({
                type: "POST",
                url: '<c:url value="/admin/articleManege"/> ',
                dataType: "html",   //返回值类型       使用json的话也可以，但是需要在JS中编写迭代的html代码，如果格式样式
                cache: false,
                success: function (data) {
                    $(document).attr('title','文章管理 | 文章管理系统');
                    //var json = eval('('+msg+')');//拼接的json串
                    $('#content').html(data);
                },
                error: function (error) {
                    alert(error);
                }
            });
        });
    });
</script>