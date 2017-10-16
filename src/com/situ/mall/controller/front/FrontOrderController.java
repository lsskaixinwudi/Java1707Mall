package com.situ.mall.controller.front;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ILoginService;
import com.situ.mall.service.IProductService;
import com.situ.mall.service.IShippingService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;
import com.fasterxml.jackson.annotation.JsonInclude;

@Controller
@RequestMapping(value="order")
public class FrontOrderController {
	
	/*@Autowired
	private IShippingService shippingService;*/
	@Resource(name="loginService")
	private ILoginService loginService;
	
	@Resource(name="shippingService")
	private IShippingService shippingService;
	
	@Resource(name="productService")
	private IProductService productService;
	
	@RequestMapping("/prepareOrder.shtml")
    public String prepareOrder(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		
		/*User userNew = loginService.getUser(user);
		model.addAttribute("userNew",userNew);
		
		System.out.println(userNew);*/
		
		Shipping shipping = shippingService.findByUserId(user.getId());
		System.out.println(shipping);
		model.addAttribute("shipping",shipping);
		
		ObjectMapper objectMapper = new ObjectMapper();
		//ֻ�ж������治��null�Ĳ�ת��
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		BuyCartVO buyCartVO = null;
		//1.���cookie��������ﳵ�����Ǿʹ�cookie����ȡ��������ﳵ����
		Cookie[] cookies = request.getCookies();
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				System.out.println(cookie.getName());
				if ("buy_cart_cookie".equals(cookie.getName())) {
					//֮ǰ���ﳵ���Ѿ�����
					//"{\"items\":[{\"product\":{\"id\":45},\"amount\":1}],\"productId\":45}"
					String value = cookie.getValue();
					try {
						buyCartVO = objectMapper.readValue(value, BuyCartVO.class);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		if(buyCartVO != null) {
			List<CartItemVO> items = buyCartVO.getItems();
			for (CartItemVO item : items) {
				Product product = productService.selectById(item.getProduct().getId());
				item.setProduct(product);
			}
		} 
		model.addAttribute("buyCartVO", buyCartVO);		
		System.out.println(buyCartVO);
		return "order";
	}
}
