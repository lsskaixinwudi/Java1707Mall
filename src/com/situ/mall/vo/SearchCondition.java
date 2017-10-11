package com.situ.mall.vo;

import java.io.Serializable;

public class SearchCondition implements Serializable{
	private Integer pageIndex;
	private Integer pageSize;
	private String name;
	private String status;
	public SearchCondition() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchCondition(Integer pageIndex, Integer pageSize, String name, String status) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.name = name;
		this.status = status;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "SearchCondition [pageIndex=" + pageIndex + ", pageSize=" + pageSize + ", name=" + name + ", status="
				+ status + "]";
	}
	
	

	
}
