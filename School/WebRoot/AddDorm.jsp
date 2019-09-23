<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>添加寝室</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
			$(document).ready(function (){
			$(".tianjia").click(function (){
			var dormName=$(".dormName").val();
			var canlivepeople=$(".canlivepeople").val();
			var isCanlivepeople=false;
			var isdormName=true;
			if (dormName=="") {
				alert("寝室名不能为空");
				isdormName= false;
			}else {
				$.ajax({
					type:"get",//请求类型
					url:"dorm/queryDormByName.action",//请求的url
					async: false,
					data:"dormName="+dormName,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1){
							alert("该寝室名已经存在,请更换寝室名称!!!");
							isdormName = false;
						}else{
							isdormName=true;
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:021");
					}
				});
			}
			if (canlivepeople=="" || canlivepeople < 0) {
				alert("可住人数必须要大于0");
				isCanlivepeople=false;
			} else {
				isCanlivepeople=true;
			}
			if (isdormName==true && isCanlivepeople==true) {
				$.ajax({
					type:"get",//请求类型
					url:"dorm/addDorm.action",//请求的url
					data:"dormName="+dormName+"&canlivepeople="+canlivepeople,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1){
							if (confirm("添加成功")) {
								window.location = "dorm/queryDorm.action";
							}
						}else{
							alert("添加失败!!!");
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:022");
					}
				});
			}
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
					寝室添加
				</h2>
				<div class="feilei">
					寝室添加
				</div>
				<div class="fllist">
					<div class="cztable">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
								<tr>
									<td>寝室名称:</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" class="dormName"></td>
								</tr>
								<tr>
									<td>可住人数:</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="number" class="canlivepeople"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="button" value="确 认 添  加  " class="tianjia"></td>
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
