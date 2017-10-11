package com.situ.mall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.exception.NameRepeatException;
import com.situ.mall.pojo.Banji;
import com.situ.mall.pojo.Student;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

public interface IStudentService {
	List<Student> findAll();

	void deletById(int id);


	void add(Student student);

	List<Banji> findAllBanji();


	void update(Student student);

	Student selectById(int id);

	List<Student> searchByCondition(Student student);

	PageBean getPageBean(int pageIndex, int pageSize);

	PageBean<Student> searchByCondition(SearchCondition searchCondition);





}
