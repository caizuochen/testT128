<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>密码修改</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.txtinput1 {
	width: 180px;
}
</style>
<script src="${pageContext.request.contextPath }/login/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
		//判断旧密码是否输入正确
		var isOldPwd=false;
		var isNewPwd=false;
		var isConfirmNewPwd=false;
		$("#txtOldPwd").blur(function (){
			var txtOldPwd=$("#txtOldPwd").val();
			if (txtOldPwd == "") {
				$(".txtOldPwd").html("密码不能为空!!!");
				isOldPwd=false;
			}else{
				$(".txtOldPwd").html("输入成功!!!");
				isOldPwd=true;
			};
		});
		$("#txtNewPwd").blur(function (){
			var txtNewPwd=$("#txtNewPwd").val();
			if (txtNewPwd == "") {
				$(".txtNewPwd").html("密码不能为空!!!");
				isNewPwd=false;
			}else if(txtNewPwd.length > 16 || txtNewPwd.length<6){
				$(".txtNewPwd").html("密码长度为6~16个字符!!!");
				isNewPwd=false;
			}else{
				$(".txtNewPwd").html("输入成功!!!");
				isNewPwd=true;
			};
		});
		$("#txtConfirmNewPwd").blur(function (){
			var txtConfirmNewPwd=$("#txtConfirmNewPwd").val();
			var txtNewPwd=$("#txtNewPwd").val();
			if (txtConfirmNewPwd == "") {
				$(".txtConfirmNewPwd").html("密码不能为空!!!");
				isConfirmNewPwd=false;
			}else if(txtConfirmNewPwd != txtNewPwd){
				$(".txtConfirmNewPwd").html("请保持两次密码一致!!!");
				isConfirmNewPwd=false;	
			}else{
				$(".txtConfirmNewPwd").html("输入成功!!!");
				isConfirmNewPwd=true;
			};
		});
		$("#btnSubmit").click(function (){
			var txtConfirmNewPwd=$("#txtConfirmNewPwd").val();
			var userId=$(".userId").val();
			var txtOldPwd=$("#txtOldPwd").val();
			if (isOldPwd==true && isNewPwd ==true && isConfirmNewPwd == true) {
				$.ajax({
					type:"get",//请求类型
					url:"userCURD/updateUserPwd.action",//请求的url
					data:"userPwd="+txtConfirmNewPwd+"&userId="+userId+"&oldPwd="+txtOldPwd,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1){
							alert("修改成功,请使用新密码进行登录!!!"); 
							window.location = "login/quitSession.action";
						}else{
							alert("密码修改失败,请输入正确的旧密码");
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:009");
					}
				});
			}else{
				alert("请按要求填写!!!");
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
				<h2 class="mbx">我的信息 &gt; 密码修改</h2>
				<div class="cztable">
					
					<input type="hidden" class="userId" value="${user.id }">
					<table border="0" cellspacing="0" cellpadding="0" width="500px"
						style="margin:30px auto 0px auto;">
						<tr align="center">
							<th style="width:20%; text-align:left;">旧密码：</th>
							<td style="width:70%; text-align:left;">
							<input id="txtOldPwd" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="password" class="input_2 txtinput1" /><span class="txtOldPwd"></span></td>
						</tr>
						<tr align="center">
							<th style="width:20%; text-align:left;">新密码：</th>
							<td style="width:70%; text-align:left;">
							<input id="txtNewPwd" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="password" class="input_2 txtinput1" /><span class="txtNewPwd">&nbsp;&nbsp;6~16个字符，区分大小写</span></td>
						</tr>
						<tr align="center">
							<th style="width:20%; text-align:left;">确认新密码：</th>
							<td style="width:70%; text-align:left;">
							<input id="txtConfirmNewPwd" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="password" 	class="input_2 txtinput1" /><span class="txtConfirmNewPwd"></span>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center;">
							<input type="submit" id="btnSubmit" value="确认修改" class="input2" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
</body>
</html>
