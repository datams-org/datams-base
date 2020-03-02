package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OrderInfo extends DataEntity<OrderInfo> {

	private static final long serialVersionUID = 1L;

	private int orderInfroId;
	private String systemCode;
	private String tableCode;
	private String fieldCode;
	private String updateType;
	private String oldContent;
	private String newContent;
	private int orderId;

	private Order order;



	public int getOrderInfroId() {
		return orderInfroId;
	}

	public void setOrderInfroId(int orderInfroId) {
		this.orderInfroId = orderInfroId;
	}

	public String getSystemCode() {
		return systemCode;
	}

	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
	}

	public String getTableCode() {
		return tableCode;
	}

	public void setTableCode(String tableCode) {
		this.tableCode = tableCode;
	}

	public String getFieldCode() {
		return fieldCode;
	}

	public void setFieldCode(String fieldCode) {
		this.fieldCode = fieldCode;
	}

	public String getUpdateType() {
		return updateType;
	}

	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}

	public String getOldContent() {
		return oldContent;
	}

	public void setOldContent(String oldContent) {
		this.oldContent = oldContent;
	}

	public String getNewContent() {
		return newContent;
	}

	public void setNewContent(String newContent) {
		this.newContent = newContent;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}
