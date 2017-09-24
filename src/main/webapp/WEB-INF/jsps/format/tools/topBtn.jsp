<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<a id="btn_top" class="btn btn-rounded btn-lg btn-icon btn-default">
    <i class="fa fa-rocket fa-lg"></i>
</a>


<%--向上按钮--%>
<script>
    $(function () {
        $('#topAnchor').scroll(function () {
            if ($('#topAnchor').scrollTop() >= 50) {
                $('#btn_top').fadeIn();
            }
            else {
                $('#btn_top').fadeOut();
            }
        });

        $("#btn_top").mouseover(function () {
            layer.tips('返回顶部', '#btn_top', {
                tips: [1, '#78BA32'], //还可配置颜色
                time: 0
            });

        })

        $("#btn_top").mouseout(function () {
            layer.close(layer.index);
        });

        $('#btn_top').click(function () {
            $('#topAnchor').animate({scrollTop: 0}, 500);
        });


    });
</script>
