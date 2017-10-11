package com.situ.mall.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.ILoginService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Resource(name="loginService")
	private ILoginService loginService;
	@Resource(name="categoryService")
	private ICategoryService categoryService;
	@RequestMapping(value="toLogin")
	public String toLogin() {
		return "login";
	}  
	  
	@RequestMapping(value="/loginIndex.shtml")
	public String login(Model model, HttpServletRequest req, String username, String password) {
		String path = null;
		User user = new User(username, password);
		User resultUser = loginService.getUser(user);
		if (user != null && resultUser != null) {
			if (user.getusername().equals(resultUser.getusername() ) && user.getPassword().equals(resultUser.getPassword())) {
				/*HttpSession session = req.getSession();
				session.setAttribute("user", user);*/
				System.out.println(user);
				path =  "index";
			} else {
				path = "register";
			}
		} else {
			path = "register";
		}
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
		System.out.println(path);
		return path;
	}
	
	@RequestMapping(value="toRegister.shtml")
	public String toRegister() {
		return "register";
	}
	
	@RequestMapping(value="register.shtml")
	public String register(User user) {
		boolean result = loginService.addUser(user);
		return "redirect:/login/toLogin.shtml";
	}
}