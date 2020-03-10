<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>变更单</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		function addNew(id,tableCode,scheme) {
			window.location.href = "${ctx}/order/other/form?tableId="+id+"&tableCode="+tableCode+"&schemeCode="+scheme;
		}
	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="order" action="${ctx}/order/update/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>工单号：</label>
				<form:input path="orderId" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>变更人：</label>
				<form:input path="changer" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
		</ul>
	</form:form>
	<sys:message content="${message}" type="hide"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>工单号</th><th>库名称</th><th>执行人</th><th>变更人</th><th>创建时间</th><th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="order">
			<tr>
				<td>${order.orderId}</td>
				<td>${order.dbCode}</td>
				<td>${order.executor}</td>
				<td>${order.changer}</td>
				<td><fmt:formatDate value="${order.createDate}" type="both"/></td>
				<td>
	    			<a href="${ctx}/order/other/orderScript?orderId=+${order.orderId}">工单详情</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>