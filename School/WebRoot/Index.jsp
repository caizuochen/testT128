<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>学校管理系统首页</title>
</head>
<body>
	<%@include file="common/header.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="common/side.jsp"%>
			<div class="rightbox">
				<h2 class="mbx">我的信息</h2>
				<div class="morebt">
					<ul id="ulStudMsgHeadTab">
						<li><a class="tab2" onclick="" href="${pageContext.request.contextPath }/Index.jsp">个人资料</a>
						</li>
					</ul>
				</div>
				<div class="cztable">
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="right" width="80">用户名：</td>
							<td>${user.userName}&nbsp;</td>
							<td align="right" width="100">身份证号码：</td>
							<td>${user.cardId}&nbsp;</td>
						</tr>
						<tr>
							<td align="right">性别：</td>
							<td>
							<c:forEach items="${dataMap['SEX']}" var="sex">
								<c:if test="${sex.valueId == user.gender}">
									${sex.valueName }
								</c:if>
							</c:forEach>&nbsp;</td>
							<td align="right">手机号码：&nbsp;</td>
							<td>${user.phone}&nbsp;</td>
						</tr>
						<tr>
							<td align="right">QQ:</td>
							<td>${user.QQ}&nbsp;</td>
							<td align="right">电子邮箱：</td>
							<td>${user.email}&nbsp;</td>
						</tr>
						<tr>
							<td align="right">联系地址：</td>
							<td colspan="4">${user.address}&nbsp;</td>
						</tr>
						<tr align="center">
							<td colspan="5" height="40">
								<div align="center">
									<input type="button" value="修改我的信息" class="input2" onclick="window.location= 'userCURD/queryUserById.action?id=${user.id}'"/>
								</div>
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
