package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Product;

public interface OrderDao {



	List<Order> findOrder(Integer user_id);

	int getTotalCount();

	void deletById(int id);

	List<Product> findPageBeanList(@Param("index")int index, @Param("pageSize")int pageSize);

	boolean addOrder(Order order);

	boolean addOrderItem(OrderItem orderItem);

}
