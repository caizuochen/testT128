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
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="${pageContext.request.contextPath }/login/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/login/js/agree.js"></script>
	<script src="${pageContext.request.contextPath }/login/js/login.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/login/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/login/css/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/login/css/reg.css">
  </head>
  <body>
<div class="wrap">
    <div class="wpn">
        <div class="form-data pos">
            <a href="${pageContext.request.contextPath }/login/login.jsp"><img src="${pageContext.request.contextPath }/login/img/logo.png" class="head-logo"></a>
            <div class="change-login">
                <p class="account_number on">账号登录</p>
            </div>
            <p align="center"><span style="color: red;font-size: 15px;">${error}</span></p>
            <form action="login/login.action">
            <div class="form1">
                <p class="p-input pos">
                    <label for="num">用户名称</label>
                    <input type="text" id="num" name="userName">
                </p>
                <p class="p-input pos">
                    <label for="pass">请输入密码</label>
                    <input type="password" name="userPwd" id="pass" autocomplete="new-password">
                </p>
            </div>
            <div class="r-forget cl">
            	<a href="login/regJSP.action">账号注册</a>
                <a href="${pageContext.request.contextPath }/login/getpass.jsp" class="y">忘记密码</a>
            </div>
            <button type="submit" class="lang-btn off" style="background-color: #2fea26;"><span style="color: #f95439;">登录</span></button>
           </form>
          <p class="right">Powered by © 2019</p>
        </div>
    </div>
</div>
</body>
</html>
