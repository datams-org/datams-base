package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OrderScriptExe extends DataEntity<OrderScriptExe> {

	private static final long serialVersionUID = 1L;

	private int orderScriptId;
	private String tableCode;
	private String exeStr;
	private String scripType;
	private String isExecute;

	public int getOrderScriptId() {
		return orderScriptId;
	}

	public void setOrderScriptId(int orderScriptId) {
		this.orderScriptId = orderScriptId;
	}

	public String getTableCode() {
		return tableCode;
	}

	public void setTableCode(String tableCode) {
		this.tableCode = tableCode;
	}

	public String getExeStr() {
		return exeStr;
	}

	public void setExeStr(String exeStr) {
		this.exeStr = exeStr;
	}

	public String getScripType() {
		return scripType;
	}

	public void setScripType(String scripType) {
		this.scripType = scripType;
	}

	public String getIsExecute() {
		return isExecute;
	}

	public void setIsExecute(String isExecute) {
		this.isExecute = isExecute;
	}

}
