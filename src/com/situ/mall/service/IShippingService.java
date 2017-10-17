package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Shipping;
import com.situ.mall.vo.PageBean;

public interface IShippingService {

	Shipping findByUserId(int id);

	List<Shipping> selectById(int id);

	PageBean getPageBean(Integer pageIndex, int pageSize);

	void deletById(int id);

	boolean add(Shipping shipping);

}
