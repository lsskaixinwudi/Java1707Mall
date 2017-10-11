package com.situ.mall.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;

@Controller
@RequestMapping(value="/detail")
public class DetailController {

	@Autowired
	private IProductService productService;
	@RequestMapping(value="findByProduct")
	public String findByProduct(Model model, Integer id){
		Product product = productService.selectById(27);
		model.addAttribute("product", product);
		return "detail";
	}
}
