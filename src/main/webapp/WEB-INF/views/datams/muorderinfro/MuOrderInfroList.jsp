<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工单信息</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		function saveExecutor()
		{
			var executorName;
			var orderId;
			executorName = $("#executor").val();
			orderId = $("#orderId").text();
			$.ajax({
				type: "POST",
				url: "${ctx}/datams/muorderinfro/saveExecutor",
				data: { "executorName" : executorName ,
						"orderId" : orderId
					},
				error: function(data, status){
	
				},
				success: function(data, status) {
					alert("执行人变更成功");
					window.location.href = "${ctx}/datams/muorder/";
				}
			});
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li ><a href="${ctx}/datams/muorder/">工单列表</a></li>
		<li class="active"><a href="${ctx}/datams/muorderinfro/">工单详情</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="muOrderInfro" action="${ctx}/datams/muorderinfro/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<li>
			<label>工单号：</label><label id="orderId">${orderId}</label>
			<label>执行人：</label>
			<select id="executor" name="projectPorperty" style="width: 120px">
				<c:forEach items="${userList}" var="userList">
					<option value="${userList.name}">${userList.name}</option>
				</c:forEach>
			</select>
		</li>
		<%-- <li>
			<label>类型：</label>
			<form:select path="user.loginName" class="input-medium">
				<form:option value="" label=""/>
				<form:options items="${userList}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>
		</li> --%>
		&nbsp;<input id="confirm" class="btn btn-primary" type="button" value="确认" onclick="saveExecutor()"/>
		<sys:message content="${message}"/>
	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>表名</th>
				<th>列名</th>
				<th>修改类型</th>
				<th>原内容</th>
				<th>更新内容</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="muOrderInfro">
			<tr>
				<td>${muOrderInfro.tableCode}</td>
				<td>${muOrderInfro.fieldCode}</td>
				<td>${muOrderInfro.updateType}</td>
				<td>${muOrderInfro.oldContent}</td>
				<td>${muOrderInfro.newContent}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
