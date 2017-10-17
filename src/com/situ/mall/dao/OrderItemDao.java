package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;

public interface OrderItemDao {

	List<OrderItem> findOrderItemByorder_no(Long orderNo);

	int addOrderItem(OrderItem orderItem);

	int add(Order order);

	List<Object> findorderByUser(Integer id);

	List<OrderItem> findByOrderNo(Long orderNo);

	Order selectById(String id);

}
