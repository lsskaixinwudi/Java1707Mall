package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;

public interface ShippingDao {

	Shipping findByUserId(int id);

	List<Shipping> selectById(int id);

	int getTotalCount();

	List<Product> findPageBeanList(@Param("index")int index, @Param("pageSize")int pageSize);

	void deletById(int id);

	boolean add(Shipping shipping);

}
