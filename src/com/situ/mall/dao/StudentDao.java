package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Banji;
import com.situ.mall.pojo.Student;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

public interface StudentDao {
	List<Student> findAll();

	void deletById(int id);

	void add(Student student);

	List<Banji> findAllBanji();

	Student selectById(int id);

	void update(Student student);

	List<Student> searchByCondition(Student student);

	int getTotalCount();

	List<Student> findPageBeanList(@Param("index")int index, @Param("pageSize")int pageSize);

	int getTotalCount1(SearchCondition searchCondition);

	List<Student> findPageBeanList1(SearchCondition searchCondition);

	


	
}
