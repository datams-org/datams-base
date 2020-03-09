<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务表管理</title>
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
		
		function cleanInpute()
		{
			$("form:input").val("");
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/datams/muorder/">工单列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="order" action="${ctx}/datams/muorder/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<li>
			<label>工单号：</label>
			<form:input path="id" htmlEscape="false" maxlength="50" class="input-medium"/>
		</li>
		<li>
			<label>工单生成时间：</label>
			<form:input path="createTime" htmlEscape="false" maxlength="50" class="input-medium" />
		</li>
		<li>
			<label>变更人员：</label>
			<form:input path="changer" htmlEscape="false" maxlength="50" class="input-medium" />
		</li>
		<li>
			<label>是否生效：</label>
			<form:select path="available" class="input-medium">
				<form:option value="" label=""/>
				<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>
		</li>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		&nbsp;<input onclick="cleanInpute()" class="btn btn-primary" type="button" value="清除"/>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>工单号</th>
				<th>库名称</th>
				<th>库类型</th>
				<th>更新类型</th>
				<th>是否可用</th>
				<th>执行人</th>
				<th>变更人</th>
				<th>生成时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="order">
			<tr>
				<td>${order.orderId}</td>
				<td>${order.dbCode}</td>
				<td>${order.dbType}</td>
				<td>${order.updateType}</td>
				<td>${fns:getDictLabel(order.available, 'yes_no', '')}</td>
				<td>${order.executor}</td>
				<td>${order.changer}</td>
				<td><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<c:if test="${order.available}==0">
						<a href="${ctx}/datams/muorderinfro/list?orderId=${order.orderId}">修改</a>
						<a href="${ctx}/datams/muorder/delete?orderId=${order.orderId}">删除</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
