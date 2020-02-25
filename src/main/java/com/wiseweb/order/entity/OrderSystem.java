package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OrderSystem extends DataEntity<OrderSystem> {

	private static final long serialVersionUID = 1L;

	private int SYSTEM_ID;//系统id
	private String SYSTEM_NAME;//系统中文名称
	private String SYSTEM_CODE;//系统英文名称
	
	private OrderTable orderTable;//管护表对象
	private OrderDb orderDb;//库对象
	private OrderScheme orderScheme;//scheme对象

	public int getSYSTEM_ID() {
		return SYSTEM_ID;
	}

	public void setSYSTEM_ID(int sYSTEM_ID) {
		SYSTEM_ID = sYSTEM_ID;
	}

	public String getSYSTEM_NAME() {
		return SYSTEM_NAME;
	}

	public void setSYSTEM_NAME(String sYSTEM_NAME) {
		SYSTEM_NAME = sYSTEM_NAME;
	}

	public String getSYSTEM_CODE() {
		return SYSTEM_CODE;
	}

	public void setSYSTEM_CODE(String sYSTEM_CODE) {
		SYSTEM_CODE = sYSTEM_CODE;
	}

	public OrderTable getOrderTable() {
		return orderTable;
	}

	public void setOrderTable(OrderTable orderTable) {
		this.orderTable = orderTable;
	}

	public OrderDb getOrderDb() {
		return orderDb;
	}

	public void setOrderDb(OrderDb orderDb) {
		this.orderDb = orderDb;
	}

	public OrderScheme getOrderScheme() {
		return orderScheme;
	}

	public void setOrderScheme(OrderScheme orderScheme) {
		this.orderScheme = orderScheme;
	}

}
