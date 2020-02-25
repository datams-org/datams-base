package com.wiseweb.order.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.wiseweb.order.entity.Order;
import com.wiseweb.order.entity.OrderFiled;
import com.wiseweb.order.entity.OrderInfo;
import com.wiseweb.order.entity.OrderScript;
import com.wiseweb.order.entity.OrderSystem;
import com.wiseweb.order.entity.OrderTemp;

@MyBatisDao
public interface OrderDao extends CrudDao<OrderSystem>{

	List<OrderFiled> findInfoByTableId(OrderFiled orderFiled);

	OrderFiled findFiledById(OrderFiled orderFiled);

	OrderFiled findFiledByFiledId(OrderFiled orderFiled);

	String findSystemCode(OrderFiled orderFiled);

	void saveOrderTemp(OrderTemp orderTemp);

	String findDbType(OrderFiled orderFiled);

	List<OrderTemp> findTempByTableCode(OrderFiled orderFiled);

	void saveOrder(Order order);

	List<OrderTemp> findNewTemp(OrderFiled orderFiled);

	int findOrderId(OrderFiled orderFiled);

	void saveOrderInfo(OrderInfo orderInfo);

	List<OrderInfo> findOrderInfoById(OrderScript orderScript);

	List<OrderScript> findScriptById(OrderScript orderScript);

}
