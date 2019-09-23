<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>侧边栏</title>
</head>
<body>
	<div class="leftbox">
		<div class="l_nav2">
			<div class="ta1">
				<strong>操作中心</strong>
				<div class="leftbgbt"></div>
			</div>
			<div class="cdlist">
				<div>
					<a href="${pageContext.request.contextPath }/Index.jsp">我的信息</a>
				</div>
				<div>
					<a href="student/queryStudent.action">学员列表</a>
				</div>
				<div>
					<a href="classInfo/queryClassInfo.action">班级列表</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath }/User/ChangePasswd.jsp">密码修改</a>
				</div>
				<div>
					<a href="typeCURD/queryType.action">角色列表</a>
				</div>
				<div>
					<a href="userCURD/queryUser.action">用户列表</a>
				</div>
				<div>
					<a href="dorm/queryDorm.action">寝室列表</a>
				</div>
				<div>
					<a href="dataDictionary/queryData.action">数据字典列表</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
