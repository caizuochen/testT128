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
			var className=$(".className").val();
			var oldClassName=$(".oldClassName").val(); 
			var isClassName=true;
			if (className=="") {
				alert("班级名不能为空");
				isClassName= false;
			}else {
				$.ajax({
					type:"get",//请求类型
					url:"classInfo/queryClassInfoByclassName.action",//请求的url
					async: false,
					data:"className="+className,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1 && className!=oldClassName){
							alert("该班级名已经存在,请更换班级名称!!!");
							isClassName = false;
						}else{
							isClassName=true;
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:017");
					}
				});
			}
			if (isClassName==true) {
				$.ajax({
					type:"get",//请求类型
					url:"classInfo/updateClassInfo.action",//请求的url
					data:"id="+id+"&className="+className,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1){
							if (confirm("修改成功")) {
								window.location = "classInfo/queryClassInfo.action";
							}
						}else{
							alert("修改失败!!!");
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:016");
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
					班级修改
				</h2>
				<div class="feilei">
					班级修改
				</div>
				<div class="fllist">
					<div class="cztable">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
								<input type="hidden" class="oldClassName" value="${queryClassInfo.className }">
								<tr>
									<td>班级id</td>
									<td><input type="text" class="id" disabled="disabled" value="${queryClassInfo.id }"></td>
								</tr>
								<tr>
									<td>班级名称</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" class="className" value="${queryClassInfo.className }"></td>
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
