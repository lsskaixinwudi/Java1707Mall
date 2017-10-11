package com.situ.mall.pojo;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class PageBean<T> implements Serializable{

	//��ǰҳ
	private Integer pageIndex;
	
	//��ǰҳ��ʾ������
	private Integer pageSize;
	
	//������
	private Integer totalCount;
	
	//��ҳ��
	private Integer totalPage;
	
	//��ǰҳҪ��ʾ������
	private List<T> list;

	public PageBean() {
		super();
	}

	public PageBean(Integer pageIndex, Integer pageSize, Integer totalCount, Integer totalPage, List<T> list) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.list = list;
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

	@Override
	public String toString() {
		return "PageBean [pageIndex=" + pageIndex + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", list=" + list + "]";
	}
	
	
}
