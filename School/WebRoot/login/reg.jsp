 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户注册</title>
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
  			//判断用户名是否存在
  			var isUserName=false;
  			//判断身份证号码是否正确
  			var isCardId=false;
  			//判断第一次输入密码是否正确
  			var isPwd=false;
  			//判断第二次输入密码是否正确
  			var isPwd2=false;
  			//判断邮箱是否正确
  			var isEmail=false;
  			//判断验证码发送是否正确
  			var isSendEmail=false;
  			//判断验证码是否正确
  			var isEmailCode=false;
			$("#pc_tel").blur(function (){
				var name=$("#pc_tel").val();
				$.ajax({
					type:"get",//请求类型
					url:"login/isUserName.action",//请求的url
					data:"userName="+name,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data != 1){
							$(".name").html("用户名可用(*^▽^*)");
							isUserName=true;
						}else if(name==""){
							$(".name").html("用户名不能为空哦(^_−)☆");
							isUserName=false;
						}else{
							$(".name").html("用户名已存在,请换个用户名吧(^_−)☆");
							isUserName=false;
						};
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码:003");
					}
				});
			});
			$("#veri").blur(function (){
			var cardid=$("#veri").val();
			if(!(/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/.test(cardid))){
				$(".cardid").html("身份证输入有误ヽ(ー_ー)ノ");
				isCardId=false;
			}else{
				$(".cardid").html("身份证输入正确ヽ(￣▽￣)ﾉ");
				isCardId=true;
			};
			});
			$("#UserPwd").blur(function (){
				var UserPwd=$("#UserPwd").val();
				if (UserPwd == "") {
					$(".pwd").html("新密码不能为空!!!");
					isPwd=false;
				}else{
					$(".pwd").html("输入成功!!!");
					isPwd=true;
				};
			});
			$("#UserPwd2").blur(function (){
				var UserPwd=$("#UserPwd").val();
				var UserPwd2=$("#UserPwd2").val();
				if (UserPwd != UserPwd2) {
					$(".pwd2").html("两次密码不一致ヽ(#`Д´)ﾉ");
					isPwd2=false;
				}else if(UserPwd2==""){
					$(".pwd2").html("第二次密码不能为空(⌒.−)＝★");
					isPwd2=false;
				}else{
					$(".pwd2").html("输入成功(´▽`)ﾉ ");
					isPwd2=true;
				};
			});
			$("#email").blur(function (){
				var email=$("#email").val();
				var reg1 = /^\w{5,12}@[a-z0-9A-Z]{2}\.[a-z]+$|\,$/;
				if (reg1.test(email)) {
					if(email.toLowerCase().indexOf("qq")!=-1){//如果值中含有qq则为qq邮箱
						$(".email").html("邮箱合法(´▽`)ﾉ ");
						isEmail=true;
						$(".p-input").removeClass("hide");
					}else{
						$(".email").html("目前只支持QQ邮箱,请输入QQ邮箱哦ヾ(ｏ･ω･)ﾉ");
						isEmail=false;
					}
				}else{
					$(".email").html("邮箱输入有误(〃＞皿＜)");
					jubge=false;
				}
			});
			$(".send").click(function (){
				var email=$("#email").val();
				$.ajax({
					type:"get",//请求类型
					url:"login/qqEmail.action",//请求的url
					data:"email="+email,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data == 1){
							$(".emailCode").html("验证码发送成功!!!");
							isSendEmail=true;
						}else{
							$(".emailCode").html("验证码发送失败!!!");
							isSendEmail=false;
						}
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码004");
					}
				});
			});
			$("#veri-code").blur(function (){
				var emailCode=$("#veri-code").val();
				$.ajax({
					type:"get",//请求类型
					url:"login/emailVerify.action",//请求的url
					data:"emailCode="+emailCode,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data == 1){
							$(".emailCode").html("验证码输入正确(≖ᴗ≖)✧");
							isEmailCode=true;
						}else{
							$(".emailCode").html("验证码输入失败d(´ω｀*)");
							isEmailCode=false;
						}
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码005");
					}
				});
			});
			$(".lang-btn").click(function (){
				if (isUserName==true && isCardId==true 
				&& isPwd==true && isPwd2==true 
				&& isEmail==true && isSendEmail==true && isEmailCode==true) {
					var name=$("#pc_tel").val();
					var cardid=$("#veri").val();
					var UserPwd=$("#UserPwd").val();
					var userType=$(".typeName").val();
					if (userType==5) {
						alert("无法注册为学员类型!!!");
						return false;
					}
					var email=$("#email").val();
					$.ajax({
					type:"get",//请求类型
					url:"login/addUser.action",//请求的url
					data:"userName="+name+"&cardId="+cardid+"&userPwd="+UserPwd+"&typeId="+userType+"&email="+email,//请求参数
					dataType:"text",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data == 1){
							alert("注册成功,即将为您跳转致登录界面!!!"); 
							window.location = "login/login.jsp";
						}else{
							alert("注册失败");
						}
					},
					error:function(data){//当访问时候，404，500 等非200的错误状态码
						alert("系统繁忙!!!,错误编码006");
					}
				});
				}else{
					alert("请将信息填写正确");
				}
			});
  		});
  	</script>
  </head>
  <body>
   <div id="ajax-hook"></div>
	<div class="wrap">
    <div class="wpn">
        <div class="form-data find_password" >
            <h4>用户注册</h4>
            <p class="right_now">已有账号，<a href="${pageContext.request.contextPath }/login/login.jsp">马上登录</a></p>
            <p class="p-input pos">
                <label for="pc_tel">用户名</label>
                <input type="text" id="pc_tel" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
                <span class="name"></span>
            </p>
            <p class="p-input pos">
            	<c:if test="${type!=null}">
            		请选择用户类型:
               		<select name="typeName" class="typeName">
            		<c:forEach var="type" items="${type }">
                		<option value="${type.id}">${type.typeName}</option>
   					</c:forEach>
   					</select>
            	</c:if>
            </p>
            <p class="p-input pos">
                <label for="veri">请输入身份证号</label>
                <input type="text" id="veri" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
                <span class="cardid"></span>
            </p>
            <p class="p-input pos">
                <label for="UserPwd">请输入密码</label>
                <input type="password" id="UserPwd" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
                <span class="pwd"></span>
            </p>
            <p class="p-input pos">
                <label for="UserPwd2">请确认密码</label>
                <input type="password" id="UserPwd2" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
           		<span class="pwd2"></span>
           	</p>
           	<p class="p-input pos">
                <label for="email">邮箱</label>
                <input type="email" id="email" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;">
                <span class="email"></span>
            </p>
            <p class="p-input pos hide">
                    <label for="veri-code">输入验证码</label>
                    <input type="text" id="veri-code">
                    <span class="send">发送验证码</span>
                    <span class="emailCode"></span>
            </p>
            <button class="lang-btn">注册</button>
            <p class="right">Powered by © 2019</p>
        </div>
    </div>
</div>
 </body>
</html>
