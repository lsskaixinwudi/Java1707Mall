package com.situ.mall.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Category;
import com.situ.mall.service.ICategoryService;


@Controller
public class IndexController {
	@Resource(name="categoryService")
	private ICategoryService categoryService;
	@RequestMapping("/index.shtml")
	public String index(Model model) {
		List<Category> Parentlist = categoryService.findParentCategory();
		model.addAttribute("Parentlist",Parentlist);
		for (Category category : Parentlist) {
			System.out.println(category);
		}
		List<Category> list = categoryService.findAll();
		model.addAttribute("list",list);
		for (Category category : list) {
			System.out.println(category);
		}
		return "index";
	}


}
