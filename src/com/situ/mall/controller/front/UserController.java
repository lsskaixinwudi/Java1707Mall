package com.situ.mall.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ILoginService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name="loginService")
	private ILoginService loginService;
	@RequestMapping("/getLoginPage")
	public String getLoginPage() {
		return "login_layer";
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public ServerResponse login(String name, String password, HttpServletRequest request) {
		System.out.println("name:" + name);
		System.out.println("password:" + password);
		User user = new User(name, password);
		User resultUser = loginService.getUser(user);
		if (user != null && resultUser != null) {
			if (user.getusername().equals(resultUser.getusername() ) && user.getPassword().equals(resultUser.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("user", resultUser);
				return ServerResponse.createSuccess("登陆成功!");
			}
			return ServerResponse.createError("登陆失败！");
		}
		return ServerResponse.createError("登陆失败！");
	}
}
