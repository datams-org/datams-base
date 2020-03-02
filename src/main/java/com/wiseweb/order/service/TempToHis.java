package com.wiseweb.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wiseweb.order.dao.TempToHisDao;
import com.wiseweb.order.entity.OrderTemp;

@Service
public class TempToHis {
	
	@Autowired
	private TempToHisDao tempToHisDao;
	
	@Transactional(readOnly = false)
	public void timeJob()
	{
		//取出临时表数据
		List<OrderTemp> tempList = tempToHisDao.findData();
		//把数据存放到历史表
		for(OrderTemp orderTemp : tempList)
		{
			tempToHisDao.saveData(orderTemp);
		}
		//把临时表清空
		tempToHisDao.cleanTemp();
	}
	
}
