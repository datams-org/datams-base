package com.wiseweb.order.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class OrderDb extends DataEntity<OrderDb> {

	private static final long serialVersionUID = 1L;

	private int DB_ID;// id
	private String DB_NAME;// 中文名称
	private String DB_CODE;// 英文名称
	private String DB_TYPE;// 库类型
	private String DB_HOST;// 库地址
	private String DB_USER;// 库用户
	private String DB_PASS;// 库密码
	private String DB_DRIVER;// 驱动
	private String DB_EV;// 环境
	private int SYSTEM_ID;// 系统id

	public int getDB_ID() {
		return DB_ID;
	}

	public void setDB_ID(int dB_ID) {
		DB_ID = dB_ID;
	}

	public String getDB_NAME() {
		return DB_NAME;
	}

	public void setDB_NAME(String dB_NAME) {
		DB_NAME = dB_NAME;
	}

	public String getDB_CODE() {
		return DB_CODE;
	}

	public void setDB_CODE(String dB_CODE) {
		DB_CODE = dB_CODE;
	}

	public String getDB_TYPE() {
		return DB_TYPE;
	}

	public void setDB_TYPE(String dB_TYPE) {
		DB_TYPE = dB_TYPE;
	}

	public String getDB_HOST() {
		return DB_HOST;
	}

	public void setDB_HOST(String dB_HOST) {
		DB_HOST = dB_HOST;
	}

	public String getDB_USER() {
		return DB_USER;
	}

	public void setDB_USER(String dB_USER) {
		DB_USER = dB_USER;
	}

	public String getDB_PASS() {
		return DB_PASS;
	}

	public void setDB_PASS(String dB_PASS) {
		DB_PASS = dB_PASS;
	}

	public String getDB_DRIVER() {
		return DB_DRIVER;
	}

	public void setDB_DRIVER(String dB_DRIVER) {
		DB_DRIVER = dB_DRIVER;
	}

	public String getDB_EV() {
		return DB_EV;
	}

	public void setDB_EV(String dB_EV) {
		DB_EV = dB_EV;
	}

	public int getSYSTEM_ID() {
		return SYSTEM_ID;
	}

	public void setSYSTEM_ID(int sYSTEM_ID) {
		SYSTEM_ID = sYSTEM_ID;
	}

}
