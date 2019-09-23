<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>学生入寝</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
		$(".checkIn").click(function (){
		var dormId=$(".dorm").val();
		var studentId=$(".student").val();
		if (parseInt(dormId) == -1) {
			alert("请选择寝室!!!");
			return false;
		}
		if (parseInt(studentId) ==-1) {
			alert("请选择学生!!!");
			return false;
		}
		$.ajax({
			type : "get",//请求类型
			url : "dorm/UpdateStudentDormUp.action",//请求的url
			data : "dormId=" + dormId+"&studentId="+studentId,//请求参数
			dataType : "text",//ajax接口（请求url）返回的数据类型
			success : function(data) {//data：返回数据（json对象）
				if (data >= 1) {
					alert("添加成功");
				} else {
					alert("添加失败!!!");
				};
				window.location="dorm/queryDorm.action";
			},
			error : function(data) {//当访问时候，404，500 等非200的错误状态码
				alert("系统繁忙!!!,错误编码:025");
			}
		});
		});
	});
</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="../common/side.jsp"%>
			<div class="rightbox">
				<h2 class="mbx">
					学生入寝
				</h2>
				<div class="feilei">
					学生入寝
				</div>
				<div class="fllist">
					<div class="cztable">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
								<tr>
									<td>寝室名称:</td>
									<td>
										<select class="dorm">
											<option value="-1">-----请选择-----</option>
											<c:forEach items="${addDormInStudent }" var="d">
												<option value="${d.id }">${d.dormName }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>入住学员姓名:</td>
									<td>
										<select class="student">
											<option value="-1">-----请选择-----</option>
											<<c:forEach items="${addStudentInDorm }" var="s">
												<option value="${s.id }">${s.studentName }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="2"><input type="button" value=" 入  住  寝  室  " class="checkIn"></td>
								</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
</body>
</html>
