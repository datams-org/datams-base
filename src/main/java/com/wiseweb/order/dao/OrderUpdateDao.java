package com.wiseweb.order.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.wiseweb.order.entity.Order;

@MyBatisDao
public interface OrderUpdateDao extends CrudDao<Order>{

}
