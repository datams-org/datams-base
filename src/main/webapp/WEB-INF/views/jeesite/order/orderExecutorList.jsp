<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工单执行单</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="orderScriptExe" action="${ctx}/order/executor/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>工单号：</label>
				<form:input path="id" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>执行人：</label>
				<form:input path="order.executor" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
		</ul>
	</form:form>
	<sys:message content="${message}" type="hide"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>工单脚本号</th><th>表名称</th><th>脚本类型</th><th>是否执行</th><th>创建时间</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="script">
			<tr>
				<td>${script.orderScriptId}</td>
				<td>${script.tableCode}</td>
				<td>${script.scripType}</td>
				<td>${script.isExecute}</td>
				<td><fmt:formatDate value="${script.createDate}" type="both"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>