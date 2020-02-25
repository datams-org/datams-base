package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OrderScript extends DataEntity<OrderScript> {

	private static final long serialVersionUID = 1L;

	private int orderScriptId;
	private String tableCode;
	private String exeStr;
	private String scripType;
	private int orderId;

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

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

}
