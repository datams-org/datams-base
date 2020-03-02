package com.wiseweb.order.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.wiseweb.order.entity.OrderScript;

@MyBatisDao
public interface MuOrderScriptDao extends CrudDao<OrderScript>{

	void saveScriptSql(OrderScript orderScript);

}
