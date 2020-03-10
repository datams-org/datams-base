package com.wiseweb.order.service;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.service.CrudService;
import com.wiseweb.order.dao.OrderUpdateDao;
import com.wiseweb.order.entity.Order;

@Service
public class OrderUpdateService extends CrudService<OrderUpdateDao,Order>{

}
