package com.situ.mall.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.situ.mall.pojo.Banji;
import com.situ.mall.pojo.Student;

public class PageBean<T> implements Serializable{
	 // 当前�??
    private Integer pageIndex;
    // 当前页显示的条数
    private Integer pageSize;
    // 总条�??
    private Integer totalCount;
    // 总页�??
    private Integer totalPage;
    // 当前页要显示的数�??
    private List<T> list = (List<T>) new ArrayList<Student>();

	
    public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	

}
