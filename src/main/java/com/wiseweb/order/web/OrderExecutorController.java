package com.wiseweb.order.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.wiseweb.order.entity.Order;
import com.wiseweb.order.entity.OrderScriptExe;
import com.wiseweb.order.service.OrderExecutorService;

@Controller
@RequestMapping(value = "${adminPath}/order/executor/")
public class OrderExecutorController {
	@Autowired
	private OrderExecutorService orderExecutorService;
	
	@ModelAttribute
	public OrderScriptExe get(@RequestParam(required = false) String id) {
		OrderScriptExe entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = orderExecutorService.get(id);
		}
		if (entity == null) {
			entity = new OrderScriptExe();
		}
		return entity;
	}
	
	@RequestMapping(value = "list")
	public String list(OrderScriptExe orderScriptExe,Model model,HttpServletResponse response,HttpServletRequest request) {
		if(request.getParameter("id") == "" || request.getParameter("id") == null) {
		} else {
			Order order = new Order();
			order.setOrderId(Integer.parseInt(request.getParameter("id")));
			orderScriptExe.setOrder(order); 
		}
		Page<OrderScriptExe> page = orderExecutorService.findPage(new Page<OrderScriptExe>(request, response), orderScriptExe); 
		model.addAttribute("page", page);
		return "jeesite/order/orderExecutorList";
	}
}