package com.situ.mall.controller.front;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;

@Controller
@RequestMapping(value="/cart")
public class CartController {
	@Autowired
	public IProductService productService;
	@RequestMapping("/addCart")
	public String addCart(Integer product_id,Integer amount,Model model,HttpServletRequest request,HttpServletResponse response){
		System.out.println("product"+product_id);
		System.out.println("amount"+amount);
		
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
		BuyCartVO buyCartVO = null;
		Cookie[] cookies = request.getCookies();
		//1.���cookie��������ﳵ�����Ǿʹ�cookie����ȡ��������ﳵ����
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("buy_cart_cookie".equals(cookie.getName())) {
					//֮ǰ�Ѿ��й��ﳵ
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
		//2.���cookieû��������ﳵ����,����Ҫnew BuyCartVO
		if (buyCartVO == null) {
			buyCartVO = new BuyCartVO();
		}
		
		//�ѹ�����ŵ����ﳵ����
		if (null != product_id) {
			Product productTemp = productService.selectById(product_id);
			Product product = new Product();
			product.setId(product_id);
			product.setStock(productTemp.getStock());
			CartItemVO cartItemVO = new CartItemVO();
			cartItemVO.setProduct(product);
			cartItemVO.setAmount(amount);
			
			buyCartVO.addItem(cartItemVO);
			buyCartVO.setProductId(product_id);
			
			//�ѹ��ﳵ����BuyCartVO��json��ʽд��cookie����
			StringWriter stringWriter = new StringWriter();
		    try {
				objectMapper.writeValue(stringWriter, buyCartVO);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//�����ﳵjson���ݷŵ�cookie����
			Cookie cookie = new Cookie("buy_cart_cookie", stringWriter.toString());
			//Ĭ�Ϲر������cookie����
			cookie.setMaxAge(60 * 60 * 24);
			
			cookie.setPath("/");
			
			//��cookie���͸������
			response.addCookie(cookie);
		}
		
		
		//�ŵ�������з��ص�ǰ��չʾ��������ﳵ����Ҫ��Product�����������ݲ���
		List<CartItemVO> items = buyCartVO.getItems();
		for (CartItemVO item : items) {
			Product product = productService.selectById(item.getProduct().getId());
			item.setProduct(product);
		}
		
		model.addAttribute("buyCartVO", buyCartVO);
		return "cart";
	}
}


