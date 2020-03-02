package com.wiseweb.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.wiseweb.order.dao.MuOrderInfroDao;
import com.wiseweb.order.entity.OrderInfo;

@Service
public class MuOrderInfroService extends CrudService<MuOrderInfroDao, OrderInfo>{

	@Autowired
	private MuOrderInfroDao muOrderInfroDao;
	
	public List<User> findAllExecutor() {
		// TODO Auto-generated method stub
		return muOrderInfroDao.findAllExecutor();
	}
	
	@Transactional(readOnly = false)
	public void saveExecutor(String executorName,String orderId) {
		// TODO Auto-generated method stub
		muOrderInfroDao.saveExecutor(executorName,orderId);
	}

	@Transactional(readOnly = false)
	public void updateAvailable(String orderId) {
		// TODO Auto-generated method stub
		muOrderInfroDao.updateAvailable(orderId);
	}
	
	@Transactional(readOnly = false)
	public void deleteInfro(int orderId) {
		// TODO Auto-generated method stub
		muOrderInfroDao.deleteInfro(orderId);
	}

}
