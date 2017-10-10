<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/jsps/format/home/head.jsp" %>

<section id="content">
    <div class="bg-dark lt">
        <div class="container">
            <div class="m-b-lg m-t-lg">
                <h3 class="m-b-none">指南</h3>
                <small class="text-muted">文章管理系统指南</small>
            </div>
        </div>
    </div>
    <div>
        <div class="container m-t-xl">
            <div class="row">
                <div class="col-sm-7">
                    <h2 class="font-thin m-b-lg">基于Bootstrap的响应式布局<br> 适用于
                        <span class="text-primary">手机</span>,
                        <span class="text-primary">平板</span>,
                        <span class="text-primary">电脑</span></h2>
                    <p class="h4 m-b-lg l-h-1x">您的管理系统在不同的操作系统，或是不同尺寸的设备上，都能得到完美的现实</p>
                    <div class="row m-b-xl">
                        <div class="col-sm-6"><i class="fa fa-fw fa-angle-right"></i>Windows</div>
                        <div class="col-sm-6"><i class="fa fa-fw fa-angle-right"></i>手机</div>
                        <div class="col-sm-6"><i class="fa fa-fw fa-angle-right"></i>Linux</div>
                        <div class="col-sm-6"><i class="fa fa-fw fa-angle-right"></i>平板</div>
                        <div class="col-sm-6"><i class="fa fa-fw fa-angle-right"></i>Android & IOS</div>
                        <div class="col-sm-6"><i class="fa fa-fw fa-angle-right"></i>电脑</div>
                    </div>
                    <p class="clearfix">&nbsp;</p>
                    <div class="row m-b-xl">
                        <div class="col-xs-2"><i class="fa fa-desktop fa-4x icon-muted"></i></div>
                        <div class="col-xs-2"><i class="fa fa-plus icon-muted m-t"></i></div>
                        <div class="col-xs-2"><i class="fa fa-tablet fa-4x icon-muted"></i></div>
                        <div class="col-xs-2"><i class="fa fa-plus icon-muted m-t"></i></div>
                        <div class="col-xs-2"><i class="fa fa-mobile fa-4x icon-muted"></i></div>
                    </div>
                </div>
                <div class="col-sm-5 text-center">
                    <section class="panel bg-dark inline aside-md no-border device phone animated fadeInRightBig">
                        <header class="panel-heading text-center"><i
                                class="fa fa-minus fa-2x icon-muted m-b-n-xs block"></i></header>
                        <div class="m-l-xs m-r-xs">
                            <div class="carousel auto slide" id="c-fade" data-interval="3000">
                                <div class="carousel-inner">
                                    <div class="item active text-center"><img src="images/phone-2_1.png"
                                                                              class="img-full"></div>
                                    <div class="item text-center"><img src="images/phone-1_1.png" class="img-full">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <footer class="bg-dark text-center panel-footer no-border"><i
                                class="fa fa-circle icon-muted fa-lg"></i></footer>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <div class="bg-white b-t b-light">
        <div class="container">
            <div class="row m-t-xl m-b-xl">
                <div class="col-sm-5 text-center clearfix m-t-xl" data-ride="animated" data-animation="fadeInLeftBig">
                    <div class="h1 font-bold m-t-xl m-b-xl">
                        <img src="images/screenshot.png" width="90%">
                    </div>
                </div>
                <div class="col-sm-7">
                    <h2 class="font-thin m-b-lg">唯一标识的头像 Identicon</h2>
                    <p class="h4 m-b-lg l-h-1x">
                        Identicon是一种基于用户信息的哈希值生成图像的技术，通常使用用户登录时的IP地址作为输入值，并作为生成新建用户时的初始化头像用于保护用户隐私。其雏形是由九个方格构成的图案，现在第三方开发还有其他类型的生成模式。</p>
                    <p class="m-b-xl">引用自一个开源的<a href="https://github.com/stewartlord/identicon.js/tree/master"
                                                 target="_blank">Github库</a></p>
                    <p class="m-t-xl m-b-xl h4"><i class="fa fa-quote-left fa-fw fa-1x icon-muted"></i> 暂不支持自定义头像</p>
                </div>
            </div>
        </div>
    </div>
    <div class="b-t b-light">
        <div class="container m-t-xl">
            <div class="row">
                <div class="col-sm-7">
                    <h2 class="font-thin m-b-lg">应用程序风格</h2>
                    <p class="h4 m-b-lg l-h-1x">她是一种简介大方的风格，通过对BootStrap的深度定制而产生</p>
                    <p class="h4 m-b-lg l-h-1x">
                        管理后台界面(Dashboard)是给用户使用的一个信息管理系统，也称作仪表盘，用于管理和查看相关信息。我们在后台界面的用户体验上花了很多心思，从而告别单一的排版布局</p>
                    <p class="m-b-xl"><a href="<c:url value="/user/showRegister"/>" target="_blank" class="btn btn-sm btn-primary font-bold">试一试</a></p>
                </div>
                <div class="col-sm-5 text-center" data-ride="animated" data-animation="fadeInUp">
                    <section class="panel bg-dark m-t-lg m-r-n-lg m-b-n-lg no-border device animated fadeInUp">
                        <header class="panel-heading text-left"><i class="fa fa-circle fa-fw icon-muted"></i> <i
                                class="fa fa-circle fa-fw icon-muted"></i> <i class="fa fa-circle fa-fw icon-muted"></i>
                        </header>
                        <img src="images/main_1.png" class="img-full"></section>
                </div>
            </div>
        </div>
    </div>
    <div class="bg-white b-t b-light pos-rlt">
        <div class="container">
            <div class="row m-t-xl m-b-xl">
                <div class="col-sm-5 text-center clearfix m-t-xl" data-ride="animated" data-animation="fadeInLeftBig">
                    <div class="h3 font-bold m-t-xl m-b-xl"><i class="fa fa-circle text-primary fa-2x"></i> <i
                            class="fa fa-circle text-info fa-2x"></i> <i class="fa fa-circle text-success fa-2x"></i> <i
                            class="fa fa-circle text-warning fa-2x"></i> <i class="fa fa-circle text-danger fa-2x"></i>
                        <i class="fa fa-circle text-dark fa-2x"></i> <i class="fa fa-circle text-light fa-2x"></i></div>
                </div>
                <div class="col-sm-7">
                    <h2 class="font-thin m-b-lg">丰富多彩的配色</h2>
                    <p class="h4 m-b-lg l-h-1x">我们修改了bootstrap的默认配色，提供了8种自己的调色板</p>
                    <ul class="m-b-xl fa-ul">
                        <li><i class="fa fa-li fa-check text-muted"></i>颜色简洁大方</li>
                        <li><i class="fa fa-li fa-check text-muted"></i>告别审美疲劳</li>
                        <li><i class="fa fa-li fa-check text-muted"></i>允许自己自定义风格</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="b-t b-light">
        <div class="container m-t-xl">
            <div class="row">
                <div class="col-sm-7">
                    <h2 class="font-thin m-b-lg">结合Mysql和RESTful API的文章系统</h2>
                    <p class="h4 m-b-lg l-h-1x">我们更倾向以支持Markdown风格的文章编辑，你可以得到赏心悦目的博客文章</p>
                    <p class="m-t-xl m-b-xl h4"><i class="fa fa-quote-left fa-fw fa-1x icon-muted"></i>
                        Markdown是一种可以使用普通文本编辑器编写的标记语言，通过简单的标记语法，它可以使普通文本内容具有一定的格式。</p>
                    <p class="m-b-xl"><a href="<c:url value="/user/showRegister"/>" target="_blank" class="btn btn-dark font-bold">试一试</a></p>
                </div>
                <div class="col-sm-5 text-center" data-ride="animated" data-animation="fadeInRightBig">
                    <section class="panel bg-light m-t-lg m-r-n-lg m-b-n-lg no-border device animated fadeInUp">
                        <header class="panel-heading text-left"><i class="fa fa-circle fa-fw icon-muted"></i> <i
                                class="fa fa-circle fa-fw icon-muted"></i> <i class="fa fa-circle fa-fw icon-muted"></i>
                        </header>
                        <img src="images/app_1.png" class="img-full"></section>
                </div>
            </div>
        </div>
    </div>
    <div class="b-t b-light pos-rlt bg-white">
        <div class="container">
            <p class="m-t-xl m-b-xl"><font style="vertical-align: inherit;">
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
</section>

<%@include file="/WEB-INF/jsps/format/home/foot.jsp" %>
