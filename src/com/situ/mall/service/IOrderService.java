package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;

public interface IOrderService {


	List<Order> findOrder(Integer user_id);

}
