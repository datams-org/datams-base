package com.wiseweb.order.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.wiseweb.order.entity.OrderTemp;

@MyBatisDao
public interface TempToHisDao {

	List<OrderTemp> findData();

	void saveData(OrderTemp orderTemp);

	void cleanTemp();

}
