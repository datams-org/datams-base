package com.wiseweb.order.web;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.wiseweb.order.entity.OrderFiled;
import com.wiseweb.order.entity.OrderTemp;
import com.wiseweb.order.service.OrderService;
@Controller
@RequestMapping(value = "${adminPath}/order/")
public class OrderController extends BaseController{
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "")
	public String index() {
		return "jeesite/order/orderList";
	}
	
	@RequestMapping(value = "tree")
	public String tree(Model model) {
		model.addAttribute("categoryList", orderService.findAll());
		return "jeesite/order/orderTree";
	}
	
	@RequestMapping(value = "none")
	public String none() {
		return "jeesite/order/orderNone";
	}
}
