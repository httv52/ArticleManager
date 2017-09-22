<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    $(function () {
        var hash = '${sessionScope.loginUser.uid}';
        var options = {
            /*foreground: [0, 0, 0, 255],               // 后景色 RGBA黑色
            background: [255, 255, 255, 255],         // 前景色 RGBA白色*/
            margin: 0.2,                              // 20% margin
            size: 320,                                // 420px square
            format: 'svg'                             // use SVG instead of PNG
        };
        var data = new Identicon(hash, options).toString();
        $(".headImg").attr("src", 'data:image/svg+xml;base64,' + data + '');
    });
</script>
