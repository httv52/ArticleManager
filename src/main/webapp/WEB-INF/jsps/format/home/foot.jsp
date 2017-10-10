<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--导入头像文件--%>
<script src="<c:url value='/js/iden/identicon.js'/>"></script>
<script src="<c:url value='/js/iden/pnglib.js'/>"></script>
<script src="<c:url value='/js/demo/myBase.js'/>"></script>

<%@include file="/WEB-INF/jsps/format/admin/headImg.jsp" %>

<!-- footer -->
<footer id="footer">
    <div class="bg-primary text-center">
        <div class="container wrapper">
            <div class="m-t-xl m-b"> 还在等什么？快点感受她的魅力吧
                <a href="<c:url value="/user/showRegister"/>" target="_blank" class="btn btn-lg btn-dark b-white bg-empty m-sm">加入我们</a>
                <a href="<c:url value="/index/hutao"/>" target="_blank" class="btn btn-lg btn-warning b-white bg-empty m-sm">我的博客</a>
            </div>
        </div>
        <i class="fa fa-caret-down fa-4x text-primary m-b-n-lg block"></i></div>
    <div class="bg-dark dker wrapper">
        <div class="container text-center m-t-lg">
            <div class="row m-t-xl m-b-xl">
                <div class="col-sm-3" data-ride="animated" data-animation="fadeInLeft" data-delay="300"><i
                        class="fa fa-list-alt fa-3x icon-muted"></i>
                    <h5 class="text-uc m-b m-t-lg">备案</h5>
                    <p class="text-sm"><a style="color:#fff;" href="http://www.miitbeian.gov.cn" target="_blank">皖ICP备17011465号</a></p>
                </div>
                <div class="col-sm-3" data-ride="animated" data-animation="fadeInLeft" data-delay="300"><i
                        class="fa fa-map-marker fa-3x icon-muted"></i>
                    <h5 class="text-uc m-b m-t-lg">地址</h5>
                    <p class="text-sm">皖黄山市黄山学院南区 </p>
                </div>
                <div class="col-sm-3" data-ride="animated" data-animation="fadeInUp" data-delay="600"><i
                        class="fa fa-envelope-o fa-3x icon-muted"></i>
                    <h5 class="text-uc m-b m-t-lg">邮箱</h5>
                    <p class="text-sm"><a href="mailto:tao@hutaotao.cn">tao@hutaotao.cn</a></p>
                </div>
                <div class="col-sm-3" data-ride="animated" data-animation="fadeInRight" data-delay="900"><i
                        class="fa fa-phone-square fa-3x icon-muted"></i>
                    <h5 class="text-uc m-b m-t-lg">电话</h5>
                    <p class="text-sm">18855993890 </p>
                </div>
            </div>
            <div class="m-t-xl m-b-xl">
                <p>
                    <a href="https://www.zhihu.com/people/hu-tao-6-91" class="btn btn-icon btn-rounded m-sm"
                       data-toggle="tooltip" data-placement="top" title="知乎" target="_blank"
                       style="background-color: #0f88eb;color: #fff;">
                        知
                    </a>
                    <a href="http://weibo.com/u/5360387482" class="btn btn-rounded btn-danger btn-icon m-sm"
                       data-toggle="tooltip"
                       data-placement="top" title="微博" target="_blank">
                        <i class="fa fa-weibo"></i>
                    </a>
                    <a href="https://github.com/httv52" class="btn btn-rounded btn-primary btn-icon  m-sm"
                       data-toggle="tooltip" data-placement="top" title="Github" target="_blank">
                        <i class="fa fa-github"></i>
                    </a>
                    <a href="#" class="btn btn-icon btn-rounded btn-facebook m-sm"
                       data-toggle="tooltip" data-placement="top" title="FaceBook">
                        <i class="fa fa-facebook"></i>
                    </a>
                    <a href="#" class="btn btn-icon btn-rounded btn-twitter m-sm"
                       data-toggle="tooltip" data-placement="top" title="推特">
                        <i class="fa fa-twitter"></i>
                    </a>
                </p>
                <p><a href="#content" data-jump="true"
                      class="btn btn-icon btn-rounded btn-dark b-dark bg-empty m-sm text-muted"
                      data-toggle="tooltip" data-placement="top" title="返回顶部">
                    <i class="fa fa-angle-up"></i></a>
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- / footer -->
<script src="js/app.v2.js"></script> <!-- Bootstrap --> <!-- App -->
<script src="js/appear/jquery.appear.js" cache="false"></script>
<script src="js/scroll/smoothscroll.js" cache="false"></script>
<script src="js/landing.js" cache="false"></script>
</body>
</html>