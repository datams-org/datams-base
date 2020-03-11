package com.wiseweb.order.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.wiseweb.order.dao.OrderDao;
import com.wiseweb.order.entity.OrderFiled;
import com.wiseweb.order.entity.OrderInfo;
import com.wiseweb.order.entity.OrderScript;
import com.wiseweb.order.entity.OrderScriptExe;
import com.wiseweb.order.entity.OrderSystem;
import com.wiseweb.order.entity.OrderTable;
import com.wiseweb.order.entity.OrderTemp;

@Service
public class OrderService extends CrudService<OrderDao,OrderSystem>{
	@Autowired
	private OrderDao orderDao;

	public Object findAll() {
		List<OrderSystem> orders = orderDao.findList(new OrderSystem());
		return orders;
	}

	public List<OrderFiled> findInfoByTableId(OrderFiled orderFiled) {
		List<OrderFiled> orderFileds = orderDao.findInfoByTableId(orderFiled);
		return orderFileds;
	}

	public OrderFiled findFiledById(OrderFiled orderFiled) {
		orderFiled = orderDao.findFiledById(orderFiled);
		return orderFiled;
	}

	public OrderFiled findFiledByFiledId(OrderFiled orderFiled) {
		orderFiled = orderDao.findFiledByFiledId(orderFiled);
		return orderFiled;
	}

	public String findSystemCode(OrderFiled orderFiled) {
		String systemCode = orderDao.findSystemCode(orderFiled);
		return systemCode;
	}
	
	@Transactional(readOnly = false)
	public void saveOrderTemp(OrderTemp orderTemp) {
		orderDao.saveOrderTemp(orderTemp);
	}

	public String findDbType(OrderFiled orderFiled) {
		String dbType = orderDao.findDbType(orderFiled);
		return dbType;
	}

	public List<OrderTemp> findTempByTableCode(OrderFiled orderFiled) {
		List<OrderTemp> orderTemps = orderDao.findTempByTableCode(orderFiled);
		return orderTemps;
	}
	
	@Transactional(readOnly = false)
	public void saveOrder(com.wiseweb.order.entity.Order order) {
		orderDao.saveOrder(order);
	}

	public List<OrderTemp> findNewTemp(OrderFiled orderFiled) {
		List<OrderTemp> orderTemps = orderDao.findNewTemp(orderFiled);
		return orderTemps;
	}

	public int findOrderId(OrderFiled orderFiled) {
		int count = orderDao.findOrderId(orderFiled);
		return count;
	}
	
	@Transactional(readOnly = false)
	public void saveOrderInfo(OrderInfo orderInfo) {
		orderDao.saveOrderInfo(orderInfo);
	}

	public List<OrderInfo> findOrderInfoById(OrderScript orderScript) {
		List<OrderInfo> orderInfos = orderDao.findOrderInfoById(orderScript);
		return orderInfos;
	}

	public List<OrderScript> findScriptById(OrderScript orderScript) {
		List<OrderScript> orderScripts = orderDao.findScriptById(orderScript);
		return orderScripts;
	}

	public List<OrderScript> findScript(OrderScript orderScript) {
		List<OrderScript> orderScripts = orderDao.findScript(orderScript);
		return orderScripts;
	}
	
	@Transactional(readOnly = false)
	public void saveOrderScriptExe(OrderScriptExe orderScriptExe) {
		orderDao.saveOrderScriptExe(orderScriptExe);
	}

	public int findScriptExeById(OrderScript orderScript) {
		int count = orderDao.findScriptExeById(orderScript);
		return count;
	}

}
