<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>学员列表</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	function deleteStudent(data){
		var id=$(data).parent().parent().children(":first").html();
		$.ajax({
			type : "get",//请求类型
			url : "student/deleteStudent.action",//请求的url
			data : "id=" + id,//请求参数
			dataType : "text",//ajax接口（请求url）返回的数据类型
			success : function(data) {//data：返回数据（json对象）
				if (data >= 1) {
					alert("删除成功");
				} else {
					alert("删除失败");
				};
				window.location="student/queryStudent.action";
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
					学员列表
				</h2>
				<div class="feilei">
					学员列表 &gt;<a href="AddStudent.jsp">添加学员信息</a>
				</div>
				<div class="fllist">
					<div class="cztable">
						<h3 align="center" id="result" style="color: red;">${result}</h3>
						<script>
							setTimeout("document.getElementById('result').style.display='none'",3000);
						</script>
						<form action="student/queryStudent.action">
						<div align="center">
							<table>
								<tr>
									<td>查询条件:</td>
									<td>用户名:<input name="queryStudentName" value="${queryStudentName }" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text"></td>
									<td>
										性别:
										<select name="queryStudentGender">
												<option value="-1">全部</option>						
											<c:forEach items="${dataMap['SEX'] }" var="sex">
												<option value="${sex.valueId }" <c:if test="${sex.valueId == queryStudentGender}">selected="selected"</c:if>>${sex.valueName }</option>						
											</c:forEach>
										</select>
									</td>
									<td>
									年级:
									<c:if test="${classInfo!=null}">
          			     				<select name="queryStudentClassId">
	                								<option value="-1">全部</option>
            								<c:forEach var="c" items="${classInfo }">
	                								<option value="${c.id}" <c:if test="${c.id == queryStudentClassId}">selected="selected"</c:if>>${c.className}</option>
   										</c:forEach>
   										</select>
            						</c:if>
									</td>
									<td><input type="submit" value=" 查  询 "></td>
									<td><input type="button" value="一键导出" onclick="window.location='student/excelExport.action'"></td>
								</tr>
							</table>
						</div>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
							<tr>
								<th style="text-align: center;">学员编号</th>
								<th style="text-align: center;">学员名</th>
								<th style="text-align: center;">手机号码</th>
								<th style="text-align: center;">邮箱</th>
								<th style="text-align: center;">班级</th>
								<th style="text-align: center;">性别</th>
								<th style="text-align: center;">地址</th>
								<th style="text-align: center;">操作</th>
							</tr>
							<c:forEach items="${student.list }" var="s">
								<tr>
									<td>${s.id}</td>
									<td>${s.studentName}</td>
									<td>${s.phone}</td>
									<td>${s.email}</td>
									<td>${s.className}</td>
									<td>
										<c:forEach items="${dataMap['SEX']}" var="sex">
											<c:if test="${sex.valueId == s.gender}">
												${sex.valueName }
											</c:if>
										</c:forEach>
									</td>
									<td>${s.address}</td>
									<td><input type="button" value=" 删 除 " onclick="deleteStudent(this)"><br>
									<input type="button" value=" 修 改 " onclick="window.location='student/queryStudentById.action?id=${s.id}'"></td>
								</tr>
							</c:forEach>
						</table>
						<div align="center">
						<table>
							<tr><td colspan="4" align="center">&nbsp;&nbsp;一共有条<span style="color: red;">${student.total}</span>数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前第<span style="color: #f127ea;">${student.pageNum}</span>/<span style="color: #fcae17;">${student.pages}</span>页</td></tr>
							<tr>
								<c:if test="${student.pageNum > 1 }">
								<td><a href="student/queryStudent.action?queryStudentName=${queryStudentName}&queryStudentGender=${queryStudentGender}&queryStudentClassId=${queryStudentClassId}">首页</a></td>
								<td><a href="student/queryStudent.action?pageNumber=${student.pageNum-1}&queryStudentName=${queryStudentName}&queryStudentGender=${queryStudentGender}&queryStudentClassId=${queryStudentClassId}">上一页</a></td>
								</c:if>
								<c:if test="${student.pageNum != student.pages }">
								<td><a href="student/queryStudent.action?pageNumber=${student.pageNum+1}&queryStudentName=${queryStudentName}&queryStudentGender=${queryStudentGender}&queryStudentClassId=${queryStudentClassId}">下一页</a></td>
								<td><a href="student/queryStudent.action?pageNumber=${student.pages}&queryStudentName=${queryStudentName}&queryStudentGender=${queryStudentGender}&queryStudentClassId=${queryStudentClassId}">尾页</a></td>
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
