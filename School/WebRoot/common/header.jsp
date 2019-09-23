<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>头部</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath }/Style/StudentStyle.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/Script/jBox/Skins/Blue/jbox.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/Style/ks.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath }/Script/jBox/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/Script/jBox/jquery.jBox-2.3.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/Script/jBox/i18n/jquery.jBox-zh-CN.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/Script/Common.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/Script/Data.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function loginOut() {
		if (confirm("确定退出吗？")) {
			window.location = "login/quitSession.action";
		}
	}
</script>
<script src="${pageContext.request.contextPath }/Script/changeOption.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/Script/rl.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="banner">
		<div class="bgh">
			<div class="page">
				<div id="logo">
					<a href="Index.aspx.html"> <img
						src="${pageContext.request.contextPath }/Images/Student/logo.gif"
						alt="" width="165" height="48" /> </a>
				</div>
				<div class="topxx">
				<c:choose>
					<c:when test="${user.userName != null}">
						欢迎您: ${user.userName},你的身份为 :<span style="color: red;">${user.typeName}</span><a href="${pageContext.request.contextPath }/Index.jsp">我的信息</a> <a
						href="${pageContext.request.contextPath }/User/ChangePasswd.jsp">密码修改</a> <a
						onclick="loginOut()" href="javascript:">安全退出</a>
					</c:when>
					<c:otherwise>
						<%response.sendRedirect(basePath+"/login/login.jsp"); %>
					</c:otherwise>
				</c:choose>
				</div>
				<div class="blog_nav">
					<ul>
						<li><a href="${pageContext.request.contextPath }/Index.jsp">我的信息</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
