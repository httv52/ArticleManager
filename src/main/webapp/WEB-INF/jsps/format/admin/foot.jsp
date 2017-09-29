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
<%--导入恢复功能--%>
<%@include file="/WEB-INF/jsps/format/tools/reply.jsp" %>

<%@include file="/WEB-INF/jsps/format/tools/nav_bar.jsp" %>


<script src="<c:url value='/js/fuelux/fuelux.js'/>"></script>

<!-- layui -->
<script src="<c:url value='/js/layer-v3.1.0/layer/layer.js'/>"></script>
<script src="<c:url value='/js/layer-v3.1.0/layer/dist.js'/>"></script>


<%-- chat--%>
<script src="<c:url value='/js/charts/easypiechart/jquery.easy-pie-chart.js'/>" cache="false"></script>
<script src="<c:url value='/js/charts/sparkline/jquery.sparkline.min.js'/>" cache="false"></script>

</body>

</html>