<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>角色修改</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
			$(".tianjia").click(function (){
			var typeName=$(".typeName").val();
			if (typeName=="") {
				alert("角色名不能为空");
				return false;
			}
			$.ajax({
					type:"get",//请求类型
					url:"typeCURD/addType.action",//请求的url
					data:"typeName="+typeName,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1){
							if (confirm("添加成功")) {
								window.location = "typeCURD/queryType.action";
							}
						}else{
							alert("添加失败!!!");
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:008");
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
					角色添加
				</h2>
				<div class="feilei">
					角色添加
				</div>
				<div class="fllist">
					<div class="cztable">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
								<tr>
									<td>角色名称</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" class="typeName"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="button" value=" 添 加  " class="tianjia"></td>
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
