package com.wiseweb.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.wiseweb.order.dao.MuOrderDao;
import com.wiseweb.order.entity.Order;

@Service
public class MuOrderService extends CrudService<MuOrderDao, Order>{
	
	@Autowired
	private MuOrderDao muOrderDao;
	
	@Transactional(readOnly = false)
	public void deleteOrder(Order order) {
		// TODO Auto-generated method stub
		muOrderDao.deleteOrder(order);
	}


}
