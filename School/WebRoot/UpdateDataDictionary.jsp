<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>数据字典修改</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
		$(document).ready(function (){
			$(".xiugai").click(function (){
			//状态
			var state=$(".state").val();
			//id
			var id=$(".id").val();
			//类型编码
			var typeCode=$(".typeCode").val();
			//类型名称
			var typeName=$(".typeName").val();
			//类型值id
			var valueId=$(".valueId").val();
			//类型值名称
			var valueName=$(".valueName").val();
			if (typeCode=="") {
				alert("类型编码不能为空");
				return false;
			}
			if (typeName=="") {
				alert("类型名称不能为空");
				return false;
			}
			if (valueId=="") {
				alert("类型值ID不能为空");
				return false;
			}
			if (valueName=="") {
				alert("类型值名称不能为空");
				return false;
			}
			$.ajax({
					type:"get",//请求类型
					url:"dataDictionary/updateData.action",//请求的url
					data:"id="+id+"&typeCode="+typeCode+"&typeName="+typeName+"&valueId="+valueId+"&valueName="+valueName+"&state="+state,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1){
							if (confirm("修改成功")) {
								window.location = "dataDictionary/queryData.action";
							}
						}else{
							alert("修改失败!!!");
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:027");
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
					数据字典修改
				</h2>
				<div class="feilei">
					数据字典修改
				</div>
				<div class="fllist">
					<div class="cztable">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
								<tr>
									<td>数据字典id</td>
									<td><input type="text" class="id" disabled="disabled" value="${updateData.id }"></td>
								</tr>
								<tr>
									<td>类型编码</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" class="typeCode" value="${updateData.typeCode }"></td>
								</tr>
								<tr>
									<td>类型名称</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" class="typeName" value="${updateData.typeName }"></td>
								</tr>
								<tr>
									<td>类型值ID</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="number" class="valueId" value="${updateData.valueId }"></td>
								</tr>
								<tr>
									<td>类型值名称</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" class="valueName" value="${updateData.valueName }"></td>
								</tr>
								<tr>
									<td>状态</td>
									<td>
										<select class="state">
											<option value="0" <c:if test="${updateData.state== 0}">selected="selected"</c:if>>禁用</option>
											<option value="1" <c:if test="${updateData.state== 1}">selected="selected"</c:if>>启用</option>
										</select>
									</td>
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
