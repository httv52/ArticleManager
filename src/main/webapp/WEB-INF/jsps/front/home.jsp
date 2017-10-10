<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/jsps/format/home/head.jsp" %>

<section id="content">
    <div class="bg-primary dk">
        <div class="text-center wrapper">
            <div class="m-t-xl m-b-xl">
                <div class="text-uc h1 font-bold inline">
                    <div class="pull-left m-r-sm text-white">
                        <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">文章管理系统</font>
                        </font>
                        <span class="font-thin text-muted">
                        <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">让你</font></font>
                        </span>
                    </div>
                    <div class="carousel slide carousel-fade inline auto aside text-left pull-left pull-none-xs"
                         data-interval="2000">
                        <div class="carousel-inner">
                            <div class="item text-warning">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;"> 轻松管理 </font>
                                </font>
                            </div>
                            <div class="item text-dark">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;"> 快速搭建 </font>
                                </font>
                            </div>
                            <div class="item active"><font style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;"> 爱不释手 </font></font>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="h4 text-muted m-t-sm"><font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">探索未知以分享，记录已知以备忘</font></font>
                </div>
            </div>
            <p class="text-center m-b-xl"><a href="<c:url value="/user/showRegister"/> " target="_blank" class="btn btn-lg btn-dark m-sm">
                <font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">加入我们</font></font></a>
                <a href="<c:url value="/index/hutao"/>" target="_blank" class="btn btn-lg btn-warning b-white bg-empty m-sm">
                    <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">我的博客</font></font>
                </a>
            </p>
        </div>
        <div class="padder">
            <div class="hbox">
                <aside class="col-md-3 v-bottom text-right">
                    <div class="hidden-sm hidden-xs">
                        <section
                                class="panel bg-dark inline m-b-n-lg m-r-n-lg aside-sm no-border device phone animated fadeInLeftBig">
                            <header class="panel-heading text-center"><i class="fa fa-minus fa-2x m-b-n-xs block"></i>
                            </header>
                            <div>
                                <div class="m-l-xs m-r-xs"><img src="images/phone-2_1.png" class="img-full"></div>
                            </div>
                        </section>
                    </div>
                </aside>
                <aside class="col-sm-10 col-md-6">
                    <section class="panel bg-dark m-b-n-lg no-border device animated fadeInUp">
                        <header class="panel-heading text-left"><i class="fa fa-circle fa-fw"></i>
                            <i class="fa fa-circle fa-fw"></i> <i class="fa fa-circle fa-fw"></i>
                        </header>
                        <img src="images/main_1.png" class="img-full"></section>
                </aside>
                <aside class="col-md-3 v-bottom">
                    <div class="hidden-sm hidden-xs">
                        <section
                                class="panel bg-light m-b-n-lg m-l-n-lg aside no-border device phone animated fadeInRightBig">
                            <header class="panel-heading text-center">
                                <i class="fa fa-minus fa-2x text-white m-b-n-xs block"></i>
                            </header>
                            <div class="">
                                <div class="m-l-xs m-r-xs"><img src="images/phone-1_1.png" class="img-full"></div>
                            </div>
                        </section>
                    </div>
                </aside>
            </div>
        </div>
        <div class="dker pos-rlt">
            <div class="container wrapper">
                <div class="m-t-lg m-b-lg text-center"><font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;"> 一站式的展示前后台交互 </font></font>
                </div>
            </div>
        </div>
    </div>
    <div id="about">
        <div class="container">
            <div class="m-t-xl m-b-xl text-center wrapper">
                <h3>
                    <font style="vertical-align: inherit;">
                        <font style="vertical-align: inherit;">响应式后台管理系统与前台页面</font>
                    </font>
                </h3>
            </div>
            <div class="row m-t-xl m-b-xl text-center">
                <div class="col-sm-4" data-ride="animated" data-animation="fadeInLeft" data-delay="300">
                    <p class="h3 m-b-lg"><i class="fa fa-magic fa-3x text-info"></i></p>
                    <div class="">
                        <h4 class="m-t-none"><font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">基于Bootstrap的栅格系统</font></font>
                        </h4>
                        <p class="text-muted m-t-lg"><font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">她是响应式的页面，可以展示在所有的大大小小的屏幕。</font>
                        </p>
                    </div>
                </div>
                <div class="col-sm-4" data-ride="animated" data-animation="fadeInLeft" data-delay="600">
                    <p class="h3 m-b-lg"><i class="fa fa-signal fa-3x text-warning"></i></p>
                    <div class="">
                        <h4 class="m-t-none"><font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">综合管理信息中心</font></font>
                        </h4>
                        <p class="text-muted m-t-lg">
                            <font style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;">
                                    你可以用她来管理你的博客文章，评论、文件以及页面的风格
                                </font>
                            </font></p>
                    </div>
                </div>
                <div class="col-sm-4d" data-ride="animated" data-animation="fadeInLeft" data-delay="900">
                    <p class="h3 m-b-lg"><i class="fa fa-rocket fa-3x text-danger"></i></p>
                    <div class="">
                        <h4 class="m-t-none">
                            <font style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;">RestFul风格</font></font>
                        </h4>
                        <p class="text-muted m-t-lg">
                            <font style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;">
                                    更简洁，更有层次，面向资源，一目了然，具有自解释性。
                                </font>
                            </font>
                        </p>
                    </div>
                </div>
            </div>
            <div class="m-t-xl m-b-xl text-center wrapper">
                <p class="h5"><font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">尽管她还不完美，但她一定会不断完善自己：待加入功能</font>
                </font><span class="text-primary"><font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">相似文章推荐</font>
                </font></span><font style="vertical-align: inherit;">
                    <font style="vertical-align: inherit;">，</font></font>
                    <span class="text-primary"><font style="vertical-align: inherit;">
                        <font style="vertical-align: inherit;">性能更高的点赞功能</font></font>
                    </span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">，</font></font>
                    <span class="text-primary"><font style="vertical-align: inherit;">
                        <font style="vertical-align: inherit;">积分系统</font></font>
                    </span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> ...</font>
                    </font>
                </p>
            </div>
        </div>
    </div>
    <div id="responsive" class="bg-dark">
        <div class="text-center">
            <div class="container">
                <div class="m-t-xl m-b-xl wrapper">
                    <h3 class="text-white"><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">它基于Bootstrap，简洁灵活，使得您的博客更加现代化</font></font></h3>
                    <p><font style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">您可以在任何设备上浏览她。</font></font><br><font
                            style="vertical-align: inherit;"></font>
                    </p>
                </div>
                <div class="row m-t-xl m-b-xl">
                    <div class="col-sm-4 wrapper-xl" data-ride="animated"
                         data-animation="fadeInLeft" data-delay="300">
                        <p class="text-center h2 m-b-lg m-t-lg"><span class="fa-stack fa-2x"> <i
                                class="fa fa-circle fa-stack-2x text-dark"></i> <i
                                class="fa fa-mobile fa-stack-1x text-muted"></i> </span></p>
                        <p><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">手机</font></font></p>
                    </div>
                    <div class="col-sm-4 wrapper-xl" data-ride="animated"
                         data-animation="fadeInLeft" data-delay="600">
                        <p class="text-center h1 m-b-lg"><span class="fa-stack fa-2x"> <i
                                class="fa fa-circle fa-stack-2x text-dark"></i> <i
                                class="fa fa-tablet fa-stack-1x text-muted"></i> </span></p>
                        <p><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">平板电脑</font></font></p>
                    </div>
                    <div class="col-sm-4 wrapper-xl" data-ride="animated"
                         data-animation="fadeInLeft" data-delay="900">
                        <p class="text-center h2 m-b-lg m-t-lg"><span class="fa-stack fa-2x"> <i
                                class="fa fa-circle fa-stack-2x text-dark"></i> <i
                                class="fa fa-desktop fa-stack-1x text-muted text-md"></i> </span></p>
                        <p><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">电脑</font></font></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="newsletter" class="bg-white clearfix wrapper-lg">
        <div class="container text-center m-t-xl m-b-xl" data-ride="animated" data-animation="fadeIn">
            <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">建议</font></font></h2>
            <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">小窝中存在Bug与不足？</font><font
                    style="vertical-align: inherit;">欢迎您的反馈</font></font></p>
            <form class="form-inline m-t-xl m-b-xl" data-ride="animated" data-animation="fadeInLeftBig"
                  data-delay="300">
                <section class="vbox b-b "
                         style="box-shadow: 0 10px 20px rgba(0, 0, 0, 0.22), 0 14px 56px rgba(0, 0, 0, 0.25);">
                    <section class="paper">
                        <textarea type="text" class="form-control scrollable" placeholder="输入您的反馈..."></textarea>
                        <a class="btn btn-default">
                            <i class="fa fa-bug text"></i> <span class="text">提交反馈</span></a>
                    </section>
                </section>
                </aside>
            </form>
        </div>
    </div>
</section>

<%@include file="/WEB-INF/jsps/format/home/foot.jsp" %>