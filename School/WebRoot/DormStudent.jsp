<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>寝室学生列表</title>
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
					寝室学生列表
				</h2>
				<div class="feilei">
					寝室学生列表
				</div>
				<div class="fllist">
					<div class="cztable">
						<h3 align="center" id="result" style="color: red;">${error}</h3>
						<script>
							setTimeout("document.getElementById('result').style.display='none'",1000);
						</script>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
							<tr>
								<th style="text-align: center;">学员姓名</th>
								<th style="text-align: center;">操作</th>
							</tr>
							<c:forEach items="${dormStudent }" var="ds">
								<tr>
									<td>${ds.studentName}</td>
									<td>
									<input type="button" value="踢出寝室" onclick="window.location='dorm/UpdateStudentDormDown.action?dormId=${ds.dormId}&studentId=${ds.id }'"><br>
								</tr>
							</c:forEach>
							<tr><td colspan="2"><input type="button" value=" 返  回  " onclick="window.location='dorm/queryDorm.action'"></td></tr>
						</table>
						<div align="center">
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
</body>
</html>
