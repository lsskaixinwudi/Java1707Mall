package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.Order;

public interface OrderDao {



	List<Order> findOrder(Integer user_id);

}
