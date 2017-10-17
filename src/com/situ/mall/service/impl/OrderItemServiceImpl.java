package com.situ.mall.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.OrderItemDao;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.service.IOrderItemService;


@Service
public class OrderItemServiceImpl implements IOrderItemService {
	@Autowired
	private OrderItemDao orderItemDao;

	@Override
	public List<OrderItem> findOrderItemByorder_no(Long orderNo) {
		return orderItemDao.findOrderItemByorder_no(orderNo);
	}

	@Override
	public boolean add(Order order) {
		int result = orderItemDao.add(order);
		return result > 0 ? true : false;
	}

	@Override
	public int addOrderItem(OrderItem orderItem) {
		return orderItemDao.addOrderItem(orderItem);
	}

	@Override
	public List<Object> findorderByUser(Integer id) {
		return orderItemDao.findorderByUser(id);
	}

	@Override
	public List<OrderItem> findByOrder(Long orderNo) {
		return orderItemDao.findByOrderNo(orderNo);
	}

	@Override
	public Order selectById(String id) {
		return orderItemDao.selectById(id);
	}


	
}