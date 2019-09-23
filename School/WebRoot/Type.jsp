<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>角色列表</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="../common/side.jsp"%>
			<div class="rightbox">
				<h2 class="mbx">
					角色列表
				</h2>
				<div class="feilei">
					角色列表<a href="${pageContext.request.contextPath }/AddType.jsp"><strong> &gt; 添加角色</strong></a>
				</div>
				<div class="fllist">
					<div class="cztable">
						<h3 align="center" id="result" style="color: red;">${result}</h3>
						<script>
							setTimeout("document.getElementById('result').style.display='none'",3000);
						</script>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
							<tr>
								<th style="width: 15%; text-align: center;">角色编号</th>
								<th style="padding-left: 20px;">角色名称</th>
								<th style="width: 15%; text-align: center;">操作</th>
							</tr>
							<c:forEach items="${queryType }" var="type">
								<tr>
									<td>${type.id}</td>
									<td>${type.typeName}</td>
									<td><a href="typeCURD/deleteType.action?id=${type.id }">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="typeCURD/queryTypeById.action?id=${type.id}">修改</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
</body>
</html>
