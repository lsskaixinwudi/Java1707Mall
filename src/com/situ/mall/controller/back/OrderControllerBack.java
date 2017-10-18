package com.situ.mall.controller.back;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.OrderItem;
import com.situ.mall.service.IOrderItemService;
import com.situ.mall.service.IOrderService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping("/orderBack")
public class OrderControllerBack {
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IOrderItemService orderItemService;
	//鏌ヨ
	@RequestMapping(value="/findOrderItem")
	public String findOrderItem(Long orderNo, Model model){
		System.out.println(orderNo);
		List<OrderItem> list = orderItemService.findOrderItemByorder_no(orderNo);
		model.addAttribute("list", list);
		System.out.println(list);
		return "order_show";
	}
	
	
	@RequestMapping(value = "/findPageBeanList")
	private ModelAndView findPageBeanList(Integer pageIndex, String pageSizeStr) {
		
		if (pageIndex == null) {
			pageIndex = 1;
		}
		int pageSize = 5;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		PageBean pageBean = (PageBean) orderService.getPageBean(pageIndex, pageSize);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pageBean", pageBean);
		modelAndView.setViewName("orderItem_show");
		return modelAndView;
	}
	@RequestMapping(value="/deletById")
	private String deletById(int id){
		orderService.deletById(id);
		return "redirect:/orderBack/findPageBeanList.action";
		
	}

}
