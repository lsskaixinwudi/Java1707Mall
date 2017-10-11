package com.situ.mall.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/cart")
public class CartController {

	@RequestMapping(value="findCart")
	public String findCart(Model model){
		return "cart";
	}
}
