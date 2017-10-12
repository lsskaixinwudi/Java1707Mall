package com.situ.mall.vo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.junit.validator.PublicClassValidator;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * ���ﳵ
 *
 */
public class BuyCartVO {
	// �������
	private List<CartItemVO> items = new ArrayList<CartItemVO>();

	// ����������һ�β�Ʒ��id
	private Integer product_id;
	
	public void addItem(CartItemVO cartItemVO) {
		boolean isExist = false;
		//1.�����Ʒԭ���ڹ��ﳵ�����У�����ֻ��Ҫ���¹�������
		for (CartItemVO item : items) {
			if (item.getProduct().getId() == cartItemVO.getProduct().getId()) {
				isExist = true;
				int amount = item.getAmount() + cartItemVO.getAmount();
				//���������Ʒ��������Ӧ��<=product.stock
				if (amount <= cartItemVO.getProduct().getStock()) {
					item.setAmount(amount);
				} else {
					//�����������ƣ����ֻ�ܹ��������Ʒ�������
					item.setAmount(item.getProduct().getStock());
				}
				break;
			}
		}
		//2.�����Ʒԭ��û�м��빺�ﳵ,���빺�ﳵ
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