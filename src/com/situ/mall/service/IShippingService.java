package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Shipping;

public interface IShippingService {

	Shipping findByUserId(int id);

	List<Shipping> selectById(int id);

}
