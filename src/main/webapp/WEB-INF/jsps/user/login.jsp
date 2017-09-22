<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="bg-dark">

<head>
    <meta charset="utf-8"/>
    <title>登录与注册 | 文章管理系统</title>
    <meta name="description"
          content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" href="<c:url value='/js/layui/css/layui.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/app.v2.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/fuelux/fuelux.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>" type="text/css"/>

    <!-- / jquery -->
    <script src="<c:url value='/js/jquery-3.2.1.js'/>"></script>

    <!--[if lt IE 9]>
    <script src="<c:url value='/js/ie/html5shiv.js'/>" cache="false"></script>
    <script src="<c:url value='/js/ie/respond.min.js'/>" cache="false"></script>
    <script src="<c:url value='/js/ie/excanvas.js'/>" cache="false"></script>
    <![endif]-->

    <link rel="icon" href="<c:url value='/images/favicon.ico'/>" type="image/x-icon"/>

    <style>
        * {
            font-family: 'Helvetica Neue', Helvetica, 'PingFang SC', 'Hiragino Sans GB', 'Microsoft YaHei', Arial, sans-serif;
        }

        #forget_psw {
            color: #8fbce8;
        }

        #forget_psw:hover {
            color: #5a95d0;
        }

        #content {
            margin-top: 10px;
        }

        .text-muted {
            margin-bottom: 10px;
        }

        .clauseText a {
            color: #4e666e;
        }

        .clauseText a:hover {
            color: #48686e;
        }

        .layui-layer-padding {
            color: #1b1b1b;
            font-family: "Microsoft YaHei UI";
        }
    </style>

    <script>
        $(function () {
            /*切换密码显示*/
            var $pwd = $('#showPassword');
            $($pwd).click(function () {
                var pwdText = $("#showPassword").html();
                if ("显示" == pwdText) {
                    $("#showPassword").text("隐藏");
                    $('#pwd').attr('type', 'text');
                } else if ("隐藏" == pwdText) {
                    $("#showPassword").text("显示");
                    $('#pwd').attr('type', 'password');
                }

            });

            /*登录注册切换*/
            var $register = $("#showRegister");
            var $login = $("#showLogin");

            $("#toLogin").click(function () {
                $($register).attr("style", "display:none;");
                $($login).attr("style", "");
            });
            $("#toRegist").click(function () {
                $($login).attr("style", "display:none;");
                $($register).attr("style", "");
            });

        });
    </script>

</head>

<body>
<section id="content" class="m-t-lg wrapper-md animated fadeInUp">

    <%--登录界面--%>
    <div id="showLogin" <c:if test='${pageCode == 2}'>
        style="display:none;"
    </c:if>>
        <div class="container aside-xxl">
            <div class="text-center">
                <div class="thumb-md">
                    <img src="<c:url value='/images/logo.png'/> ">
                </div>
            </div>
            <a class="navbar-brand block animated bounceInLeft" href="">文章管理系统　|　登录页　　　</a>

            <%--导入校验结果页面--%>
            <%@include file="/WEB-INF/jsps/format/errorMsg.jsp" %>

            <section class="panel panel-default bg-white m-t-lg animated bounceInRight">
                <header class="panel-heading text-center"><strong>LOGIN</strong></header>

                <form action="<c:url value='/user/login.do'/> " class="panel-body wrapper-lg" method="post"
                      data-validate="parsley">
                    <div class="form-group">
                        <label class="control-label hidden-xs">登录名</label>
                        <input name="username" type="text" class="form-control parsley-validated" placeholder="登录名"
                               data-rangelength="[1,64]" data-required="true" value="hutao">
                    </div>
                    <%--TODO 修改默认值value="${user.username}${user.password}--%>
                    <div class="form-group">
                        <label class="control-label hidden-xs">密码</label>
                        <div class="input-group">
                            <input type="password" id="pwd" name="password" placeholder="密码" data-rangelength="[2,20]"
                                   class="form-control parsley-validated" data-required="true" value="123">
                            <span class="input-group-btn">
                            <button class="btn btn-default" id="showPassword"
                                    data-toggle="class:btn-dark" data-target="#showPassword">显示</button>
                        </span>
                        </div>
                    </div>
                    <div class="checkbox">
                        <label class="checkbox-custom">
                            <input type="checkbox" name="remeberPwd">
                            <i class="fa fa-fw fa-square-o checked"></i> 记住密码 </label>
                    </div>
                    <a href="" class="pull-right m-t-xs" id="forget_psw">
                        <small>忘记密码？</small>
                    </a>
                    <button type="submit" class="btn btn-primary">　登录　</button>
                    <div class="line line-dashed"></div>

                    <p class="text-muted text-center">
                        <small>没有账号？</small>
                    </p>
                    <button type="button" id="toRegist" class="btn btn-info btn-block">立即注册</button>
                </form>
            </section>
        </div>
    </div>

    <%--注册界面 style="display:none;"--%>
    <div id="showRegister" <c:if test='${pageCode == 1}'>
        style="display:none;"
    </c:if>>
        <div class="container aside-xxl">
            <div class="text-center">
                <div class="thumb-md">
                    <img src="<c:url value='/images/logo.png'/> ">
                </div>
            </div>
            <a class="navbar-brand block animated bounceInRight" href="">文章管理系统　|　注册页　　　</a>

            <%--导入校验结果页面--%>
            <%@include file="/WEB-INF/jsps/format/errorMsg.jsp" %>

            <section class="panel panel-default bg-white m-t-lg animated bounceInLeft">
                <header class="panel-heading text-center"><strong>REGISTER</strong></header>

                <form action="<c:url value='/user/register.do'/> " class="panel-body wrapper-lg" method="post"
                      data-validate="parsley" id="registerForm">
                    <div class="form-group pull-in clearfix">
                        <div class="col-sm-6">
                            <input name="username" type="text" class="form-control" data-rangelength="[1,64]"
                                   placeholder="注册用于登录的名字" data-required="true" value="${user.username}">
                        </div>
                        <div class="col-sm-6">
                            <input name="screenName" type="text" class="form-control" data-rangelength="[1,100]"
                                   placeholder="注册用于显示的名字" data-required="true" value="${user.screenName}">
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" placeholder="注册密码-密码长度在2-20之间" data-rangelength="[2,20]"
                               class="form-control parsley-validated" data-required="true" id="firstPwd"
                               value="${user.password}">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password2" placeholder="请确认密码"
                               class="form-control parsley-validated"
                               data-equalto="#firstPwd" data-required="true">
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" placeholder="注册邮箱"
                               class="form-control parsley-validated" data-required="true" value="${user.email}">
                    </div>

                    <div class="checkbox">
                        <label class="checkbox-custom">
                            <input type="checkbox" name="check" checked="" data-required="true"
                                   class="parsley-validated"><i class="fa fa-fw fa-square-o checked"></i>
                            <font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">我同意</font></font>
                            <a href="javascript:void(0)" class="clause" data-method="notice"><font
                                    style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;" class="text-info">网站服务条款</font></font></a>
                        </label>

                    </div>

                    <input type="submit" class="btn btn-warning" id="registerBtn" value="　注册　"/>
                    <div class="line line-dashed"></div>

                    <p class="text-muted text-center">
                        <small>已有账号？</small>
                    </p>
                    <a type="button" id="toLogin" class="btn btn-danger btn-block">立即登录</a>
                </form>
            </section>
        </div>
    </div>

</section>
<!-- footer -->
<footer id="footer">
    <div class="text-center padder">
        <p>
            <small>文章管理系统 | By HuTao<br>
                &copy; 2017
            </small>
        </p>
    </div>
</footer>
<!-- / footer -->

<script src="<c:url value='/js/app.v2.js'/>"></script>
<!-- fuelux -->
<script src="<c:url value='/js/fuelux/fuelux.js'/>" cache="false"></script>
<!-- 表单验证 -->
<script src="<c:url value='/js/parsley/parsley.min.js'/>" cache="false"></script>
<script src="<c:url value='/js/parsley/parsley.extend.js'/>" cache="false"></script>

<!-- layui -->
<script src="<c:url value='/js/layui/layui.js'/>" cache="false"></script>

<script>
    var $clauseText = '<ul class="clauseText"> <li><a href="#" target="_blank">1. 用户名请保证在1-64个字符之间，显示名请在100字符以内</a></li> <li><a href="http://www.hutaotao.cn" target="_blank">2. 关注主页</a></li> <li><a href="#" target="_blank">3. 弹窗将在十秒后关闭</a></li> </ul>';
    var $registerTest = '<div class="text-center" style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">                <h4 >注册成功 | 文章管理系统</h4><br> <p>亲爱的用户：${user.screenName}</p> <p>欢迎来到文章管理系统，您的账号 ${user.username} 已经注册成功</p> <p>请及时前往邮箱，完成激活。</p><h6>窗口将在十秒后自动关闭</h6><br><div class="line line-dashed"></div></div>';
    var $msgTime = 2000;

    //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer
            , form = layui.form
            , $ = layui.jquery;


        <c:choose>

        <c:when test="${operateCode==100 or operateCode==110 or operateCode==220 or operateCode==210}">
        layer.msg('${errorMsg}', {icon: 5, time: $msgTime})
        </c:when>

        <c:when test="${operateCode==221}">
        layer.msg('激活成功', {icon: 6, time: $msgTime});
        </c:when>

        <c:when test="${operateCode==121}">
        layer.msg('退出成功，请重新登录', {icon: 6, time: $msgTime});
        </c:when>


        <%--注册成功--%>
        <c:when test="${operateCode==211}">

        layer.open({
            type: 1,
            title: false, //不显示标题栏
            closeBtn: true,
            area: '300px;',
            shade: 0.8,
            id: 'LAY_layuipro', //设定一个id，防止重复弹出
            btn: ['进入邮箱', '暂不激活'],
            moveType: 1, //拖拽模式，0或者1
            content: $registerTest,
            success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
                btn.find('.layui-layer-btn0').attr({
                    href: '${url}'
                    , target: '_blank'
                });
            }
        });
        </c:when>

        </c:choose>


        /*服务条款*/
        $(".clause").click(function () {
            layer.alert($clauseText, {
                skin: 'layui-layer-molv'
                , closeBtn: 0
                , anim: 0 //动画类型
                , time: 10000
                , shade: [0.8, '#393D49']
            });
        });


        //显示加载数据
        function ShowDiv() {
            layer.msg('正在注册中<br> 后台校验完毕后会发送邮件 请您稍后。', {
                icon: 16,
                shade: 0.7,
                time: 0
            });
        }

    });
</script>


</body>

</html>
