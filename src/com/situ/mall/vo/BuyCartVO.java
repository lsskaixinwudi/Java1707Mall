package com.situ.mall.vo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.junit.validator.PublicClassValidator;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 购物车
 *
 */
public class BuyCartVO {
	// 购物项集合
	private List<CartItemVO> items = new ArrayList<CartItemVO>();

	// 继续购物，最后一次产品的id
	private Integer product_id;
	
	public void addItem(CartItemVO cartItemVO) {
		boolean isExist = false;
		//1.这件商品原来在购物车里面有，我们只需要更新购买数量
		for (CartItemVO item : items) {
			if (item.getProduct().getId() == cartItemVO.getProduct().getId()) {
				isExist = true;
				int amount = item.getAmount() + cartItemVO.getAmount();
				//购买这件商品的总数量应该<=product.stock
				if (amount <= cartItemVO.getProduct().getStock()) {
					item.setAmount(amount);
				} else {
					//超出购买限制，最大只能购买这件商品的最大库存
					item.setAmount(item.getProduct().getStock());
				}
				break;
			}
		}
		//2.这件商品原来没有加入购物车,加入购物车
		if (isExist == false) {
			items.add(cartItemVO);
		}
	}
	
	public void delItems(Integer product_id) {
		Iterator<CartItemVO> iterator = items.iterator();
		while (iterator.hasNext()) {
			CartItemVO cartItemVO = (CartItemVO) iterator.next();
			if (cartItemVO.getProduct().getId() == product_id) {
				iterator.remove();
			}
		}

	}
	
	
	
	@JsonIgnore
	public double getTotalPrice() {
		Double totalPrice = 0.0;
		for (CartItemVO item : items) {
			totalPrice += item.getAmount() * item.getProduct().getPrice().doubleValue();
		}
		return totalPrice;
	}

	public List<CartItemVO> getItems() {
		return items;
	}

	public void setItems(List<CartItemVO> items) {
		this.items = items;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProductId(Integer product_id) {
		this.product_id = product_id;
	}

	@Override
	public String toString() {
		return "BuyCartVO [items=" + items + ", product_id=" + product_id + "]";
	}

	

}