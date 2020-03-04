package com.wiseweb.order.web;

import java.io.BufferedOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
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
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.wiseweb.order.entity.Order;
import com.wiseweb.order.entity.OrderFiled;
import com.wiseweb.order.entity.OrderInfo;
import com.wiseweb.order.entity.OrderScript;
import com.wiseweb.order.entity.OrderScriptExe;
import com.wiseweb.order.entity.OrderTemp;
import com.wiseweb.order.service.OrderService;

@Controller
@RequestMapping(value = "${adminPath}/order/other/")
public class OrderListController extends BaseController {
	@Autowired
	private OrderService orderService;

	@ModelAttribute
	public OrderFiled get(@RequestParam(required = false) String fieldId,@RequestParam(required = false) Integer tableId) {
		OrderFiled entity = null;
		if (StringUtils.isNotBlank(fieldId)) {
			OrderFiled orderFiled = new OrderFiled();
			orderFiled.setFieldId(Integer.parseInt(fieldId));
			entity = orderService.findFiledById(orderFiled);
		}
		if (entity == null) {
			entity = new OrderFiled();
			if(tableId != null) {
				entity.setTableId(tableId);
			}
		}
		return entity;
	}

	// 右侧表字段展示查询
	@RequestMapping(value = "findTable")
	public String findTable(OrderFiled orderFiled, Model model) {
		List<OrderFiled> orderFileds = orderService.findInfoByTableId(orderFiled);
		model.addAttribute("orderFiled", orderFileds);
		if (orderFileds.size() != 0 && orderFileds!= null) {
			model.addAttribute("tableCode", orderFileds.get(0).getTableCode());
			model.addAttribute("dbCode", orderFileds.get(0).getDbCode());
			model.addAttribute("tableId", orderFileds.get(0).getTableId());
		}
		return "jeesite/order/orderTableList";
	}

	// 修改，新增表字段及其他
	@RequestMapping(value = "form")
	public String form(OrderFiled orderFiled, Model model) {
		model.addAttribute("orderFiled", orderFiled);
		return "jeesite/order/orderTableForm";
	}
	
	//生成工单
	@RequestMapping(value = "generateOrder")
	public String generateOrder(OrderFiled orderFiled, HttpServletResponse response) throws ParseException {
		Map<String, String> resultMap = Maps.newHashMap();
		Order order = new Order();

		List<OrderTemp> orderTemps = orderService.findTempByTableCode(orderFiled);

		if (orderTemps != null) {
			// 保存工单
			int count = 0;
			String dbType = orderService.findDbType(orderFiled);
			order.setDbCode(orderFiled.getDbCode());
			order.setDbType(dbType);
			order.setAvailable("0");
			order.setCreateDate(new Date());
			
			User user = UserUtils.getUser();
			order.setChanger(user.getName());
			
			for (OrderTemp orderTemp : orderTemps) {
				if (orderTemp.getUpdateType().equals("新增字段")) {
					count++;
				}
			}
			if (count == orderTemps.size()) {
				order.setUpdateType("insert");
			} else if (count == 0) {
				order.setUpdateType("update");
			} else {
				order.setUpdateType("update_insert");
			}
			orderService.saveOrder(order);
			// 保存工单信息
			OrderInfo orderInfo = new OrderInfo();
			List<OrderTemp> orderFileds = orderService.findNewTemp(orderFiled);
			int orderId = orderService.findOrderId(orderFiled);
			for (OrderTemp orderTemp : orderFileds) {
				orderInfo.setSystemCode(orderTemp.getSystemCode());
				orderInfo.setTableCode(orderTemp.getTableCode());
				orderInfo.setFieldCode(orderTemp.getFieldCode());
				orderInfo.setUpdateType(orderTemp.getUpdateType());
				orderInfo.setOldContent(orderTemp.getOldContent());
				orderInfo.setNewContent(orderTemp.getNewContent());
				orderInfo.setCreateDate(new Date());
				orderInfo.setOrderId(orderId);

				orderService.saveOrderInfo(orderInfo);
			}

			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "none");
		}
		return renderString(response, resultMap);
	}

	// 字段修改新增保存
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
			String oldContent = "";
			String newContent = "";
			try {
				if (!orderFiled_old.getFieldType().equals(orderFiled.getFieldType()) || orderFiled_old.getFieldLen().equals(orderFiled.getFieldLen())) {
					oldContent += orderFiled_old.getFieldType() + "("+orderFiled_old.getFieldLen();
					newContent +=orderFiled.getFieldType() + "("+orderFiled.getFieldLen();
				} 
				if (!orderFiled_old.getFieldAccuracy().equals(orderFiled.getFieldAccuracy())) {
					oldContent += ","+ orderFiled_old.getFieldAccuracy()+")";
					newContent += ","+ orderFiled.getFieldAccuracy()+")";
				} else {
					oldContent += ")";
					newContent += ")";
				}
			} catch (Exception e) {
			}
			orderTemp.setUpdateType("修改字段");
			orderTemp.setOldContent(oldContent);
			orderTemp.setNewContent(newContent);
			orderTemp.setCreateDate(new Date());
			orderService.saveOrderTemp(orderTemp);
		}
		addMessage(redirectAttributes, "保存成功");
		return "redirect:" + Global.getAdminPath() + "/order/other/findTable?tableId=" + orderFiled.getTableId();
	}

	// 工单脚本展示
	@RequestMapping(value = "orderScript")
	public String orderScript(OrderScript orderScript, Model model) {
		List<OrderInfo> orderInfos = orderService.findOrderInfoById(orderScript);
		List<OrderScript> orderScripts = orderService.findScriptById(orderScript);

		if(orderInfos != null) {
			model.addAttribute("time", orderInfos.get(0).getCreateDate());
			model.addAttribute("id", orderInfos.get(0).getOrderId());
			model.addAttribute("EXECUTOR", orderInfos.get(0).getOrder().getExecutor());
			model.addAttribute("changer", orderInfos.get(0).getOrder().getChanger());
			model.addAttribute("updateTime", orderInfos.get(0).getOrder().getCreateDate());
		}else {
			model.addAttribute("time", "");
			model.addAttribute("id", "");
			model.addAttribute("EXECUTOR", "");
			model.addAttribute("changer", "");
			model.addAttribute("updateTime", "");
		}
		model.addAttribute("orderInfos", orderInfos);
		model.addAttribute("orderScripts", orderScripts);
		return "jeesite/order/orderUpdate";
	}

	// 工单下载
	@RequestMapping(value = "down")
	public void down(OrderScript orderScript, HttpServletResponse response) {
		String text = "";
	
		List<OrderScript> orderScripts = orderService.findScript(orderScript);
		for(OrderScript Script : orderScripts) {
			text += Script.getExeStr()+";"+"\r\n";
		}
		
		response.setCharacterEncoding("utf-8");
        //设置响应的内容类型
        response.setContentType("text/plain");
        //设置文件的名称和格式
        response.addHeader("Content-Disposition","attachment;filename="
        					+ genAttachmentFileName(orderScript.getScripType(), "SQL") + ".sql");//设置名称格式，没有这个中文名称无法显示
        BufferedOutputStream buff = null;
        ServletOutputStream outStr = null;
        try {
            outStr = response.getOutputStream();
            buff = new BufferedOutputStream(outStr);
            buff.write(text.getBytes("UTF-8"));
            buff.flush();
            buff.close();
        } catch (Exception e) {
        } finally {try {
                buff.close();
                outStr.close();
            } catch (Exception e) {
            }
        }
	}

	// 工单下载---防止中文文件名显示出错
	public String genAttachmentFileName(String cnName, String defaultName) {
		try {
			cnName = new String(cnName.getBytes("gb2312"), "ISO8859-1");
		} catch (Exception e) {
			cnName = defaultName;
		}
		return cnName;
	}
	
	//保存脚本信息
	@RequestMapping(value = "saveScript")
	public String saveScript(OrderScript orderScript,HttpServletResponse response) {
		Map<String, String> map = Maps.newHashMap();
		List<OrderScript> orderScripts = orderService.findScriptById(orderScript);
		
		if(orderScripts != null) {
			for(OrderScript Script : orderScripts) {
				OrderScriptExe orderScriptExe = new OrderScriptExe();
				
				orderScriptExe.setTableCode(Script.getTableCode());
				orderScriptExe.setExeStr(Script.getExeStr());
				orderScriptExe.setScripType(Script.getScripType());
				orderScriptExe.setIsExecute("0");
				orderScriptExe.setCreateDate(new Date());
				orderScriptExe.setUpdateDate(new Date());
				
				orderService.saveOrderScriptExe(orderScriptExe);
			}
			map.put("result", "success");
		} else {
			map.put("result", "error");
		}
		
		return renderString(response, map);
	}
	
}
