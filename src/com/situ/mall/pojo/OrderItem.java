package com.situ.mall.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class OrderItem implements Serializable{

	private Integer id;

	private BigDecimal orderNo;

	private Integer productId;

	private String productName;

	private String productImage;

	private Double currentUnitPrice;

	private Integer quantity;

	private Integer totalPrice;

	private Date createTime;

	private Date updateTime;

	private Integer userId;

	public OrderItem() {
		super();
	}



	public OrderItem(Integer id, BigDecimal orderNo, Integer productId, String productName, String productImage,
			Double currentUnitPrice, Integer quantity, Integer totalPrice, Date createTime, Date updateTime,
			Integer userId) {
		super();
		this.id = id;
		this.orderNo = orderNo;
		this.productId = productId;
		this.productName = productName;
		this.productImage = productImage;
		this.currentUnitPrice = currentUnitPrice;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.userId = userId;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BigDecimal getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(BigDecimal orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}



	public Double getCurrentUnitPrice() {
		return currentUnitPrice;
	}



	public void setCurrentUnitPrice(Double currentUnitPrice) {
		this.currentUnitPrice = currentUnitPrice;
	}



	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", orderNo=" + orderNo + ", productId=" + productId + ", productName="
				+ productName + ", productImage=" + productImage + ", currentUnitPrice=" + currentUnitPrice
				+ ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + ", userId=" + userId + "]";
	}
	
	
}
