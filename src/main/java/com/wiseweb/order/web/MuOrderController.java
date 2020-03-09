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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.wiseweb.order.entity.Order;
import com.wiseweb.order.service.MuOrderInfroService;
import com.wiseweb.order.service.MuOrderService;

@Controller
@RequestMapping(value = "${adminPath}/datams/muorder")
public class MuOrderController extends BaseController{
	@Autowired
	private MuOrderService muOrderService;
	@Autowired
	private MuOrderInfroService muOrderInfroService;
	
	public Order get(String orderId) {
		// TODO Auto-generated method stub
		Order order = muOrderService.get(orderId);
		return order;
	}
	
	@RequestMapping(value = {"list",""})
	public String list(Order order,HttpServletRequest request,HttpServletResponse response,Model model)
	{
		if(request.getParameter("id") != "")
		{
			order.setOrderId(0);
		}
		Page<Order> page = muOrderService.findPage(new Page<Order>(request, response), order);
		model.addAttribute("page", page);
		return "datams/muorder/MuOrderList";
	}
	
	@RequestMapping(value = {"delete"})
	public String delete(Order order,HttpServletRequest request,HttpServletResponse response,Model model)
	{
		muOrderService.deleteOrder(order);
		muOrderInfroService.deleteInfro(order.getOrderId());
		return "datams/muorder/MuOrder";
	}

}
