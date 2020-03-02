package com.wiseweb.order.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.wiseweb.order.entity.Order;
import com.wiseweb.order.entity.OrderInfo;
import com.wiseweb.order.service.MuOrderInfroService;
import com.wiseweb.order.service.MuOrderScriptService;

@Controller
@RequestMapping(value = "${adminPath}/datams/muorderinfro")
public class MuOrderInfroController extends BaseController{
	
	@Autowired
	private MuOrderInfroService muOrderInfroService;
	@Autowired
	private MuOrderScriptService muOrderScriptService;
	@Autowired
	private MuOrderController muOrderController;
	
	@RequestMapping(value = {"list",""})
	public String list(OrderInfo orderInfo,HttpServletRequest request,HttpServletResponse response,Model model)
	{
		Page<OrderInfo> page = muOrderInfroService.findPage(new Page<OrderInfo>(request, response), orderInfo);
		model.addAttribute("page", page);
		
		List<User> userList = new ArrayList<User>(); 
		userList = muOrderInfroService.findAllExecutor();
	    model.addAttribute("userList", userList);
	        
	    model.addAttribute("orderId",orderInfo.getOrderId());
	    
		return "datams/muorderinfro/MuOrderInfroList";
	}
	
	@RequestMapping(value = {"saveExecutor"})
	public String saveExecutor(HttpServletRequest request,HttpServletResponse response,Model model)
	{
		String executorName = request.getParameter("executorName");
		String orderId = request.getParameter("orderId");
		//保存执行人
		muOrderInfroService.saveExecutor(executorName,orderId);
		//更新工单为生效
		muOrderInfroService.updateAvailable(orderId);
		//生成对应脚本存放到工单脚本表
		generateScript(orderId);
		return "datams/muorderinfro/MuOrderInfroList";
	}

	private void generateScript(String orderId) {
		// TODO Auto-generated method stub
		//从工单信息表取出数据
		OrderInfo muOrderInfro = new OrderInfo();
		muOrderInfro.setOrderId(Integer.parseInt(orderId));
		//获取数据库类型
		Order order = muOrderController.get(orderId);
		
		List<OrderInfo> list = muOrderInfroService.findList(muOrderInfro);
		//生成脚本并保存至数据库
		muOrderScriptService.saveScript(list,order.getDbType());
	}
}
