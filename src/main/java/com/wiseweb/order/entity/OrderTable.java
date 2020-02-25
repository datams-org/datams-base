package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OrderTable extends DataEntity<OrderTable> {

	private static final long serialVersionUID = 1L;

	private int TABLE_ID;//id
	private String TABLE_NAME;//中文名称
	private String TABLE_CODE;//英文名称
	private int SCHEME_ID;//scheme id

	public int getTABLE_ID() {
		return TABLE_ID;
	}

	public void setTABLE_ID(int tABLE_ID) {
		TABLE_ID = tABLE_ID;
	}

	public String getTABLE_NAME() {
		return TABLE_NAME;
	}

	public void setTABLE_NAME(String tABLE_NAME) {
		TABLE_NAME = tABLE_NAME;
	}

	public String getTABLE_CODE() {
		return TABLE_CODE;
	}

	public void setTABLE_CODE(String tABLE_CODE) {
		TABLE_CODE = tABLE_CODE;
	}

	public int getSCHEME_ID() {
		return SCHEME_ID;
	}

	public void setSCHEME_ID(int sCHEME_ID) {
		SCHEME_ID = sCHEME_ID;
	}

}
