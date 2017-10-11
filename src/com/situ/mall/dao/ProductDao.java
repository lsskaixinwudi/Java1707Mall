package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.vo.SearchCondition;

public interface ProductDao {

	List<Product> findAll();

	int getTotalCount();

	List<Product> findPageBeanList(@Param("index")int index, @Param("pageSize")int pageSize);

	int getTotalCount1(SearchCondition searchCondition);

	List<Product> findPageBeanList1(SearchCondition searchCondition);

	void deletById(int id);

	void add(Product product);

	Product selectById(int id);

	void update(Product product);

	List<Product> searchByCondition(Product product);

	List<Category> findAllCategory();

	List<Product> findCategoryListById(int id);

}
