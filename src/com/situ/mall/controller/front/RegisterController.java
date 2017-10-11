package com.situ.mall.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.User;
import com.situ.mall.service.IRegisterService;

@Controller
@RequestMapping(value="/register")
public class RegisterController {
	
	@Autowired
	private IRegisterService registerService;

	@RequestMapping(value="getAddRegister")
	public String getAddRegister(){
		
		return "register";
	}
	
	@RequestMapping(value="addRegister")
	public String addRegister(Model model, User user){
		registerService.add(user);
		return "redirect:/login/toLogin.shtml";
	}
	
/*	@RequestMapping(value="login")
	public String login(){
		
		return "login";
	}*/
}
