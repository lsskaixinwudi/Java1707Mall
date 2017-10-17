package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.vo.PageBean;

public interface IOrderService {


	List<Order> findOrder(Integer user_id);

	PageBean getPageBean(Integer pageIndex, int pageSize);

	void deletById(int id);

	boolean addOrder(Order order);

	boolean addOrderItem(OrderItem orderItem);

}
