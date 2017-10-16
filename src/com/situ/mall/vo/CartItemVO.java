package com.situ.mall.vo;

import java.util.List;

import com.situ.mall.pojo.Product;

/**
 * 
 * 购物项
 */
public class CartItemVO {
	// 商品
	private Product product;

	// 数量
	private Integer amount;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "CartItem [product=" + product + ", amount=" + amount + "]";
	}

	public List<CartItemVO> getItemsList() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setItemsList(List<CartItemVO> cartItemsList) {
		// TODO Auto-generated method stub
		
	}

}
