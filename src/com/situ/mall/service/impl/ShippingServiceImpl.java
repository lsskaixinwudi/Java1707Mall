package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.CategoryDao;
import com.situ.mall.dao.ShippingDao;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.IShippingService;
import com.situ.mall.vo.PageBean;

@Service("shippingService")
public class ShippingServiceImpl implements IShippingService{
	@Resource(name="shippingDao")
	private ShippingDao shippingDao;
	
	@Override
	public Shipping findByUserId(int id) {
		return shippingDao.findByUserId(id);
	}

	@Override
	public List<Shipping> selectById(int id) {
		return shippingDao.selectById(id);
	}

	@Override
	public PageBean getPageBean(Integer pageIndex, int pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		//姣忎竴椤垫湁澶氬皯鏉℃暟鎹�
		//private Integer pageSize;
		pageBean.setPageSize(pageSize);
		//鏁版嵁搴撲腑涓�鍏辨湁澶氬皯鏉¤褰�
		//private Integer totalCount; 
		int totalCount = shippingDao.getTotalCount();
		// TODO 鍏蜂綋瀹炵幇杩欎釜鏂规硶鑰屼笉鏄啓姝� 
		//int totalCount = 7;
		pageBean.setTotalCount(totalCount);
		// 涓�鍏辨湁澶氬皯椤�
		//private Integer totalPage;
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize); 
		pageBean.setTotalPage(totalPage);
		// 褰撳墠椤电殑鏁版嵁
		//private List<Student> list;
		int index = (pageIndex - 1) * pageSize;
		//SELECT * FROM student WHERE LIMIT 0,3;
		List<Product> list = shippingDao.findPageBeanList(index, pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public void deletById(int id) {
		shippingDao.deletById(id);
		
	}

	@Override
	public boolean add(Shipping shipping) {
		return shippingDao.add(shipping);
	}

}
