package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OrderFiled extends DataEntity<OrderFiled> {

	private static final long serialVersionUID = 1L;

	private int fieldId;
	private String fieldNumber;
	private String fieldName;
	private String fieldCode;
	private String fieldType;
	private String fieldLen;
	private String fieldAccuracy;
	private String keyFlag;
	private String orEmpty;
	private int tableId;
	private String tableCode;
	private String dbCode;
	private String schemeCode;
	private String systemCode;
	private String fieldKey;

	private OrderTable orderTable;// 管护表对象
	private OrderScheme orderScheme;// scheme对象
	private OrderSystem orderSystem;// 系统对象

	public int getFieldId() {
		return fieldId;
	}

	public void setFieldId(int fieldId) {
		this.fieldId = fieldId;
	}

	public String getFieldNumber() {
		return fieldNumber;
	}

	public void setFieldNumber(String fieldNumber) {
		this.fieldNumber = fieldNumber;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldCode() {
		return fieldCode;
	}

	public void setFieldCode(String fieldCode) {
		this.fieldCode = fieldCode;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getFieldLen() {
		return fieldLen;
	}

	public void setFieldLen(String fieldLen) {
		this.fieldLen = fieldLen;
	}

	public String getFieldAccuracy() {
		return fieldAccuracy;
	}

	public void setFieldAccuracy(String fieldAccuracy) {
		this.fieldAccuracy = fieldAccuracy;
	}

	public String getKeyFlag() {
		return keyFlag;
	}

	public void setKeyFlag(String keyFlag) {
		this.keyFlag = keyFlag;
	}

	public String getOrEmpty() {
		return orEmpty;
	}

	public void setOrEmpty(String orEmpty) {
		this.orEmpty = orEmpty;
	}

	public int getTableId() {
		return tableId;
	}

	public void setTableId(int tableId) {
		this.tableId = tableId;
	}

	public String getTableCode() {
		return tableCode;
	}

	public void setTableCode(String tableCode) {
		this.tableCode = tableCode;
	}

	public String getDbCode() {
		return dbCode;
	}

	public void setDbCode(String dbCode) {
		this.dbCode = dbCode;
	}

	public String getSchemeCode() {
		return schemeCode;
	}

	public void setSchemeCode(String schemeCode) {
		this.schemeCode = schemeCode;
	}

	public String getSystemCode() {
		return systemCode;
	}

	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
	}

	public String getFieldKey() {
		return fieldKey;
	}

	public void setFieldKey(String fieldKey) {
		this.fieldKey = fieldKey;
	}

	public OrderTable getOrderTable() {
		return orderTable;
	}

	public void setOrderTable(OrderTable orderTable) {
		this.orderTable = orderTable;
	}

	public OrderScheme getOrderScheme() {
		return orderScheme;
	}

	public void setOrderScheme(OrderScheme orderScheme) {
		this.orderScheme = orderScheme;
	}

	public OrderSystem getOrderSystem() {
		return orderSystem;
	}

	public void setOrderSystem(OrderSystem orderSystem) {
		this.orderSystem = orderSystem;
	}

}
