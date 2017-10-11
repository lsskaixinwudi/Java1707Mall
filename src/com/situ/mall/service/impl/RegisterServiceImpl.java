package com.situ.mall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.RegisterDao;
import com.situ.mall.pojo.User;
import com.situ.mall.service.IRegisterService;
@Service("registerService")
public class RegisterServiceImpl implements IRegisterService{

	@Resource(name="registerDao")
	private RegisterDao registerDao;
	
	@Override
	public boolean add(User user) {
		return registerDao.add(user);
	}

}
