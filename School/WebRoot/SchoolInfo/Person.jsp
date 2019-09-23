<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>人员信息详细</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="../common/side.jsp"%>
			<div class="rightbox">
				<h2 class="mbx">我的信息 &gt; 个人资料 &nbsp;&nbsp;&nbsp;</h2>
				<div class="morebt">
					<ul id="ulStudMsgHeadTab">
						<li><a class="tab2" onclick="" href="${pageContext.request.contextPath }/Index.jsp">个人资料</a>
						</li>
						<li><a class="tab2" onclick="" href="${pageContext.request.contextPath }/MyInfo/ClassInfo.jsp">班级信息</a>
						</li>
					</ul>
				</div>
				<div class="cztable">
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="right" width="80">姓名：</td>
							<td>邹智&nbsp;</td>
							<td align="right" width="90">身份证号码：</td>
							<td>430181198612113330&nbsp;</td>
						</tr>
						<tr>
							<td align="right">性别：</td>
							<td>男&nbsp;</td>
							<td align="right">考籍号：</td>
							<td>910513201419&nbsp;</td>
						</tr>
						<tr>
							<td align="right">手机号码：</td>
							<td>15111141999</td>
							<td align="right">第二联系号码：</td>
							<td></td>
						</tr>
						<tr>
							<td align="right">QQ:</td>
							<td></td>
							<td align="right">电子邮箱：</td>
							<td></td>
						</tr>
						<tr>
							<td align="right">联系地址：</td>
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td colspan="5" height="40">
								<div align="center">
									<input type="button" id="button2" value="联系方式有修改"
										onclick="submitMail()" class="input2" />
								</div></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
</body>
</html>
