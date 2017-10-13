package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.CategoryDao;
import com.situ.mall.dao.StudentDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Student;
import com.situ.mall.pojo.User;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.IStudentService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService{
	@Resource(name="categoryDao")
	private CategoryDao categoryDao;
	
	@Override
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	@Override
	public PageBean<Category> getPageBean(int pageIndex, int pageSize) {
		PageBean<Category> pageBean = new PageBean<Category>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = categoryDao.getTotalCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize); 
		pageBean.setTotalPage(totalPage);
		int index = (pageIndex - 1) * pageSize;
		List<Category> list = categoryDao.findPageBeanList(index, pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	
	@Override
	public PageBean<Category> searchByCondition(SearchCondition searchCondition) {
		PageBean<Category> pageBean = new PageBean<Category>();
		pageBean.setPageIndex(searchCondition.getPageIndex());
		System.out.println(searchCondition.getPageIndex());
		pageBean.setPageSize(searchCondition.getPageSize());
		int totalCount = categoryDao.getTotalCount1(searchCondition);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / searchCondition.getPageSize()); 
		pageBean.setTotalPage(totalPage);
		searchCondition.setPageIndex((searchCondition.getPageIndex() - 1) * searchCondition.getPageSize());
		List<Category> list = categoryDao.findPageBeanList1(searchCondition);
		pageBean.setList(list);
		return pageBean;
	}
	


	@Override
	public void deletById(int id) {
		categoryDao.deletById(id);
	}

	@Override
	public void add(Category category) {
		categoryDao.add(category);
		
	}

	@Override
	public Category selectById(int id) {
		return categoryDao.selectById(id);
	}

	@Override
	public void update(Category category) {
		categoryDao.update(category);
		
	}

	@Override
	public List<Category> searchByCondition(Category category) {
		return categoryDao.searchByCondition(category);
	}

	@Override
	public List<Category> findParentCategory() {
		return	categoryDao.findParentCategory();
		 
	}

	@Override
	public List<Category> findCategory(int parent_id) {
		return	categoryDao.findCategory(parent_id);
	}

	@Override
	public List<Category> findCategory1() {
		
		return categoryDao.findCategory1();
	}

	@Override
	public List<Category> findCategory2() {
		return categoryDao.findCategory2();
	}

	@Override
	public User getUser(User user) {
		return categoryDao.getUser(user);
	}

	

}
