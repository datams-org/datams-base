<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>待评议客户详情</title>
	<meta name="decorator" content="default"/>
	
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
</head>
<body>
	<form:form class="detail-form form-horizontal">
		<sys:message content="${message}" />
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<th style="text-align: center;" colspan="4"><fmt:formatDate value="${orderInfos[0].createDate}" pattern="yyyy-MM-dd"/>信贷系统数据库表结构变更工单</th>
			</tr>
			<tr style="border: none">
				<td style="border: none">工单编号: ${orderInfos[0].orderId }</td>
				<td style="border: none">执行人: ${orderInfos[0].order.EXECUTOR }</td>
			</tr>
		</table>
		<div style="height: 5px"></div>
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th style="text-align: center">表名</th>
					<th style="text-align: center">列名</th>
					<th style="text-align: center">修改类型</th>
					<th style="text-align: center">原内容</th>
					<th style="text-align: center">更新内容</th>
				</tr>
			</thead>
			<tbody>
				<%-- <c:forEach items="" var=""> --%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<%-- </c:forEach> --%>
			</tbody>
		</table>
		
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<td style="border: none">目标系统脚本：</td>
				<td style="border: none">  <input id="" style="margin-left: -17px;" class="btn btn2 btn-primary" type="button" value="下载" onclick=""/></td>
			</tr>
		</table>
		<div style="height: 5px"></div>
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th style="text-align: center">表名</th>
					<th style="text-align: center">执行语句</th>
				</tr>
			</thead>
			<tbody>
				<%-- <c:forEach items="" var=""> --%>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<%-- </c:forEach> --%>
			</tbody>
		</table>
		
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<td style="border: none">大数据平台系统脚本:</td>
				<td style="border: none"><input id="" class="btn btn2 btn-primary" type="button" value="下载" onclick=""/></td>
			</tr>
		</table>
		<div style="height: 5px"></div>
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th style="text-align: center">表名</th>
					<th style="text-align: center">执行语句</th>
				</tr>
			</thead>
			<tbody>
				<%-- <c:forEach items="" var=""> --%>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<%-- </c:forEach> --%>
			</tbody>
		</table>
		
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<td style="border: none">大数据平台跑数脚本:</td>
				<td style="border: none"><input id="" class="btn btn2 btn-primary" type="button" value="下载" onclick=""/></td>
			</tr>
		</table>
		<div style="height: 5px"></div>
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th style="text-align: center">表名</th>
					<th style="text-align: center">执行语句</th>
				</tr>
			</thead>
			<tbody>
				<%-- <c:forEach items="" var=""> --%>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<%-- </c:forEach> --%>
			</tbody>
		</table>
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<td style="text-align: center;border: none">变更人:</td>
				<td style="text-align: center;border: none">变更时间:</td>
			</tr>
			<tr>
				<td style="text-align: center;border: none" colspan="2"><input id="" class="btn btn2 btn-primary" type="submit" value="确认" onclick=""/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>