package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductDao;
import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Service("productService")
public class ProductServiceImpl implements IProductService{
	@Resource(name="productDao")
	private ProductDao productDao;
	
	
	@Override
	public List<Product> findAll() {
		return productDao.findAll();
	}

	@Override
	public PageBean<Product> getPageBean(int pageIndex, int pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = productDao.getTotalCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize); 
		pageBean.setTotalPage(totalPage);
		int index = (pageIndex - 1) * pageSize;
		List<Product> list = productDao.findPageBeanList(index, pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	
	@Override
	public PageBean<Product> searchByCondition(SearchCondition searchCondition) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(searchCondition.getPageIndex());
		System.out.println(searchCondition.getPageIndex());
		pageBean.setPageSize(searchCondition.getPageSize());
		int totalCount = productDao.getTotalCount1(searchCondition);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / searchCondition.getPageSize()); 
		pageBean.setTotalPage(totalPage);
		searchCondition.setPageIndex((searchCondition.getPageIndex() - 1) * searchCondition.getPageSize());
		List<Product> list = productDao.findPageBeanList1(searchCondition);
		pageBean.setList(list);
		return pageBean;
	}
	


	@Override
	public void deletById(int id) {
		productDao.deletById(id);
	}

	@Override
	public void add(Product product) {
		productDao.add(product);
		
	}

	@Override
	public Product selectById(int id) {
		return productDao.selectById(id);
	}

	@Override
	public void update(Product product) {
		productDao.update(product);
		
	}

	@Override
	public List<Product> searchByCondition(Product product) {
		return productDao.searchByCondition(product);
	}



	@Override
	public List<Category> findAllCategory() {
		return productDao.findAllCategory();
	}

	@Override
	public List<Product> findCategoryListById(int id) {
		return productDao.findCategoryListById(id);
	}

}
