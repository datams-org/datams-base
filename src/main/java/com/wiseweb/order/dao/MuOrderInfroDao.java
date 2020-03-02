package com.wiseweb.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.wiseweb.order.entity.OrderInfo;

@MyBatisDao
public interface MuOrderInfroDao extends CrudDao<OrderInfo>{

	List<User> findAllExecutor();

	void saveExecutor(@Param("executorName")String executorName,@Param("orderId")String orderId);

	void updateAvailable(String orderId);

	void deleteInfro(int orderId);

}
