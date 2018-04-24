<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--底部内容--%>

</section>
</section>
</section>


<%--导入头像文件--%>
<%@include file="/WEB-INF/jsps/format/admin/headImg.jsp" %>

<%--导入返回顶部按钮--%>
<%--<%@include file="/WEB-INF/jsps/format/tools/topBtn.jsp" %>--%>

<%--导入回复功能--%>
<%@include file="/WEB-INF/jsps/format/tools/reply.jsp" %>

<%@include file="/WEB-INF/jsps/format/tools/nav_bar.jsp" %>


<script src="<c:url value='/js/fuelux/fuelux.js'/>"></script>
<%--H+的js--%>
<script src="<c:url value='/js/content.js'/>"></script>

<!-- layui -->
<script src="<c:url value='/js/layer-v3.1.0/layer/layer.js'/>"></script>
<script src="<c:url value='/js/layer-v3.1.0/layer/dist.js'/>"></script>


<%-- chat--%>
<script src="<c:url value='/js/charts/easypiechart/jquery.easy-pie-chart.js'/>"></script>
<script src="<c:url value='/js/charts/sparkline/jquery.sparkline.min.js'/>"></script>

<script>
    var hutao = new $.hutao();

    function a() {
        swal("删除！", "你的虚拟文件已经被删除。", "success");
        // alert(1);
    }

    function user_quit() {
        swal({
                title: "确认退出登录？",
                text: "确认退出登录",
                type: "warning",
                showCancelButton: true,              //是否显示“取消”按钮。
                cancelButtonText: "取消",            //按钮内容
                cancelButtonColor: '#d33',
                showConfirmButton: true,
                confirmButtonColor: '#3085d6',
                confirmButtonText: '确定',
                closeOnConfirm: false,
                closeOnCancel: true
            },
            function () {
                hutao.showLoading({
                    spinner: 'accordion',
                    text: '退出中，请稍等',
                    fontSize: '2rem'
                });

                hutao.post({
                    type: 'get',
                    url: '<c:url value="/user/quit"/>',
                    success: function (result) {
                        handlerResult(result, post_success);
                    }
                });
            });

        // hutao.questionAlert({
        //     title: '确认退出登录',
        //     text: '确认退出登录'
        // }, function () {
        //     swal("删除！", "你的虚拟文件已经被删除。", "success");
        // });

        /*hutao.questionAlert({
            title: '确认退出登录',
            text: '确认退出登录'
        }, function () {
            alert(1);
            hutao.showLoading({
                spinner: 'accordion',
                text: '退出中，请稍等',
                fontSize: '2rem'
            });

            hutao.post({
                type: 'get',
                url: '//<c:url value="/user/quit"/>',
                success: function (result) {
                    handlerResult(result, post_success);
                }
            });
        });*/

    }


    function post_success() {
        hutao.successAlert({
            title: "退出成功",
            text: "退出成功，即将跳转"
        }, function () {
            window.location.href = '<c:url value="/user/showLogin"/>';
        });
    }
</script>

</body>

</html>