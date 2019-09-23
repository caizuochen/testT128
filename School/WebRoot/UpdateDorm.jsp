<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>修改寝室</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
			$(document).ready(function (){
			$(".xiugai").click(function (){
			var dormName=$(".dormName").val();
			//可住人数
			var canlivepeople=$(".canlivepeople").val();
			//已住人数
			var livepeople=$(".livepeople").val();
			//判断是否可住人数是否大于可住人数
			var isCanGtLiv=true;
			var oldDormName=$(".oldDormName").val();
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
						if(data >= 1 &&	dormName!=oldDormName){
							alert("该寝室名已经存在,请更换寝室名称!!!");
							isdormName = false;
						}else{
							isdormName=true;
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:023");
					}
				});
			}
			if (canlivepeople=="" || canlivepeople < 0) {
				alert("可住人数必须要大于0");
				isCanlivepeople=false;
			} else {
				isCanlivepeople=true;
			}
			if (parseInt(canlivepeople) >= parseInt(livepeople) && parseInt(livepeople) >= 0) {
				isCanGtLiv=true;
			} else {
				alert("可住人数必须大于已住人数,且已住人数应该为正数");
				isCanGtLiv=false;
			}
			if (isdormName==true && isCanlivepeople==true && isCanGtLiv==true) {
				var id=$(".id").val();	
				$.ajax({
					type:"get",//请求类型
					url:"dorm/updateDorm.action",//请求的url
					data:"id="+id+"&dormName="+dormName+"&canlivepeople="+canlivepeople+"&livepeople="+livepeople,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1){
							if (confirm("修改成功")) {
								window.location = "dorm/queryDorm.action";
							}
						}else{
							alert("修改失败!!!");
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:024");
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
					寝室修改
				</h2>
				<div class="feilei">
					寝室修改
				</div>
				<div class="fllist">
					<div class="cztable">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
								<input type="hidden" class="id" value="${queryDorm.id }">
								<input type="hidden" class="oldDormName" value="${queryDorm.dormName }">
								<tr>
									<td>寝室名称:</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" class="dormName" value="${queryDorm.dormName }"></td>
								</tr>
								<tr>
									<td>已住人数:</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="number" class="livepeople" value="${queryDorm.livepeople }" disabled="disabled"></td>
								</tr>
								<tr>
									<td>可住人数:</td>
									<td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="number" class="canlivepeople" value="${queryDorm.canlivepeople }"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="button" value="确 认 修  改  " class="xiugai"></td>
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
