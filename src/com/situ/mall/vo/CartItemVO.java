package com.situ.mall.vo;

import java.util.List;

import com.situ.mall.pojo.Product;

/**
 * 
 * ������
 */
public class CartItemVO {
	// ��Ʒ
	private Product product;

	// ����
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
