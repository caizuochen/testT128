<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>数据字典列表</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/Script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	function deleteDataDictionary(id){
		$.ajax({
			type : "get",//请求类型
			url : "dataDictionary/deleteData.action",//请求的url
			data : "id=" + id,//请求参数
			dataType : "text",//ajax接口（请求url）返回的数据类型
			success : function(data) {//data：返回数据（json对象）
				if (data >= 1) {
					alert("删除成功");
				} else {
					alert("删除失败");
				};
			},
			error : function(data) {//当访问时候，404，500 等非200的错误状态码
				alert("系统繁忙!!!,错误编码:026");
			}
		});
	}
</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="../common/side.jsp"%>
			<div class="rightbox">
				<h2 class="mbx">
					数据字典列表
				</h2>
				<div class="feilei">
					数据字典列表 &gt;<a href="AddDataDictionary.jsp"> 添加数据字典</a>
				</div>
				<div class="fllist">
					<div class="cztable">
					<form action="dataDictionary/queryData.action">
						<div align="center">
							<table>
								<tr>
									<td>查询条件:</td>
									<td>请输入类型编码:<input name="queryTypeCode" value="${queryTypeCode }" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text"></td>
									<td>请输入类型名称:<input name="queryTypeName" value="${queryTypeName }" onKeypress="javascript:if(event.keyCode == 32)event.returnValue = false;" type="text"></td>
									<td><input type="submit" value=" 查  询 "></td>
									<td><input type="submit" value="刷新缓存 "></td>
								</tr>
							</table>
						</div>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="text-align:center;">
							<tr>
								<th style="text-align: center;">类型编码</th>
								<th style="text-align: center;">类型名称</th>
								<th style="text-align: center;">类型值ID</th>
								<th style="text-align: center;">类型值名称</th>
								<th style="text-align: center;">状态(启用/禁用)</th>
								<th style="text-align: center;">操作</th>
							</tr>
								<c:forEach items="${queryData.list }" var="d">
								<tr>
									<input type="hidden" value="${d.id }">
									<td>${d.typeCode}</td>
									<td>${d.typeName}</td>
									<td>${d.valueId}</td>
									<td>${d.valueName}</td>
									<td><input type="checkbox" <c:if test="${d.state == 1 }"> checked="checked"</c:if> disabled="disabled"></td>
									<td><input type="button" value=" 删 除  "
										onclick="deleteDataDictionary(${d.id })"><br> <input
										type="button" value=" 修 改  "
										onclick="window.location='dataDictionary/queryDataById.action?id=${d.id}'">
									</td>
									</tr>
								</c:forEach>
							</table>
						<div align="center">
						<table>
							<tr><td colspan="4" align="center">&nbsp;&nbsp;一共有条<span style="color: red;">${queryData.total}</span>数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前第<span style="color: #f127ea;">${queryData.pageNum}</span>/<span style="color: #fcae17;">${queryData.pages}</span>页</td></tr>
							<tr>
								<c:if test="${queryData.pageNum > 1 }">
								<td><a href="dataDictionary/queryData.action?queryTypeName=${queryTypeName}&queryTypeCode=${queryTypeCode}">首页</a></td>
								<td><a href="dataDictionary/queryData.action?pageNumber=${queryData.pageNum-1}&queryTypeName=${queryTypeName}&queryTypeCode=${queryTypeCode}">上一页</a></td>
								</c:if>
								<c:if test="${queryData.pageNum != queryData.pages }">
								<td><a href="dataDictionary/queryData.action?pageNumber=${queryData.pageNum+1}&queryTypeName=${queryTypeName}&queryTypeCode=${queryTypeCode}">下一页</a></td>
								<td><a href="dataDictionary/queryData.action?pageNumber=${queryData.pages}&queryTypeName=${queryTypeName}&queryTypeCode=${queryTypeCode}">尾页</a></td>
								</c:if>
							</tr>
						</table>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
</body>
</html>
