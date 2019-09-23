<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>班级信息</title>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="../common/side.jsp"%>
			<div class="rightbox">
				<h2 class="mbx">我的信息 &gt; 班级信息&nbsp;&nbsp;&nbsp;自考</h2>
				<div class="morebt">
					<ul id="ulStudMsgHeadTab">
						<li><a class="tab2" onclick="" href="${pageContext.request.contextPath }/MyInfo/Index.jsp">个人资料</a>
						</li>
						<li><a class="tab2" onclick="" href="${pageContext.request.contextPath }/MyInfo/ClassInfo.jsp">班级信息</a>
						</li>
					</ul>
				</div>
				<div class="cztable">
					<table border="0" cellspacing="0" cellpadding="0" width="100%">
						<tr>
							<td width="91" align="right">班级名称：</td>
							<td colspan="5">2013秋经济法学&nbsp;</td>
						</tr>
						<tr>
							<td align="right">班级QQ群：</td>
							<td colspan="5">57197804 &nbsp;</td>
						</tr>
						<tr>
							<td align="right">班级宣传语：</td>
							<td colspan="5">&nbsp;</td>
						</tr>
						<tr>
							<td align="right">学校名称：</td>
							<td colspan="5">湖南大学&nbsp;</td>
						</tr>

						<tr>
							<td align="right"><div align="right">班主任老师：</div>&nbsp;</td>
							<td><div align="left">王娟</div></td>
							<td><div align="right">电话：</div>&nbsp;</td>
							<td><div align="left">15388088011</div>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="5" align="left" valign="middle"><input
								type="button" name="button2" id="button2" value="点击提交"
								class="input2" onclick="onSaveProblem()" />
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
