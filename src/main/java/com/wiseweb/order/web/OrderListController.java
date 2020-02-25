package com.wiseweb.order.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.DateUtil;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.wiseweb.order.entity.Order;
import com.wiseweb.order.entity.OrderFiled;
import com.wiseweb.order.entity.OrderInfo;
import com.wiseweb.order.entity.OrderScript;
import com.wiseweb.order.entity.OrderTemp;
import com.wiseweb.order.service.OrderService;

@Controller
@RequestMapping(value = "${adminPath}/order/other/")
public class OrderListController extends BaseController {
	@Autowired
	private OrderService orderService;

	@ModelAttribute
	public OrderFiled get(@RequestParam(required = false) String fieldId) {
		OrderFiled entity = null;
		if (StringUtils.isNotBlank(fieldId)) {
			OrderFiled orderFiled = new OrderFiled();
			orderFiled.setFieldId(Integer.parseInt(fieldId));
			entity = orderService.findFiledById(orderFiled);
		}
		if (entity == null) {
			entity = new OrderFiled();
		}
		return entity;
	}
	//右侧表字段展示查询
	@RequestMapping(value = "findTable")
	public String findTable(OrderFiled orderFiled,Model model) {
		List<OrderFiled> orderFileds = orderService.findInfoByTableId(orderFiled);
		model.addAttribute("orderFiled", orderFileds);
		if(orderFileds != null) {
			model.addAttribute("tableId", orderFileds.get(0).getTableCode());
			model.addAttribute("dbCode", orderFileds.get(0).getDbCode());
		}
		return "jeesite/order/orderTableList";
	}
		
	// 修改，新增表字段及其他
	@RequestMapping(value = "form")
	public String form(OrderFiled orderFiled, Model model) {
		model.addAttribute("orderFiled", orderFiled);
		return "jeesite/order/orderTableForm";
	}
	
	@RequestMapping(value = "generateOrder")
	public String generateOrder(OrderFiled orderFiled,HttpServletResponse response) throws ParseException {
		Map<String, String> resultMap = Maps.newHashMap();
		Order order = new Order();

		List<OrderTemp> orderTemps = orderService.findTempByTableCode(orderFiled);
		
		if(orderTemps != null) {
			//保存工单
			int count = 0;
			String dbType = orderService.findDbType(orderFiled);
			order.setDB_CODE(orderFiled.getDbCode());
			order.setDB_TYPE(dbType);
			order.setAVAILABLE("0");
			order.setCreateDate(new Date());
			
			for(OrderTemp orderTemp : orderTemps) {
				if(orderTemp.getUpdateType().equals("新增字段")) {
					count++;
				}
			}
			if(count == orderTemps.size()) {
				order.setUPDATE_TYPE("insert");
			} else if(count == 0) {
				order.setUPDATE_TYPE("update");
			} else {
				order.setUPDATE_TYPE("update_insert");
			}
			orderService.saveOrder(order);
			//保存工单信息
			OrderInfo orderInfo = new OrderInfo();
			List<OrderTemp> orderFileds = orderService.findNewTemp(orderFiled);
			int orderId = orderService.findOrderId(orderFiled);
			for(OrderTemp orderTemp : orderFileds) {
				orderInfo.setSYSTEM_CODE(orderTemp.getSystemCode());
				orderInfo.setTABLE_CODE(orderTemp.getTableCode());
				orderInfo.setFIELD_CODE(orderTemp.getFieldCode());
				orderInfo.setUPDATE_TYPE(orderTemp.getUpdateType());
				orderInfo.setOLD_CONTENT(orderTemp.getOldContent());
				orderInfo.setNEW_CONTENT(orderTemp.getNewContent());
				orderInfo.setCreateDate(new Date());
				orderInfo.setORDER_ID(orderId);
				
				orderService.saveOrderInfo(orderInfo);
			}
			
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "none");
		}
		return renderString(response, resultMap);
	}
	
	// 保存
	@RequestMapping(value = "save")
	public String save(OrderFiled orderFiled, Model model, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		OrderFiled orderFiled_old = orderService.findFiledByFiledId(orderFiled);
		String systemCode = orderService.findSystemCode(orderFiled);
		// 判断是新增还是修改
		if (orderFiled_old == null) {
			OrderTemp orderTemp = new OrderTemp();
			orderTemp.setSystemCode(systemCode);
			orderTemp.setTableCode(orderFiled.getTableCode());
			orderTemp.setFieldCode(orderFiled.getFieldCode());
			orderTemp.setUpdateType("新增字段");
			orderTemp.setOldContent("");
			orderTemp.setNewContent("scheme:" + orderFiled.getSchemeCode() + ",序号:" + orderFiled.getFieldNumber()
					+ ",类型:" + orderFiled.getFieldType() + ",长度:" + orderFiled.getFieldLen() + ",精度:"
					+ orderFiled.getFieldAccuracy() + ",是否主键:" + orderFiled.getKeyFlag() + ",是否为空:"
					+ orderFiled.getOrEmpty() + ",备注:" + orderFiled.getRemarks());
			orderTemp.setCreateDate(new Date());
			orderService.saveOrderTemp(orderTemp);
		} else {
			OrderTemp orderTemp = new OrderTemp();
			orderTemp.setSystemCode(systemCode);
			orderTemp.setTableCode(orderFiled.getTableCode());
			orderTemp.setFieldCode(orderFiled.getFieldCode());
			String type = "";
			String oldContent = "";
			String newContent = "";
			try {
				if (!orderFiled_old.getFieldCode().equals(orderFiled.getFieldCode())) {
					type = "列名改  ";
					oldContent = "列名：" + orderFiled_old.getFieldCode() + "  ";
					newContent = "列名：" + orderFiled.getFieldCode() + "  ";
				}
				if (!orderFiled_old.getFieldType().equals(orderFiled.getFieldType())) {
					type += "类型改  ";
					oldContent += "类型：" + orderFiled_old.getFieldType() + "  ";
					newContent += "类型：" + orderFiled.getFieldType() + "  ";
				}
				if (!orderFiled_old.getFieldLen().equals(orderFiled.getFieldLen())) {
					type += "长度改  ";
					oldContent += "长度：" + orderFiled_old.getFieldLen() + "  ";
					newContent += "长度：" + orderFiled.getFieldLen() + "  ";
				}
				if (!orderFiled_old.getFieldAccuracy().equals(orderFiled.getFieldAccuracy())) {
					type += "精度改  ";
					oldContent += "精度：" + orderFiled_old.getFieldAccuracy();
					newContent += "精度：" + orderFiled.getFieldAccuracy();
				}
			} catch (Exception e) {
			}
			orderTemp.setUpdateType(type);
			orderTemp.setOldContent(oldContent);
			orderTemp.setNewContent(newContent);
			orderTemp.setCreateDate(new Date());
			orderService.saveOrderTemp(orderTemp);
		}
		addMessage(redirectAttributes, "保存成功");
		return "redirect:" + Global.getAdminPath() + "/order/other/findTable?tableId=" + orderFiled.getTableId();
	}
	
	//工单脚本
	@RequestMapping(value = "orderScript")
	public String orderScript(OrderScript orderScript,Model model) {
		System.out.println("----------"+orderScript.getOrderId());
		List<OrderInfo> orderInfos = orderService.findOrderInfoById(orderScript);
		List<OrderScript> orderScripts = orderService.findScriptById(orderScript);
		System.out.println("----------"+orderInfos.get(0).getOrder().getEXECUTOR());
		System.out.println("----------"+orderInfos.get(0).getOrder().getCHANGER());
		model.addAttribute("orderInfos", orderInfos);
		model.addAttribute("orderScripts", orderScripts);
		return "jeesite/order/orderUpdate";
	}
}
