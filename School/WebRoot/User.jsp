<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>角色列表</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	function deleteStudent(data){
		var id=$(data).parent().parent().children(":first").html();
		$.ajax({
			type : "get",//请求类型
			url : "userCURD/deleteUser.action",//请求的url
			data : "id=" + id,//请求参数
			dataType : "text",//ajax接口（请求url）返回的数据类型
			success : function(data) {//data：返回数据（json对象）
				if (data >= 1) {
					alert("删除成功");
				} else {
					alert("删除失败");
				};
				window.location="userCURD/queryUser.action";
			},
			error : function(data) {//当访问时候，404，500 等非200的错误状态码
				alert("系统繁忙!!!,错误编码:010");
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
					用户列表
				</h2>
				<div class="feilei">
					用户列表
				</div>
				<div class="fllist">
					<div class="cztable">
						<h3 align="center" id="result" style="color: red;">${userResult}</h3>
						<script>
							setTimeout("document.getElementById('result').style.display='none'",3000);
						</script>
						<form action="userCURD/queryUser.action">
						<div align="center">
							<table>
								<tr>
									<td>查询条件:</td>
									<td>用户名:<input name="queryUserName" value="${queryUserName }" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text"></td>
									<td>
										性别:
										<select name="queryUserGender">
												<option value="-1">全部</option>						
											<c:forEach items="${dataMap['SEX'] }" var="sex">
												<option value="${sex.valueId }" <c:if test="${sex.valueId == queryUserGender}">selected="selected"</c:if>>${sex.valueName }</option>						
											</c:forEach>
										</select>
									</td>
									<td>
									用户类型:
									<c:if test="${queryType!=null}">
          			     				<select name="queryUserType" class="typeId" >
	                								<option value="-1">全部</option>
            								<c:forEach var="type" items="${queryType }">
            									<c:if test="${type.id != 5}">
	                								<option value="${type.id}" <c:if test="${type.id == queryUserType}">selected="selected"</c:if>>${type.typeName}</option>
            									</c:if>
   										</c:forEach>
   										</select>
            						</c:if>
									</td>
									<td><input type="submit" value=" 查  询 "></td>
								</tr>
							</table>
						</div>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
							<tr>
								<th style="text-align: center;">用户编号</th>
								<th style="text-align: center;">用户名</th>
								<th style="text-align: center;">类型</th>
								<th style="text-align: center;">手机号码</th>
								<th style="text-align: center;">邮箱</th>
								<th style="text-align: center;">性别</th>
								<th style="text-align: center;">QQ</th>
								<th style="text-align: center;">地址</th>
								<th style="text-align: center;">操作</th>
							</tr>
							<c:forEach items="${userList.list }" var="u">
								<tr>
									<td>${u.id}</td>
									<td>${u.userName}</td>
									<td>${u.typeName}</td>
									<td>${u.phone}</td>
									<td>${u.email}</td>
									<td>
										<c:forEach items="${dataMap['SEX']}" var="sex">
											<c:if test="${sex.valueId == u.gender}">
												${sex.valueName }
											</c:if>
										</c:forEach></td>
									<td>${u.QQ}</td>
									<td>${u.address}</td>
									<td><input type="button" onclick="deleteStudent(this)" value=" 删 除 "><br>
									<input type="button" onclick="window.location='userCURD/queryUserById.action?id=${u.id}'" value=" 修 改 "></td>
								</tr>
							</c:forEach>
						</table>
						<div align="center">
						<table>
							<tr><td colspan="4" align="center">&nbsp;&nbsp;一共有条<span style="color: red;">${userList.total}</span>数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前第<span style="color: #f127ea;">${userList.pageNum}</span>/<span style="color: #fcae17;">${userList.pages}</span>页</td></tr>
							<tr>
								<c:if test="${userList.pageNum > 1 }">
								<td><a href="userCURD/queryUser.action?queryUserName=${queryUserName}&queryUserGender=${queryUserGender}&queryUserType=${queryUserType}">首页</a></td>
								<td><a href="userCURD/queryUser.action?pageNumber=${userList.pageNum-1}&queryUserName=${queryUserName}&queryUserGender=${queryUserGender}&queryUserType=${queryUserType}">上一页</a></td>
								</c:if>
								<c:if test="${userList.pageNum != userList.pages }">
								<td><a href="userCURD/queryUser.action?pageNumber=${userList.pageNum+1}&queryUserName=${queryUserName}&queryUserGender=${queryUserGender}&queryUserType=${queryUserType}">下一页</a></td>
								<td><a href="userCURD/queryUser.action?pageNumber=${userList.pages}&queryUserName=${queryUserName}&queryUserGender=${queryUserGender}&queryUserType=${queryUserType}">尾页</a></td>
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
