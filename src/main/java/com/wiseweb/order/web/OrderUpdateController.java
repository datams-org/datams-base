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
import com.wiseweb.order.service.OrderUpdateService;

@Controller
@RequestMapping(value = "${adminPath}/order/update/")
public class OrderUpdateController {
	@Autowired
	private OrderUpdateService OrderUpdateService;
	
	@ModelAttribute
	public Order get(@RequestParam(required = false) String id) {
		Order entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = OrderUpdateService.get(id);
		}
		if (entity == null) {
			entity = new Order();
		}
		return entity;
	}
	
	@RequestMapping(value = "list")
	public String list(Order order,Model model,HttpServletResponse response,HttpServletRequest request) {
		Page<Order> page = OrderUpdateService.findPage(new Page<Order>(request, response), order); 
		model.addAttribute("page", page);
		return "jeesite/order/orderUpdateList";
	}
}
