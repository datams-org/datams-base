<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>待评议客户详情</title>
	<meta name="decorator" content="default"/>
	
	<script type="text/javascript">
		$(document).ready(function() {
		});
		
		function down(id,type) {
			window.location.href = "${ctx}/order/other/down?scripType="+type+"&orderId="+id;
		}
		
		function saveScript(id) {
			$.ajax({
				type:"POST",
				url:"${ctx}/order/other/saveScript",
				data:{"orderId":id},
				error: function(data,status) {
					$.jBox.error('发生未知错误，请联系管理员。', '错误');
				},
				success: function(data,status) {
					if(data["result"]=="success"){
						$.jBox.success('保存成功！','成功');
					} else {
						$.jBox.error('保存失败', '错误');
					}
				}
			});
		}
	</script>
</head>
<body>
	<form:form class="detail-form form-horizontal">
		<sys:message content="${message}" />
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<th style="text-align: center;" colspan="3"><fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/>信贷系统数据库表结构变更工单</th>
			</tr>
			<tr style="border: none">
				<td style="border: none">工单编号: ${id }</td>
				<td style="text-align:right;border: none">执行人: </td>
				<td style="border: none">${EXECUTOR }</td>
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
				<c:forEach items="${orderInfos }" var="orderInfo">
					<tr>
						<td>${orderInfo.tableCode }</td>
						<td>${orderInfo.fieldCode }</td>
						<td>${orderInfo.updateType }</td>
						<td>${orderInfo.oldContent }</td>
						<td>${orderInfo.newContent }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<td style="border: none">目标系统脚本：</td>
				<td style="border: none"><input id="" style="margin-left: -17px;" class="btn btn2 btn-primary" type="button" value="下载" onclick="down('${id }','source_type')"/></td>
			</tr>
		</table>
		<div style="height: 5px"></div>
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th style="width: 20%;text-align: center">表名</th>
					<th style="text-align: center">执行语句</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderScripts }" var="orderScript">
					<c:if test="${orderScript.scripType == 'source_type' }">
						<tr>
							<td>${orderScript.tableCode }</td>
							<td>${orderScript.exeStr }</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<td style="border: none">大数据平台系统脚本:</td>
				<td style="border: none"><input id="" class="btn btn2 btn-primary" type="button" value="下载" onclick="down('${id }','bigDataSystem_type')"/></td>
			</tr>
		</table>
		<div style="height: 5px"></div>
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th style="width: 20%;text-align: center">表名</th>
					<th style="text-align: center">执行语句</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderScripts }" var="orderScript">
					<c:if test="${orderScript.scripType == 'bigDataSystem_type' }">
						<tr>
							<td>${orderScript.tableCode }</td>
							<td>${orderScript.exeStr }</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<td style="border: none">大数据平台跑数脚本:</td>
				<td style="border: none"><input id="" class="btn btn2 btn-primary" type="button" value="下载" onclick="down('${id }','bigDataExe_type')"/></td>
			</tr>
		</table>
		<div style="height: 5px"></div>
		<table id="contentTable"
			class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th style="width: 20%;text-align: center">表名</th>
					<th style="text-align: center">执行语句</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderScripts }" var="orderScript">
					<c:if test="${orderScript.scripType == 'bigDataExe_type' }">
						<tr>
							<td>${orderScript.tableCode }</td>
							<td>${orderScript.exeStr }</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<div style="height: 5px"></div>
		<table class="table-form" style="border: none">
			<tr>
				<td style="width: 60%;border: none">变更人:${changer }</td>
				<td style="text-align: right;border: none">变更时间:</td>
				<td style="border: none"><fmt:formatDate value="${updateTime }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td style="text-align: center;border: none" colspan="3">
					<input id="" class="btn btn2 btn-primary" type="button" value="确认" onclick="saveScript('${id }')"/>
					<input id="btnCancel" class="btn btn2 btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>