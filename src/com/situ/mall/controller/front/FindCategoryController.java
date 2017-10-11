package com.situ.mall.controller.front;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Banji;
import com.situ.mall.pojo.Category;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Controller
@RequestMapping("/category")
public class FindCategoryController {
	@Resource(name="categoryService")
	private ICategoryService categoryService;
	
	@RequestMapping("/findParentCategory.shtml")
    public  String findParentCategory(Model model) {
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
