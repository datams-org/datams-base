package com.wiseweb.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.wiseweb.order.dao.MuOrderScriptDao;
import com.wiseweb.order.entity.OrderInfo;
import com.wiseweb.order.entity.OrderScript;

@Service
public class MuOrderScriptService extends CrudService<MuOrderScriptDao, OrderScript>{

	@Autowired
	private MuOrderScriptDao muOrderScriptDao;
	
	@Transactional(readOnly = false)
	public void saveScript(List<OrderInfo> list,String dbType) {
		// TODO Auto-generated method stub
		//脚本语句
		String scriptSql = "";
		String modifyTypeLength = "";
		String addColumn = "";
		//约束语句
		String columnConstraint = "";
		
		//根据数据库类型设置脚本结构语句
		if(dbType.equals("oracle"))
		{
			//新增字段结构语句
			addColumn = "alter table systemname.tablename add (columnname columntype( columnlength columnprecision ) constraint);";
			//类型与长度更改结构语句
			modifyTypeLength = "alter table systemname.tablename modify ( columnname newcontent ); ";
		}
		if(dbType.equals("db2"))
		{
			//新增字段结构语句
			addColumn = "alter table systemname.tablename add columnname columntype ( columnlength columnprecision )";
			//类型与长度更改结构语句
			modifyTypeLength = "alter table systemname.tablename alter columnname set data type newcontent; ";
		}
		if(dbType.equals("mysql"))
		{
			//新增字段结构语句
			addColumn = "alter table `systemname.tablename` add `columnname` columntype( columnlength columnprecision ) constraint;";
			//类型与长度更改结构语句
			modifyTypeLength = "alter table systemname.tablename modify column columnname newcontent; ";
		}
		
		for(OrderInfo orderInfro : list)
		{
			//获取更改类型
			String type = orderInfro.getUpdateType();
			//获取系统名称
			String systemName = orderInfro.getSystemCode();
			//获取表名
			String tableName = orderInfro.getTableCode();
			//获取字段名
			String columnName = orderInfro.getFieldCode();
			//获取更新内容
			String newContent = orderInfro.getNewContent();
			
			try
			{
				if(type.equals("修改"))
				{
					//替换结构语句中对应的内容
					scriptSql += modifyTypeLength.replaceFirst("systemname",systemName).replaceFirst("tablename",tableName).replaceFirst("columnname",columnName).replaceFirst("newcontent",newContent);
				}
				if(type.equals("新增字段"))
				{
					String newAddColumn = addColumn.replaceFirst("systemname", systemName).replaceFirst("tablename",tableName).replaceFirst("columnname",columnName);
					//把更新内容按","拆分
					String[] columnContent = newContent.split(",");
					for(int i = 0 ; i < columnContent.length ; i++)
					{
						String columnDetails = columnContent[i];
						if(columnDetails.indexOf("类型") != -1)
						{
							String[] columnType = columnDetails.split(":");
							newAddColumn = newAddColumn.replaceFirst("columntype", columnType[1]);
						}
						if(columnDetails.indexOf("长度") != -1)
						{
							String[] ColumnLength = columnDetails.split(":");
							newAddColumn = newAddColumn.replaceFirst("columnlength", ColumnLength[1]);
						}
						if(columnDetails.indexOf("精度") != -1)
						{
							String[] ColumnPrecision = columnDetails.split(":");
							if(ColumnPrecision.length != 1)
							{
								
								newAddColumn = newAddColumn.replaceFirst("columnprecision", ","+ColumnPrecision[1]);
							}
							else
							{
								newAddColumn = newAddColumn.replaceFirst("columnprecision","");
							}
						}
						if(columnDetails.indexOf("是否为空") != -1)
						{
							String[] isNotNull = columnDetails.split(":");
							if(isNotNull[1].equals("是"))
							{
								columnConstraint += "null ";
							}
							else
							{
								columnConstraint += "not null ";
							}
						}
						if(columnDetails.indexOf("是否主键") != -1)
						{
							String[] primaryKey = columnDetails.split(":");
							if(primaryKey[1].equals("是"))
							{
								columnConstraint += "primary key ";
							}
						}
						if(columnDetails.indexOf("备注") != -1)
						{
							String[] comment = columnDetails.split(":");
							if(comment.length != 1)
							{
								comment[1] = "comment "+comment[1];
								columnConstraint += comment[1];
							}
						}
					}
					newAddColumn = newAddColumn.replaceFirst("constraint", columnConstraint);
					scriptSql += newAddColumn;
				}
			}
			catch(Exception e){}
			
		}
		OrderScript orderScript = new OrderScript();
		orderScript.setOrderId(list.get(0).getOrderId());
		orderScript.setTableCode(list.get(0).getTableCode());
		orderScript.setScripType("目标系统source_type,大数据平台系统bigDataSystem_type,大数据平台跑数脚本bigDataExe_type");
		orderScript.setExeStr(scriptSql);
		muOrderScriptDao.saveScriptSql(orderScript);
	}
	
}
