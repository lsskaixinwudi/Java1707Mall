package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.dao.StudentDao;
import com.situ.mall.exception.NameRepeatException;
import com.situ.mall.pojo.Banji;
import com.situ.mall.pojo.Student;
import com.situ.mall.service.IStudentService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Service("studentService")
public class StudentServiceImpl implements IStudentService{
	@Resource(name="studentDao")
	private StudentDao studentDao;
	
	@Override
	public List<Student> findAll() {
		return studentDao.findAll();
	}

	@Override
	public void deletById(int id) {
		studentDao.deletById(id);
	}

	@Override
	public void add(Student student) {
		studentDao.add(student);

	}

	@Override
	public List<Banji> findAllBanji() {
		return studentDao.findAllBanji();
	}

	@Override
	public Student selectById(int id) {
		
		return studentDao.selectById(id);
	}

	@Override
	public void update(Student student) {
		studentDao.update(student);
	}


	/*@Override
	public List<Student> pageList(int index, int pageSize) {
		return null;
	}

	@Override
	public PageBean<Student> getPageBean(int pageIndex, int pageSize) {
		PageBean<Student> pageBean = new PageBean<Student>();
		pageBean.setPageIndex(pageIndex);
		//private Integer pageSize;
		pageBean.setPageSize(pageSize);
		//private Integer totalCount; 
		int totalCount = studentDao.getTotalCount();
		//int totalCount = 7;
		pageBean.setTotalCount(totalCount);
		//private Integer totalPage;
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize); 
		pageBean.setTotalPage(totalPage);
		//private List<Student> list;
		int index = (pageIndex - 1) * pageSize;
		//SELECT * FROM student WHERE LIMIT 0,3;
		List<Student> list = studentDao.findPageBeanList(index, pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public PageBean<Student> searchByCondition(SearchCondition searchCondition) {
		PageBean<Student> pageBean = new PageBean<Student>();
		pageBean.setPageIndex(searchCondition.getPageIndex());
		System.out.println(searchCondition.getPageIndex());
		pageBean.setPageSize(searchCondition.getPageSize());
		int totalCount = studentDao.getTotalCount(searchCondition);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / searchCondition.getPageSize()); 
		pageBean.setTotalPage(totalPage);
		searchCondition.setPageIndex((searchCondition.getPageIndex() - 1) * searchCondition.getPageSize());
		List<Student> list = studentDao.findPageBeanList(searchCondition);
		pageBean.setList(list);
		return pageBean;
	}*/

	@Override
	public List<Student> searchByCondition(Student student) {
		return studentDao.searchByCondition(student);
	}

	@Override
	public PageBean<Student> getPageBean(int pageIndex, int pageSize) {
		PageBean<Student> pageBean = new PageBean<Student>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = studentDao.getTotalCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize); 
		pageBean.setTotalPage(totalPage);
		int index = (pageIndex - 1) * pageSize;
		List<Student> list = studentDao.findPageBeanList(index, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean<Student> searchByCondition(SearchCondition searchCondition) {
		PageBean<Student> pageBean = new PageBean<Student>();
		pageBean.setPageIndex(searchCondition.getPageIndex());
		System.out.println(searchCondition.getPageIndex());
		pageBean.setPageSize(searchCondition.getPageSize());
		int totalCount = studentDao.getTotalCount1(searchCondition);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / searchCondition.getPageSize()); 
		pageBean.setTotalPage(totalPage);
		searchCondition.setPageIndex((searchCondition.getPageIndex() - 1) * searchCondition.getPageSize());
		List<Student> list = studentDao.findPageBeanList1(searchCondition);
		pageBean.setList(list);
		return pageBean;
	}

	

	
	

	


}
