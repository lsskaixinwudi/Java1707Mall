package com.situ.mall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.CategoryDao;
import com.situ.mall.dao.ShippingDao;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.IShippingService;

@Service("shippingService")
public class ShippingServiceImpl implements IShippingService{
	@Resource(name="shippingDao")
	private ShippingDao shippingDao;
	
	@Override
	public Shipping findByUserId(int id) {
		return shippingDao.findByUserId(id);
	}

}
