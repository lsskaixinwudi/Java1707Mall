package com.situ.mall.service;

import java.util.List;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Student;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

public interface IProductService {

	List<Product> findAll();


	void deletById(int id);

	PageBean<Product> searchByCondition(SearchCondition searchCondition);

	List<Category> findAllCategory();

	Product selectById(int id);



	List<Product> searchByCondition(Product product);

	void update(Product product);

	void add(Product product);

	PageBean<Product> getPageBean(int pageIndex, int pageSize);




	List<Product> findCategoryListById(int id);


	ServerResponse show(Integer id);





}
