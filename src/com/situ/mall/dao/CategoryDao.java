package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Student;
import com.situ.mall.vo.SearchCondition;

public interface CategoryDao {

	List<Category> findAll();

	int getTotalCount();

	
	List<Category> findPageBeanList(@Param("index")int index, @Param("pageSize")int pageSize);

	int getTotalCount1(SearchCondition searchCondition);

	List<Category> findPageBeanList1(SearchCondition searchCondition);

	void add(Category category);

	void update(Category category);

	Category selectById(int id);

	List<Category> searchByCondition(Category category);

	void deletById(int id);

	List<Category> findParentCategory();

	List<Category> findCategory(int parent_id);


	List<Category> findCategory1();

	List<Category> findCategory2();

}
