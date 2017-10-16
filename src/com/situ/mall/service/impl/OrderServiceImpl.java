package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.OrderDao;
import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.service.IOrderService;

@Service("orderService")
public class OrderServiceImpl implements IOrderService{
	@Resource(name="orderDao")
	private OrderDao orderDao;
	


	@Override
	public List<Order> findOrder(Integer user_id) {
		return orderDao.findOrder(user_id);
	}

}
