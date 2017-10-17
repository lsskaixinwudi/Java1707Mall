package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.OrderDao;
import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IOrderService;
import com.situ.mall.vo.PageBean;

@Service("orderService")
public class OrderServiceImpl implements IOrderService{
	@Resource(name="orderDao")
	private OrderDao orderDao;
	


	@Override
	public List<Order> findOrder(Integer user_id) {
		return orderDao.findOrder(user_id);
	}



	@Override
	public PageBean getPageBean(Integer pageIndex, int pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		//private Integer pageSize;
		pageBean.setPageSize(pageSize);
		//private Integer totalCount; 
		int totalCount = orderDao.getTotalCount();
		//int totalCount = 7;
		pageBean.setTotalCount(totalCount);
		//private Integer totalPage;
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize); 
		pageBean.setTotalPage(totalPage);
		//private List<Student> list;
		int index = (pageIndex - 1) * pageSize;
		//SELECT * FROM student WHERE LIMIT 0,3;
		List<Product> list = orderDao.findPageBeanList(index, pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public void deletById(int id) {
		orderDao.deletById(id);
		
	}



	@Override
	public boolean addOrder(Order order) {
		return orderDao.addOrder(order);
	}



	@Override
	public boolean addOrderItem(OrderItem orderItem) {
		return orderDao.addOrderItem(orderItem);
	}

}
