<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>用户修改</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	function update() {
	//判断输入的用户名是否合法
		var userName = $(".userName").val();
		var isUserName=false;
		if (userName == "") {
			$("#error").html("用户名不能为空!!!");
			isUserName = false;
		} else if (userName.length > 5) {
			$("#error").html("用户名的最大长度5!!!");
			isUserName= false;
		}else {
			isUserName=true;
		}
	//判断输入的电话号码是否合法
		var phone=$(".phone").val();
		var isPhone=false;
		if (!(/^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/.test(phone))) {
			$("#error").html("电话号码不符合规则!!!");
			isPhone= false;
		}else {
			isPhone=true;
		}
	//判断身份证是否合法
		var cardid=$(".cardId").val();
		var isCardId=false;
		if(!(/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/.test(cardid))){
			$("#error").html("身份证输入有误ヽ(ー_ー)ノ");
			isCardId= false;
		}else{
			isCardId=true;
		}
	//判断邮箱是否合法
		var email = $(".email").val();
		var isEmail=false;
		if ((/^\w{5,12}@[a-z0-9A-Z]{2,3}\.[a-z]+$|\,$/.test(email))) {
			if (!(email.toLowerCase().indexOf("qq") != -1)) {//如果值中含有qq则为qq邮箱
				alert(111);
				$("#error").html("目前只支持QQ邮箱,请输入QQ邮箱哦ヾ(ｏ･ω･)ﾉ");
				isEmail= false;
			}else {
				isEmail=true;
			}
		} else {
			$("#error").html("邮箱输入不合法(〃＞皿＜)");
			isEmail= false;
		}
			if (isUserName == true && isPhone==true && isCardId==true && isEmail==true) {
			var gender=$(".gender").val();
			var typeId=$(".typeId").val();
			var address=$(".address").val();
			var id=$(".id").val();
			$.ajax({
			type : "post",//请求类型
			url : "userCURD/updateUser.action",//请求的url
			data : "userName=" + userName+
					"&gender="+gender+"&typeId="+typeId+
					"&address="+address+"&phone="+phone+"&email="+email
					+"&id="+id+"&cardId="+cardid,//请求参数
			dataType : "text",//ajax接口（请求url）返回的数据类型
			success : function(data) {//data：返回数据（json对象）
				if (data >= 1) {
					alert("修改成功!!!");
					window.location="userCURD/queryUser.action";
				}else {
					alert("修改失败啦");
				};
			},
			error:function() {//当访问时候，404，500 等非200的错误状态码
				alert("系统繁忙!!!,错误编码:013");
			}
		});
		}else{
			alert("请输入合法信息");
		}
	};
</script>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="common/side.jsp"%>
			<div class="rightbox">
				<h2 class="mbx">用户修改</h2>
				<div class="cztable" align="center">
					<input type="hidden" name="id" class="id" value="${userUpdate.id }">
					<table>
						<tr><td colspan="2" align="center">用户修改</td></tr>
						<tr><td colspan="2" align="center" style="color: red;" id="error"></td></tr>
						<tr align="center"><td>用户名:</td><td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" name="userName" class="userName"  value="${userUpdate.userName }"></td></tr>
						<tr align="center"><td>用户类型:</td>
						<td>
							<c:if test="${updateUserType!=null}">
          			     		<select name="typeId" class="typeId" >
            					<c:forEach var="type" items="${updateUserType }">
            						<c:if test="${type.id != 5}">
	                					<option value="${type.id}" <c:if test="${type.id == userUpdate.typeId}">selected="selected"</c:if>>${type.typeName}</option>
            						</c:if>
   								</c:forEach>
   								</select>
            				</c:if>
            			</td></tr>
						<tr align="center"><td>电话号码:</td><td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" name="phone" class="phone" value="${userUpdate.phone }"></td></tr>
						<tr align="center"><td>邮箱:</td><td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" name="email" class="email" value="${userUpdate.email }"></td></tr>
						<tr align="center"><td>性别:</td><td>
							<select name="gender" class="gender">
								<c:forEach items="${dataMap['SEX'] }" var="sex">
									<option value="${sex.valueId }" <c:if test="${sex.valueId == userUpdate.gender}">selected="selected"</c:if>>${sex.valueName }</option>						
								</c:forEach>
							</select>
						<tr align="center"><td>身份证号码:</td><td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" name="cardId" class="cardId" value="${userUpdate.cardId }"></td></tr>
						<tr align="center"><td>地址:</td><td><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text" name="address" class="address" value="${userUpdate.address }"></td></tr>
						<tr><td colspan="2" align="center"><input onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="button" value=" 确  认  修  改  " onclick="update()"></td></tr>
					</table>
				</div>
			</div>
		</div>
		<%@include file="common/footer.jsp"%>
	</div>
</body>
</html>
