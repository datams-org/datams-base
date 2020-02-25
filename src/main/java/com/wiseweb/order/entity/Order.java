package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class Order extends DataEntity<Order> {

	private static final long serialVersionUID = 1L;

	private int ORDER_ID;
	private String EXECUTOR;
	private String CHANGER;
	private String DB_TYPE;
	private String UPDATE_TYPE;
	private String DB_CODE;
	private String AVAILABLE;

	public int getORDER_ID() {
		return ORDER_ID;
	}

	public void setORDER_ID(int oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}

	public String getEXECUTOR() {
		return EXECUTOR;
	}

	public void setEXECUTOR(String eXECUTOR) {
		EXECUTOR = eXECUTOR;
	}

	public String getCHANGER() {
		return CHANGER;
	}

	public void setCHANGER(String cHANGER) {
		CHANGER = cHANGER;
	}

	public String getDB_TYPE() {
		return DB_TYPE;
	}

	public void setDB_TYPE(String dB_TYPE) {
		DB_TYPE = dB_TYPE;
	}

	public String getUPDATE_TYPE() {
		return UPDATE_TYPE;
	}

	public void setUPDATE_TYPE(String uPDATE_TYPE) {
		UPDATE_TYPE = uPDATE_TYPE;
	}

	public String getDB_CODE() {
		return DB_CODE;
	}

	public void setDB_CODE(String dB_CODE) {
		DB_CODE = dB_CODE;
	}

	public String getAVAILABLE() {
		return AVAILABLE;
	}

	public void setAVAILABLE(String aVAILABLE) {
		AVAILABLE = aVAILABLE;
	}

}
