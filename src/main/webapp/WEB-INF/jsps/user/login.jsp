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
    <link rel="stylesheet" href="<c:url value='/css/plugins/sweetalert/sweetalert.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/css/semantic/semantic.min.css"/>">
    <link rel="stylesheet" href="<c:url value='/js/layui/css/layui.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/app.v2.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/js/fuelux/fuelux.css'/>" type="text/css"/>
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>" type="text/css"/>

    <link rel="stylesheet" href="<c:url value='/js/plugins/buzyload/app.min.css'/>" type="text/css"/>

    <!-- / jquery -->
    <script src="<c:url value='/js/jquery-3.2.1.js'/>"></script>
    <script src="<c:url value='/js/print/jquery.printarea.js'/>"></script>

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
                // $("#printModel").printArea();
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

<body onclick="click_change()">
<section class="m-t-lg wrapper-md animated fadeInUp">

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

                <form class="panel-body wrapper-lg" data-validate="parsley" id="login_form">
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
                    <button type="button" class="btn btn-primary" onclick="user_login()">　登录　</button>
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

                <form action="<c:url value='/user/register'/> " class="panel-body wrapper-lg" method="post"
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
                            <a class="clause modalsix" data-method="notice"><font
                                    style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;" class="text-info">网站服务条款</font></font>
                            </a>
                        </label>

                    </div>

                    <input type="submit" class="btn btn-warning" id="registerBtn" value="　注册　"/>
                    <div class="line line-dashed"></div>

                    <p class="text-muted text-center">
                        <small>已有账号？</small>
                    </p>
                    <a id="toLogin" class="btn btn-danger btn-block">立即登录</a>
                </form>
            </section>
        </div>
    </div>

</section>
<!-- footer -->
<footer id="footer">
    <div class="text-center padder">
        <p id="footer_text">
            <small>文章管理系统 | By HuTao<br>
                &copy; 2017
            </small>
        </p>
    </div>
</footer>
<!-- / footer -->

<div class="ui long test modal" id="printModel">
    <div class="header">
        文章管理系统
    </div>
    <div class="image content">
        <div class="ui medium image">
            <img src="<c:url value='/images/logo.png'/>"/>
        </div>
        <div class="description">
            <div class="ui header">
                用户注册协议
            </div>
            <p>
                您的注册、登录、使用等行为将视为对本协议的接受，并同意接受本协议各项条款的约束。
            </p>
            <!-- <img class="ui wireframe image" src="img/wireframe/paragraph.png">
        <div class="ui divider"></div> -->
            <h4>一、总则</h4>
            1.1
            <b> 文章管理系统 </b>的所有权和运营权归本人所有所有。
            <br> 1.2 用户在注册之前，应当仔细阅读本协议，并同意遵守本协议后方可成为注册用户。一旦注册成功，则用户与
            <b> 文章管理系统 </b>之间自动形成协议关系，用户应当受本协议的约束。用户在使用特殊的服务或产品时，应当同意接受相关协议后方能使用。
            <br> 1.3 本协议则可由
            <b> 文章管理系统 </b>随时更新，用户应当及时关注并同意本站不承担通知义务。本站的通知、公告、声明或其它类似内容是本协议的一部分。
            <p></p>
            <p>
            </p>
            <h4>二、服务内容</h4>
            2.1
            <b> 文章管理系统 </b>的具体内容由本站根据实际情况提供。
            <br> 2.2
            本站仅提供相关的网络服务，除此之外与相关网络服务有关的设备(如个人电脑、手机、及其他与接入互联网或移动网有关的装置)及所需的费用(如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费)均应由用户自行负担。
            <p></p>
            <p>
            </p>
            <h4>三、用户帐号</h4>
            3.1 经本站注册系统完成注册程序并通过身份认证的用户即成为正式用户，可以获得本站规定用户所应享有的一切权限；未经认证仅享有本站规定的部分会员权限。
            <b> 文章管理系统 </b>有权对会员的权限设计进行变更。
            <br> 3.2
            用户只能按照注册要求使用真实姓名，及身份证号注册。用户有义务保证密码和帐号的安全，用户利用该密码和帐号所进行的一切活动引起的任何损失或损害，由用户自行承担全部责任，本站不承担任何责任。如用户发现帐号遭到未授权的使用或发生其他任何安全问题，应立即修改帐号密码并妥善保管，如有必要，请通知本站。因黑客行为或用户的保管疏忽导致帐号非法使用，本站不承担任何责任。
            <p></p>
            <p>
            </p>
            <h4>四、使用规则</h4>
            4.1
            遵守中华人民共和国相关法律法规，包括但不限于《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》、《最高人民法院关于审理涉及计算机网络著作权纠纷案件适用法律若干问题的解释(法释[2004]1号)》、《全国人大常委会关于维护互联网安全的决定》、《互联网电子公告服务管理规定》、《互联网新闻信息服务管理规定》、《互联网著作权行政保护办法》和《信息网络传播权保护条例》等有关计算机互联网规定和知识产权的法律和法规、实施办法。
            <br> 4.2 用户对其自行发表、上传或传送的内容负全部责任，所有用户不得在本站任何页面发布、转载、传送含有下列内容之一的信息，否则本站有权自行处理并不通知用户：
            <br>
            <span>　　 (1) 违反宪法确定的基本原则的；
                        <br>　　 (2) 危害国家安全，泄漏国家机密，颠覆国家政权，破坏国家统一的；
                        <br>　　 (3) 损害国家荣誉和利益的；
                        <br>　　 (4) 煽动民族仇恨、民族歧视，破坏民族团结的；
                        <br>　　 (5) 破坏国家宗教政策，宣扬邪教和封建迷信的；
                        <br>　　 (6) 散布谣言，扰乱社会秩序，破坏社会稳定的；
                        <br>　　 (7) 散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；
                        <br>　　 (8) 侮辱或者诽谤他人，侵害他人合法权益的；
                        <br>　　 (9) 煽动非法集会、结社、游行、示威、聚众扰乱社会秩序的；
                        <br>　　 (10) 以非法民间组织名义活动的；
                        <br>　　 (11) 含有法律、行政法规禁止的其他内容的。
                    </span>
            <br> 4.3
            用户承诺对其发表或者上传于本站的所有信息(即属于《中华人民共和国著作权法》规定的作品，包括但不限于文字、图片、音乐、电影、表演和录音录像制品和电脑程序等)均享有完整的知识产权，或者已经得到相关权利人的合法授权；如用户违反本条规定造成本站被第三人索赔的，用户应全额补偿本站一切费用(包括但不限于各种赔偿费、诉讼代理费及为此支出的其它合理费用)；
            <br> 4.4
            当第三方认为用户发表或者上传于本站的信息侵犯其权利，并根据《信息网络传播权保护条例》或者相关法律规定向本站发送权利通知书时，用户同意本站可以自行判断决定删除涉嫌侵权信息，除非用户提交书面证据材料排除侵权的可能性，本站将不会自动恢复上述删除的信息；
            <span>
                        <br>　　 (1) 不得为任何非法目的而使用网络服务系统；
                        <br>　　 (2) 遵守所有与网络服务有关的网络协议、规定和程序；
                        <br>　　 (3)不得利用本站进行任何可能对互联网的正常运转造成不利影响的行为；
                        <br>　　 (4) 不得利用本站进行任何不利于本站的行为。
                    </span>
            <br> 4.5 如用户在使用网络服务时违反上述任何规定，本站有权要求用户改正或直接采取一切必要的措施(包括但不限于删除用户张贴的内容、暂停或终止用户使用网络服务的权利)以减轻用户不当行为而造成的影响。
            <p></p>
            <p>
            </p>
            <h4>五、隐私保护</h4>
            5.1 本站不对外公开或向第三方提供单个用户的注册资料及用户在使用网络服务时存储在本站的非公开内容，但下列情况除外：
            <span>
                        <br>　　 (1) 事先获得用户的明确授权；
                        <br>　　 (2) 根据有关的法律法规要求；
                        <br>　　 (3) 按照相关政府主管部门的要求；
                        <br>　　 (4) 为维护社会公众的利益。
                    </span>
            <br>5.2 本站可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与本站同等的保护用户隐私的责任，则本站有权将用户的注册资料等提供给该第三方。
            <br> 5.3 在不透露单个用户隐私资料的前提下，本站有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。
            <p></p>
            <p>
            </p>
            <h4>六、版权声明</h4>
            6.1 本站的文字、图片、音频、视频等版权均归永兴元科技有限公司享有或与作者共同享有，未经本站许可，不得任意转载。
            <br> 6.2 本站特有的标识、版面设计、编排方式等版权均属永兴元科技有限公司享有，未经本站许可，不得任意复制或转载。
            <br> 6.3 使用本站的任何内容均应注明“来源于
            <b> 文章管理系统 </b>”及署上作者姓名，按法律规定需要支付稿酬的，应当通知本站及作者及支付稿酬，并独立承担一切法律责任。
            <br> 6.4 本站享有所有作品用于其它用途的优先权，包括但不限于网站、电子杂志、平面出版等，但在使用前会通知作者，并按同行业的标准支付稿酬。
            <br> 6.5 本站所有内容仅代表作者自己的立场和观点，与本站无关，由作者本人承担一切法律责任。
            <br> 6.6 恶意转载本站内容的，本站保留将其诉诸法律的权利。
            <p></p>
            <p>
            </p>
            <h4>七、责任声明</h4>
            7.1 用户明确同意其使用本站网络服务所存在的风险及一切后果将完全由用户本人承担，
            <b> 文章管理系统 </b>对此不承担任何责任。
            <br> 7.2 本站无法保证网络服务一定能满足用户的要求，也不保证网络服务的及时性、安全性、准确性。
            <br> 7.3 本站不保证为方便用户而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由本站实际控制的任何网页上的内容，本站不承担任何责任。
            <br> 7.4 对于因不可抗力或本站不能控制的原因造成的网络服务中断或其它缺陷，本站不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。
            <br> 7.5 对于站向用户提供的下列产品或者服务的质量缺陷本身及其引发的任何损失，本站无需承担任何责任：
            <span>
                        <br>　　 (1) 本站向用户免费提供的各项网络服务；
                        <br>　　 (2) 本站向用户赠送的任何产品或者服务。
                    </span>
            7.6 本站有权于任何时间暂时或永久修改或终止本服务(或其任何部分)，而无论其通知与否，本站对用户和任何第三人均无需承担任何责任。
            <p></p>
            <p>
            </p>
            <h4>八、附则</h4>
            8.1 本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。
            <br> 8.2 如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。
            <br> 8.3 本协议解释权及修订权归本人所有。
            <h4>九、MIT License</h4>
            MIT License

            <br>Copyright (c) [year] [fullname]

            <br>
            <br>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
            associated
            documentation files (the "Software"), to deal in the Software without restriction, including without
            limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
            of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
            conditions:

            <br>
            <br>The above copyright notice and this permission notice shall be included in all copies or substantial
            portions of the Software.

            <br>
            <br>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
            LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
            NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
            WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
            OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
            <p></p>
        </div>
        <!-- </div> -->
    </div>
    <div class="actions">
        <div class="ui primary approve button">
            同意并继续
        </div>
    </div>
</div>

<script src="<c:url value='/js/semantic/semantic.min.js'/>" cache="false"></script>
<script src="<c:url value='/js/plugins/custer/custom-modal.js'/>" cache="false"></script>

<script src="<c:url value='/js/app.v2.js'/>"></script>
<!-- fuelux -->
<script src="<c:url value='/js/fuelux/fuelux.js'/>" cache="false"></script>
<!-- 表单验证 -->
<script src="<c:url value='/js/parsley/parsley.min.js'/>" cache="false"></script>
<script src="<c:url value='/js/parsley/parsley.extend.js'/>" cache="false"></script>

<!-- layui -->
<script src="<c:url value='/js/layui/layui.js'/>" cache="false"></script>

<script src="<c:url value='/js/plugins/sweetalert/sweetalert.min.js'/>"></script>
<script src="<c:url value='/js/plugins/buzyload/app.min.js'/>"></script>
<script src="<c:url value='/js/demo/myBase.js'/>"></script>

<script>
    function changeBg() {
        var colors = ["#dedddd", "#dedddd", "#dedddd", "#dedddd", "#dedddd", "#717171", "#dedddd", "#dedddd", "#717171", "#dedddd", "#dedddd", "#dedddd", "#dedddd", "#dedddd", "#717171", "#dedddd", "#dedddd", "#717171"];
        var bg_colors = ["#F25F5C", "#247BA0", "#8e44ad", "#ED6A5A", "#32936F", "#2c3e50", "#E83F6F", "#32936F", "#2E294E", "#F25F5C", "#247BA0", "#8e44ad", "#ED6A5A", "#32936F", "#2c3e50", "#E83F6F", "#32936F", "#2E294E"];


        var rand = Math.floor(Math.random() * colors.length);

        $('body').css("background-color", bg_colors[rand]);
        $('#footer_text').css("color", colors[rand]);
    }

    changeBg();

    function click_change() {
        changeBg();
    }

    var int = self.setInterval(" changeBg()", 5000);

    var $clauseText = '<ul class="clauseText"> <li><a href="#" target="_blank">1. 用户名请保证在1-64个字符之间，显示名请在100字符以内</a></li> <li><a href="http://www.hutaotao.cn" target="_blank">2. 关注主页</a></li> <li><a href="#" target="_blank">3. 弹窗将在十秒后关闭</a></li> </ul>';
    var $registerTest = '<div class="text-center" style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">                <h4 >注册成功 | 文章管理系统</h4><br> <p>亲爱的用户：${user.screenName}</p> <p>欢迎来到文章管理系统，您的账号 ${user.username} 已经注册成功</p> <p>请及时前往邮箱，完成激活。</p><h6>窗口将在十秒后自动关闭</h6><br><div class="line line-dashed"></div></div>';
    var $msgTime = 2000;
    var hutao = new $.hutao();

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
        layer.msg('退出成功，请重新登录', {icon: 6, time: 800});
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


//        /*服务条款*/
//        $(".clause").click(function () {
//            layer.alert($clauseText, {
//                skin: 'layui-layer-molv'
//                , closeBtn: 0
//                , anim: 0 //动画类型
//                , time: 10000
//                , shade: [0.8, '#393D49']
//            });
//        });


        //显示加载数据
        function ShowDiv() {
            layer.msg('正在注册中<br> 后台校验完毕后会发送邮件 请您稍后。', {
                icon: 16,
                shade: 0.7,
                time: 0
            });
        }

    });

    function user_login() {
        hutao.showLoading({
            spinner: 'accordion',
            text: '登陆中，请稍等',
            fontSize: '2rem'
        });

        hutao.post({
            url: '<c:url value='/user/login'/>',
            data: $("#login_form").serialize(),
            success: function (result) {
                handlerResult(result, ajax_success);
            }
        });
    }

    function ajax_success() {
        hutao.successAlert("登陆成功，即将跳转");
        window.location.href = '<c:url value="/admin/index"/>';
    }
</script>


</body>

</html>
