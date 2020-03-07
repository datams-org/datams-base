<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工单</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="orderFiled" action="${ctx}/order/other/save" method="post" class="form-horizontal">
		<form:hidden path="fieldName"/>
		<form:hidden path="fieldId"/>
		<form:hidden path="tableId"/>
		<sys:message content="${message}"/>

		<div class="control-group">
			<label class="control-label">scheme:</label>
			<c:if test="${orderFiled.schemeCode != null }">
				<div class="controls">
					<label>${orderFiled.schemeCode }</label>
				</div>
			</c:if>
			<c:if test="${orderFiled.schemeCode == null }">
				<div class="controls">
					<form:input path="schemeCode" htmlEscape="false" maxlength="60" class="input-xxlarge"/>
				</div>
			</c:if>
			
		</div>
		<div class="control-group">
			<label class="control-label">表名:</label>
			<c:if test="${orderFiled.tableCode != null }">
				<div class="controls">
					<label>${orderFiled.tableCode }</label>
				</div>
			</c:if>
			<c:if test="${orderFiled.tableCode == null }">
				<div class="controls">
					<form:input path="tableCode" htmlEscape="false" maxlength="60" class="input-xxlarge"/>
				</div>
			</c:if>
		</div>
		<div class="control-group">
			<label class="control-label">序号:</label>
			<div class="controls">
				<form:input path="fieldNumber" htmlEscape="false" maxlength="60" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">列名:</label>
			<div class="controls">
				<form:input path="fieldCode" htmlEscape="false" maxlength="60" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">类型:</label>
			<div class="controls">
				<form:input path="fieldType" htmlEscape="false" maxlength="60" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">长度:</label>
			<div class="controls">
				<form:input path="fieldLen" htmlEscape="false" maxlength="60" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">精度:</label>
			<div class="controls">
				<form:input path="fieldAccuracy" htmlEscape="false" maxlength="60" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否主键:</label>
			<div class="controls">
				<form:radiobuttons path="keyFlag" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否为空:</label>
			<div class="controls">
				<form:radiobuttons path="orEmpty" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:input path="remarks" htmlEscape="false" maxlength="60" class="input-xxlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>