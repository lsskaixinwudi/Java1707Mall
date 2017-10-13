package com.situ.mall.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.ILoginService;
import com.situ.mall.service.IProductService;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	@Autowired
	public IProductService productService;
	@Resource(name="categoryService")
	private ICategoryService categoryService;
	@Resource(name="loginService")
	private ILoginService loginService;
	@RequestMapping(value="/loginSession.shtml")
	public String loginSession(Model model, HttpServletRequest req){
		String path = null;
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		if (user != null) {
			
				System.out.println(user);
				path =  "order";
			} else {
				path = "login";
			}
		System.out.println(path);
		return path;
	}
}



