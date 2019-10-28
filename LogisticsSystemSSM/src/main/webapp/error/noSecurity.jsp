<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath }" scope="page" var="ctx"></c:set>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>没有权限</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${cxt }/Content/css/bsgrid.all.min.css"
	type="text/css"></link>

</head>

<body style="background: #f8f9fa">

	<div class="w3layouts-bg">
		<div class="agileits-content"></div>
		<div class="w3layouts-right">
			<div class="w3ls-text">
				<img src="${ctx }/Content/image/709470.png" style="margin-left: 40%" />
				<div style="margin-left: 40%;">
					<label>您没有访问此模块的权限，请联系管理员！！</label>
				</div>



			</div>

		</div>
		<div class="clearfix"></div>
	</div>

</body>
</html>
