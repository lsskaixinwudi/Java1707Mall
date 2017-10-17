package com.situ.mall.controller.front;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ILoginService;
import com.situ.mall.service.IOrderService;
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
	
	@Resource(name="orderService")
	private IOrderService orderService;
	
	@RequestMapping(value="/loginSession.shtml")
	public String loginSession(Model model, HttpServletRequest req){
		String path = null;
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		if (user != null) {
			
				System.out.println(user);
				path="redirect:/order/prepareOrder.shtml";
			} else {
				path = "login";
			}
		System.out.println(path);
		return path;
	}
	@RequestMapping("/prepareOrder.shtml")
    public String prepareOrder(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		Shipping shipping = shippingService.findByUserId(user.getId());
		System.out.println(shipping);
		model.addAttribute("shipping",shipping);
		
		ObjectMapper objectMapper = new ObjectMapper();
		//只有对象里面不是null的才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		BuyCartVO buyCartVO = null;
		//1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
		Cookie[] cookies = request.getCookies();
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				System.out.println(cookie.getName());
				if ("buy_cart_cookie".equals(cookie.getName())) {
					//之前购物车中已经存在
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
	@RequestMapping(value="addOrder.shtml")
	public String addOrder(Model model, Integer shippingId, Integer paymentType, HttpServletRequest req, HttpServletResponse resp, BigDecimal currentUnitPrice) {
		Order order = new Order();
		
		order.setShippingId(shippingId);
		
		order.setPaymentType(paymentType);
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String dateStr = simpleDateFormat.format(date);
		BigDecimal orderNo = new BigDecimal(dateStr);
		
		order.setOrderNo(orderNo);
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		order.setUserId(user.getId());
		
		Integer status = 10;
		order.setStatus(status);
		
		boolean result = orderService.addOrder(order);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
		BuyCartVO buyCartVO = null;
		Cookie[] cookies = req.getCookies();
		System.out.println(cookies);
		//1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("buy_cart_cookie".equals(cookie.getName())) {
					//之前已经有购物车
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
		if (null != buyCartVO) {
			List<CartItemVO> items = buyCartVO.getItems();
			for (CartItemVO item : items) {
				OrderItem orderItem = new OrderItem();
				Integer productId = item.getProduct().getId();
				orderItem.setProductId(productId);//商品id
				
				Product productTemp = productService.selectById(productId);
				
				String productName = productTemp.getName();
				orderItem.setProductName(productName);//商品姓名
				
				String productImage = productTemp.getmain_image();
				orderItem.setProductImage(productImage);//商品主图
				System.out.println(currentUnitPrice);
				orderItem.setCurrentUnitPrice((double)currentUnitPrice.intValue());
				Integer totalPrice = currentUnitPrice.intValue() * item.getAmount();
				orderItem.setTotalPrice(totalPrice);//商品总价
				System.out.println(currentUnitPrice);
				orderItem.setQuantity(item.getAmount());//商品数量
				
				orderItem.setUserId(user.getId());
				
				orderItem.setOrderNo(orderNo);
				
				boolean resultItem = orderService.addOrderItem(orderItem);
				
				System.out.println(orderItem);
				model.addAttribute("orderItems",orderItem);
			}
		}
				System.out.println(order);
				model.addAttribute("order",order);
		
				//清除购物车
				Cookie cookie = new Cookie("cart_items_list",null);
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 7);
				
				resp.addCookie(cookie);
				
				
		return "redirect:/order/toOrederItems.shtml";
	}
	@RequestMapping(value = "/toOrederItems")
	public String orderItems(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession(false);
		User user = (User) session.getAttribute("user");
		Integer userId = user.getId();

		// 将订单返回给前台展示
		List<Order> orderItems = orderService.findOrder(userId);
		model.addAttribute("orderItems", orderItems);
		for (Order order : orderItems) {
			System.out.println(order);
			List<OrderItem> list = order.getList();
			
			for (OrderItem orderItem : list) {
				/*System.out.println(orderItem);*/
			}
		}
		return "orderItem";
	}
}

