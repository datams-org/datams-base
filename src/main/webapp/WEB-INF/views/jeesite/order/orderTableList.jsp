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
		
		function addNew(id) {
			window.location.href = "${ctx}/order/other/form?tableId="+id;
		}
		function generateOrder(id,code){
			$.ajax({
				type: "POST",
				url: "${ctx}/order/other/generateOrder",
				data: { "tableCode" : id ,"dbCode":code},
				error: function(data, status){
					$.jBox.error('发生未知错误，请联系管理员。', '错误');
				},
				success: function(data, status) {
					if(data["result"]=="success"){
						$.jBox.success('工单生成成功！','成功');
					} else {
						$.jBox.error('没有进行字段的更改或者新增，无法生成工单', '错误');
					}
				}
			});
		}
		 /*
		function edit(id) {
			window.parent.openTab("Edit", "修改","${ctx}/order/form?fieldId="+id, "true");
		} */
	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="" action="" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<li class="btns">
			<input id="" class="btn btn2 btn-primary" type="button" value="新增" onclick="addNew('${tableId}')"/>
			<input id="btnSubmit" class="btn btn-primary" type="button" value="生成工单" onclick="generateOrder('${tableCode}','${dbCode }')"/>
		</li>
	</form:form>
	<sys:message content="${message}" type="hide"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>操作</th><th>schema</th><th>表名</th><th>序号</th><th>列名</th><th>类型</th><th>长度</th>
				<th>精度</th><th>是否主键</th><th>是否为空</th><th>备注</th><th>操作人</th><th>修改时间</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${orderFiled}" var="filed">
			<tr>
				<td>
	    			<a href="${ctx}/order/other/form?fieldId=${filed.fieldId}">修改</a>
				</td>
				<td>${filed.schemeCode}</td>
				<td>${filed.tableCode}</td>
				<td>${filed.fieldNumber}</td>
				<td>${filed.fieldCode}</td>
				<td>${filed.fieldType}</td>
				<td>${filed.fieldLen}</td>
				<td>${filed.fieldAccuracy}</td>
				<td>${filed.keyFlag}</td>
				<td>${filed.orEmpty}</td>
				<td>${filed.remarks}</td>
				<td>${filed.createBy}</td>
				<td><fmt:formatDate value="${filed.updateDate}" type="both"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>