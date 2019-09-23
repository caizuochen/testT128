<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>寝室列表</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	function deleteDorm(data){
		var id=$(data).parent().parent().children(":first").html();
		$.ajax({
			type : "get",//请求类型
			url : "dorm/deleteDorm.action",//请求的url
			data : "id=" + id,//请求参数
			dataType : "text",//ajax接口（请求url）返回的数据类型
			success : function(data) {//data：返回数据（json对象）
				if (data >= 1) {
					alert("删除成功");
				} else {
					alert("删除失败,请确保该寝室下没学员!!!");
				};
				window.location="dorm/queryDorm.action";
			},
			error : function(data) {//当访问时候，404，500 等非200的错误状态码
				alert("系统繁忙!!!,错误编码:020");
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
					寝室列表
				</h2>
				<div class="feilei">
					寝室列表 &gt;<a href="AddDorm.jsp"> 添加寝室</a>  &gt;<a href="dorm/addStudentDorm.action">学生入寝</a>
				</div>
				<div class="fllist">
					<div class="cztable">
					<form action="dorm/queryDorm.action">
						<div align="center">
							<table>
								<tr>
									<td>查询条件:</td>
									<td>寝室名:<input name="queryDormName" value="${queryDormName }" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text"></td>
									<td><input type="submit" value=" 查  询 "></td>
								</tr>
							</table>
						</div>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
							<tr>
								<th style="text-align: center;">寝室编号</th>
								<th style="text-align: center;">寝室名称</th>
								<th style="text-align: center;">已住人数</th>
								<th style="text-align: center;">可住人数</th>
								<th style="text-align: center;">操作</th>
							</tr>
							<c:forEach items="${queryDorm.list }" var="d">
								<tr>
									<td>${d.id}</td>
									<td>${d.dormName}</td>
									<td>${d.livepeople}</td>
									<td>${d.canlivepeople}</td>
									<td>
									<input type="button" value="查看寝室" onclick="window.location='dorm/queryStudentByDormId.action?id=${d.id}'"><br>
									<input type="button" value=" 删 除  " onclick="deleteDorm(this)">
									<input type="button" value=" 修 改  " onclick="window.location='dorm/queryDormById.action?id=${d.id}'"></td>
								</tr>
							</c:forEach>
						</table>
						<div align="center">
						<table>
							<tr><td colspan="4" align="center">&nbsp;&nbsp;一共有条<span style="color: red;">${queryDorm.total}</span>数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前第<span style="color: #f127ea;">${queryDorm.pageNum}</span>/<span style="color: #fcae17;">${queryDorm.pages}</span>页</td></tr>
							<tr>
								<c:if test="${queryDorm.pageNum > 1 }">
								<td><a href="dorm/queryDorm.action?queryDormName=${queryDormName}">首页</a></td>
								<td><a href="dorm/queryDorm.action?pageNumber=${queryDorm.pageNum-1}&queryDormName=${queryDormName}">上一页</a></td>
								</c:if>
								<c:if test="${queryDorm.pageNum != queryDorm.pages }">
								<td><a href="dorm/queryDorm.action?pageNumber=${queryDorm.pageNum+1}&queryDormName=${queryDormName}">下一页</a></td>
								<td><a href="dorm/queryDorm.action?pageNumber=${queryDorm.pages}&queryDormName=${queryDormName}">尾页</a></td>
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
