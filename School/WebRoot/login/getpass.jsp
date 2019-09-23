<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>找回密码</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/login/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/login/css/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/login/css/reg.css">
   	<script src="${pageContext.request.contextPath }/login/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/login/js/agree.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function (){
			var isUserName = false;
			var isCardId = false;
			var isPwd1=false;
			var isPwd2=false;
			$("#pc_tel").blur(function (){
				var name=$("#pc_tel").val();
				$.ajax({
					type:"get",//请求类型
					url:"login/isUserName.action",//请求的url
					data:"userName="+name,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data != 1){
							$(".name").html("该用户名不存在");
							$(".lang-btn").attr("disabled", "disabled");
							$(".lang-btn").attr("style","background: red");
							return false;
						}else{
							$(".name").html("用户名存在");
							isUserName=true;
							if (isPwd2==true&&isPwd1==true&&isUserName==true && isCardId==true) {
								$(".lang-btn").removeAttr("disabled");
								$(".lang-btn").attr("style","background: blue");
							}
							return true;
						}
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:001");
					}
				});
			});
			$("#veri").blur(function (){
			var cardid=$("#veri").val();
			if(!(/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/.test(cardid))){
				$(".cardid").html("身份证输入有误!!!");
				return false; 
			}else{
				$(".cardid").html("身份证输入正确!!!");
				isCardId=true;
				if (isPwd2==true&&isPwd1==true&&isUserName==true && isCardId==true) {
								$(".lang-btn").removeAttr("disabled");
								$(".lang-btn").attr("style","background: blue");
							}
				return true; 
			}
			});
			$("#UserPwd").blur(function (){
				var UserPwd=$("#UserPwd").val();
				if (UserPwd == "") {
					$(".pwd").html("新密码不能为空!!!");
							return false;
				}else{
					$(".pwd").html("输入成功!!!");
					isPwd1=true;
					if (isPwd2==true&&isPwd1==true&&isUserName==true && isCardId==true) {
								$(".lang-btn").removeAttr("disabled");
								$(".lang-btn").attr("style","background: blue");
							}
					return true;
				}
			});
			$("#UserPwd2").blur(function (){
			var UserPwd=$("#UserPwd").val();
			var UserPwd2=$("#UserPwd2").val();
				if (UserPwd != UserPwd2) {
					$(".pwd2").html("两次密码不一致!!!");
					return false;
				}else if(UserPwd2==""){
					$(".pwd2").html("第二次密码不能为空!!!");
				}else{
					$(".pwd2").html("输入成功!!!");
					isPwd2=true;
					if (isPwd2==true&&isPwd1==true&&isUserName==true && isCardId==true) {
								$(".lang-btn").removeAttr("disabled");
								$(".lang-btn").attr("style","background: blue");
							}
					return true;
				}
			});
			$(".lang-btn").click(function (){
			var name=$("#pc_tel").val();
			var cardid=$("#veri").val();
			var UserPwd=$("#UserPwd").val();
			var UserPwd2=$("#UserPwd2").val();
					$.ajax({
					type:"post",//请求类型
					url:"login/getPass.action",//请求的url
					data:"userName="+name+"&cardId="+cardid+"&userPwd="+UserPwd2,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data >= 1){
							if (confirm("找回成功,请使用新密码登录!!!")) {
								window.location = "login/login.jsp";
							}
						}else{
							alert("修改失败,请确认用户名与密码一致!!!");
						}
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:002");
					}
				});
				
			});
  		});
  	</script>
  </head>
  <body>
   <div id="ajax-hook"></div>
	<div class="wrap">
    <div class="wpn">
        <div class="form-data find_password">
            <h4>找回密码</h4>
            <p class="right_now">已有账号，<a href="${pageContext.request.contextPath }/login/login.jsp">马上登录</a></p>
            <p class="p-input pos">
                <label for="pc_tel">用户名</label>
                <input name="userName" type="text" id="pc_tel" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
                <span class="name"></span>
            </p>
            <p class="p-input pos">
                <label for="veri">请输入身份证号</label>
                <input name="cardId" type="text" id="veri" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
                <span class="cardid"></span>
            </p>
            <p class="p-input pos">
                <label for="UserPwd">请输入新密码</label>
                <input type="password" id="UserPwd" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
                <span class="pwd"></span>
            </p>
            <p class="p-input pos">
                <label for="UserPwd2">请确认新密码</label>
                <input name="userPwd" type="password" id="UserPwd2" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
           		<span class="pwd2"></span>
           	</p>
            <button class="lang-btn" style="background: red" disabled="disabled">确认找回</button>
            <p class="right">Powered by © 2019</p>
        </div>
    </div>
</div>
  </body>
</html>
