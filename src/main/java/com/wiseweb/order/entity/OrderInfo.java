package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OrderInfo extends DataEntity<OrderInfo> {

	private static final long serialVersionUID = 1L;

	private int ORDER_INFOR_ID;
	private String SYSTEM_CODE;
	private String TABLE_CODE;
	private String FIELD_CODE;
	private String UPDATE_TYPE;
	private String OLD_CONTENT;
	private String NEW_CONTENT;
	private int ORDER_ID;
	
	private Order order;

	public int getORDER_INFOR_ID() {
		return ORDER_INFOR_ID;
	}

	public void setORDER_INFOR_ID(int oRDER_INFOR_ID) {
		ORDER_INFOR_ID = oRDER_INFOR_ID;
	}

	public String getSYSTEM_CODE() {
		return SYSTEM_CODE;
	}

	public void setSYSTEM_CODE(String sYSTEM_CODE) {
		SYSTEM_CODE = sYSTEM_CODE;
	}

	public String getTABLE_CODE() {
		return TABLE_CODE;
	}

	public void setTABLE_CODE(String tABLE_CODE) {
		TABLE_CODE = tABLE_CODE;
	}

	public String getFIELD_CODE() {
		return FIELD_CODE;
	}

	public void setFIELD_CODE(String fIELD_CODE) {
		FIELD_CODE = fIELD_CODE;
	}

	public String getUPDATE_TYPE() {
		return UPDATE_TYPE;
	}

	public void setUPDATE_TYPE(String uPDATE_TYPE) {
		UPDATE_TYPE = uPDATE_TYPE;
	}

	public String getOLD_CONTENT() {
		return OLD_CONTENT;
	}

	public void setOLD_CONTENT(String oLD_CONTENT) {
		OLD_CONTENT = oLD_CONTENT;
	}

	public String getNEW_CONTENT() {
		return NEW_CONTENT;
	}

	public void setNEW_CONTENT(String nEW_CONTENT) {
		NEW_CONTENT = nEW_CONTENT;
	}

	public int getORDER_ID() {
		return ORDER_ID;
	}

	public void setORDER_ID(int oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}
