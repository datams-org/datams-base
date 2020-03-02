package com.wiseweb.order.entity;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class Order extends DataEntity<Order> {

	private static final long serialVersionUID = 1L;

	//主键id
	private int orderId;
	//执行人
	private String executor;
	//变更人
	private String changer;
	//库类型
	private String dbType;
	//更新类型
	private String updateType;
	//库名称
	private String dbCode;
	//是否可用
	private String available;
	//创建时间
	private Date createTime;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getExecutor() {
		return executor;
	}
	public void setExecutor(String executor) {
		this.executor = executor;
	}
	public String getChanger() {
		return changer;
	}
	public void setChanger(String changer) {
		this.changer = changer;
	}
	public String getDbType() {
		return dbType;
	}
	public void setDbType(String dbType) {
		this.dbType = dbType;
	}
	public String getUpdateType() {
		return updateType;
	}
	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}
	public String getDbCode() {
		return dbCode;
	}
	public void setDbCode(String dbCode) {
		this.dbCode = dbCode;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	
	
}
