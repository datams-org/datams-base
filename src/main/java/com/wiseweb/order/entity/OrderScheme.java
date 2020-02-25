package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OrderScheme extends DataEntity<OrderScheme> {

	private static final long serialVersionUID = 1L;

	private int SCHEME_ID;//id
	private String SCHEME_NAME;//中文名称
	private String SCHEME_CODE;//英文名称
	private int DB_ID;//库id

	public int getSCHEME_ID() {
		return SCHEME_ID;
	}

	public void setSCHEME_ID(int sCHEME_ID) {
		SCHEME_ID = sCHEME_ID;
	}

	public String getSCHEME_NAME() {
		return SCHEME_NAME;
	}

	public void setSCHEME_NAME(String sCHEME_NAME) {
		SCHEME_NAME = sCHEME_NAME;
	}

	public String getSCHEME_CODE() {
		return SCHEME_CODE;
	}

	public void setSCHEME_CODE(String sCHEME_CODE) {
		SCHEME_CODE = sCHEME_CODE;
	}

	public int getDB_ID() {
		return DB_ID;
	}

	public void setDB_ID(int dB_ID) {
		DB_ID = dB_ID;
	}

}
