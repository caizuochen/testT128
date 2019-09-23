<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>班级列表</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	function deleteClassInfo(data){
		var id=$(data).parent().parent().children(":first").html();
		$.ajax({
			type : "get",//请求类型
			url : "classInfo/deleteClassInfo.action",//请求的url
			data : "id=" + id,//请求参数
			dataType : "text",//ajax接口（请求url）返回的数据类型
			success : function(data) {//data：返回数据（json对象）
				if (data >= 1) {
					alert("删除成功");
				} else {
					alert("删除失败,请确认该班级下是否存在");
				};
				window.location="classInfo/queryClassInfo.action";
			},
			error : function(data) {//当访问时候，404，500 等非200的错误状态码
				alert("系统繁忙!!!,错误编码:015");
			}
		});
	}
</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="../common/side.jsp"%>
			<div class="rightbox">
				<h2 class="mbx">
					班级列表
				</h2>
				<div class="feilei">
					班级列表 &gt;<a href="AddClassInfo.jsp"> 添加班级</a>
				</div>
				<div class="fllist">
					<div class="cztable">
					<form action="classInfo/queryClassInfo.action">
						<div align="center">
							<table>
								<tr>
									<td>查询条件:</td>
									<td>班级名:<input name="queryClassInfoName" value="${queryClassInfoName }" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text"></td>
									<td><input type="submit" value=" 查  询 "></td>
								</tr>
							</table>
						</div>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
							<tr>
								<th style="text-align: center;">班级编号</th>
								<th style="text-align: center;">班级名称</th>
								<th style="text-align: center;">操作</th>
							</tr>
							<c:forEach items="${queryclassInfo.list }" var="c">
								<tr>
									<td>${c.id}</td>
									<td>${c.className}</td>
									<td><input type="button" value=" 删 除  " onclick="deleteClassInfo(this)"><br>
									<input type="button" value=" 修 改  " onclick="window.location='classInfo/queryClassInfoById.action?id=${c.id}'"></td>
								</tr>
							</c:forEach>
						</table>
						<div align="center">
						<table>
							<tr><td colspan="4" align="center">&nbsp;&nbsp;一共有条<span style="color: red;">${queryclassInfo.total}</span>数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前第<span style="color: #f127ea;">${queryclassInfo.pageNum}</span>/<span style="color: #fcae17;">${queryclassInfo.pages}</span>页</td></tr>
							<tr>
								<c:if test="${queryclassInfo.pageNum > 1 }">
								<td><a href="classInfo/queryClassInfo.action?queryClassInfoName=${queryClassInfoName}">首页</a></td>
								<td><a href="classInfo/queryClassInfo.action?pageNumber=${queryclassInfo.pageNum-1}&queryClassInfoName=${queryClassInfoName}">上一页</a></td>
								</c:if>
								<c:if test="${queryclassInfo.pageNum != queryclassInfo.pages }">
								<td><a href="classInfo/queryClassInfo.action?pageNumber=${queryclassInfo.pageNum+1}&queryClassInfoName=${queryClassInfoName}">下一页</a></td>
								<td><a href="classInfo/queryClassInfo.action?pageNumber=${queryclassInfo.pages}&queryClassInfoName=${queryClassInfoName}">尾页</a></td>
								</c:if>
							</tr>
						</table>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
</body>
</html>
