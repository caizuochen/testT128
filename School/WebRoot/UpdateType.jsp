<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>角色修改</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
			$(".xiugai").click(function (){
			var id=$(".id").val();
			var typeName=$(".typeName").val();
			if (typeName=="") {
				alert("角色名不能为空");
				return false;
			}
			$.ajax({
					type:"get",//请求类型
					url:"typeCURD/updateType.action",//请求的url
					data:"id="+id+"&typeName="+typeName,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1){
							if (confirm("修改成功")) {
								window.location = "typeCURD/queryType.action";
							}
						}else{
							alert("修改失败!!!");
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:007");
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
					角色修改
				</h2>
				<div class="feilei">
					角色修改
				</div>
				<div class="fllist">
					<div class="cztable">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
								<tr>
									<td>角色id</td>
									<td><input type="text" class="id" disabled="disabled" value="${queryTypeById.id }"></td>
								</tr>
								<tr>
									<td>角色名称</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" class="typeName" value="${queryTypeById.typeName }"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="button" value="确 认 修 改" class="xiugai"></td>
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
