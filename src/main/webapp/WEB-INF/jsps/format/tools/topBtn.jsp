<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<a id="btn_top" class="btn btn-rounded btn-lg btn-icon btn-default">
    <i class="fa fa-rocket fa-lg"></i>
</a>

<%--列表项切换--%>
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