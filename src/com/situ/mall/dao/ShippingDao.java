package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.Shipping;

public interface ShippingDao {

	Shipping findByUserId(int id);

	List<Shipping> selectById(int id);

}
