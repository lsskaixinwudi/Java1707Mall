package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.User;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

public interface ICategoryService {

	List<Category> findAll();


	PageBean<Category> getPageBean(int pageIndex, int pageSize);


	PageBean<Category> searchByCondition(SearchCondition searchCondition);


	void deletById(int id);


	void add(Category category);


	Category selectById(int id);


	void update(Category category);


	List<Category> searchByCondition(Category category);


	List<Category> findParentCategory();


	List<Category> findCategory(int parent_id);





	List<Category> findCategory1();


	List<Category> findCategory2();


	User getUser(User user);

}
