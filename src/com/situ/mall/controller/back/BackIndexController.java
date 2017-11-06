package com.situ.mall.controller.back;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ILoginService;

@Controller
@RequestMapping(value="/index")
public class BackIndexController {
	
	@Autowired
	private ILoginService loginService;
	
	
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
	
	@RequestMapping("/toLogin")
	public String toLogin(){
		return "login_back";
	}
	
	
	@RequestMapping("/login")
	public String login(String name, String password, HttpServletRequest request) {
		System.out.println("name:" + name);
		System.out.println("password:" + password);
		User user = new User(name, password);
		User resultUser = loginService.getUser(user);
		if (user != null && resultUser != null) {
			if (user.getusername().equals(resultUser.getusername() ) && user.getPassword().equals(resultUser.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("user", resultUser);
				return "redirect:/index/index.action";
			}
			return "login_back";
		} 
		return "login_back";
	}

	
	
	
}

