package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.LoginDao;
import com.situ.mall.dao.StudentDao;
import com.situ.mall.pojo.Student;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ILoginService;
import com.situ.mall.service.IStudentService;

@Service("loginService")
public class LoginServiceImpl implements ILoginService{
	@Resource(name="loginDao")
	private LoginDao loginDao;
	
	

	@Override
	public User getUser(User user) {
		return loginDao.getUser(user);
	}

	@Override
	public boolean addUser(User user) {
		return false;
	}

}
