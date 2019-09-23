<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>添加学员</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	function add() {
		//判断输入的用户名是否合法
		var studentName = $(".studentName").val();
		var isStudentName = false;
		if (studentName == "") {
			$("#error").html("学生名不能为空!!!");
			isStudentName = false;
		} else if (studentName.length > 5) {
			$("#error").html("学生名的最大长度5!!!");
			isStudentName = false;
		} else {
			isStudentName = true;
		}
		//判断输入的电话号码是否合法
		var phone = $(".phone").val();
		var isPhone=false;
		if (!(/^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/
				.test(phone))) {
			$("#error").html("电话号码不符合规则!!!");
			isPhone= false;
		}else {
			isPhone=true;
		}
		//判断身份证是否合法
		var cardid = $(".cardId").val();
		var isCardId=false;
		if (!(/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/
				.test(cardid))) {
			$("#error").html("身份证输入有误ヽ(ー_ー)ノ");
			isCardId = false;
		}else {
			isCardId=true;
		}
		//判断邮箱是否合法
		var email = $(".email").val();
		var isEmail=false;
		if ((/^\w{5,12}@[a-z0-9A-Z]{2,3}\.[a-z]+$|\,$/.test(email))) {
			if (!(email.toLowerCase().indexOf("qq") != -1)) {//如果值中含有qq则为qq邮箱
				$("#error").html("目前只支持QQ邮箱,请输入QQ邮箱哦ヾ(ｏ･ω･)ﾉ");
				isEmail= false;
			}else{
				isEmail=true;
			}
		} else {
			$("#error").html("邮箱输入不合法(〃＞皿＜)");
			isEmail= false;
		}
		//判断选择的班级中的人数是否已经满了是否合法
		var classId = $(".classId").val();
		var classCount=true;
		$.ajax({
			type : "get",//请求类型
			url : "student/classCount.action",//请求的url
			data : "id=" + classId,//请求参数
			async : false,
			dataType : "text",//ajax接口（请求url）返回的数据类型
			success : function(data) {//data：返回数据（json对象）
				if (data >= 30) {
					classCount = false;
					$("#error").html("该班已满30人,无法继续选择该班级!!!");
				}else {
					classCount=true;
				}
			},
			error : function() {//当访问时候，404，500 等非200的错误状态码
				alert("系统繁忙!!!,错误编码:011");
			}
		});
		if (isStudentName == true && isPhone==true && isCardId==true && isEmail==true && classCount==true) {
			var gender=$(".gender").val();
			var classId=$(".classId").val();
			var address=$(".address").val();
			var id=$(".id").val();
			$.ajax({
			type : "post",//请求类型
			url : "student/addStudent.action",//请求的url
			data : "studentName=" + studentName+
					"&gender="+gender+"&classId="+classId+
					"&address="+address+"&phone="+phone+"&email="+email
					+"&cardId="+cardid,//请求参数
			dataType : "text",//ajax接口（请求url）返回的数据类型
			success : function(data) {//data：返回数据（json对象）
				if (data >= 1) {
					alert("添加成功!!!");
					window.location="student/queryStudent.action";
				}else {
					alert("添加失败啦");
				};
			},
			error:function() {//当访问时候，404，500 等非200的错误状态码
				alert("系统繁忙!!!,错误编码:014");
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
				<h2 class="mbx">添加学员</h2>
				<div class="cztable" align="center">
					<table>
						<tr>
							<td colspan="2" align="center">添加学员</td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="color: red;" id="error"></td>
						</tr>
						<tr align="center">
							<td>学生名:</td>
							<td><input
								onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;"
								type="text" name="studentName" class="studentName">
							</td>
						</tr>
						<tr align="center">
							<td>电话号码:</td>
							<td><input
								onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;"
								type="text" name="phone" class="phone"">
							</td>
						</tr>
						<tr align="center">
							<td>邮箱:</td>
							<td><input
								onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;"
								type="email" name="email" class="email">
							</td>
						</tr>
						<tr align="center">
							<td>性别:</td>
							<td><select name="gender" class="gender">
									<c:forEach items="${dataMap['SEX'] }" var="sex">
										<option value="${sex.valueId }">${sex.valueName}</option>
									</c:forEach>
							</select>
							</td>
						</tr>
						<tr align="center">
							<td>年级:</td>
							<td><select name="classId" class="classId">
									<c:forEach items="${classInfo }" var="c">
										<option value="${c.id }">${c.className }</option>
									</c:forEach>
							</select>
							</td>
						</tr>
						<tr align="center">
							<td>身份证号码:</td>
							<td><input
								onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;"
								type="text" name="cardId" class="cardId">
							</td>
						</tr>
						<tr align="center">
							<td>地址:</td>
							<td><input
								onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;"
								type="text" name="address" class="address">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input
								onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;"
								type="button" value=" 确  认  添  加   " onclick="add()">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<%@include file="common/footer.jsp"%>
	</div>
</body>
</html>
