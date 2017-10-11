package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.constant.MallConstant;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;

/**
 * 
 * 商品列表品和商品详情
 */
@Controller
@RequestMapping("/product")
public class FrontProductController {
	@Autowired
	private IProductService productService;
	
	@RequestMapping("/product_list.shtml")
	public String getProductLis(int id, Model model) {
		List<Product> list = productService.findCategoryListById(id);
		model.addAttribute("list", list);
		return "product_list";
	}
	
	
	@RequestMapping("/detail.shtml")
	public String getProductDetail(int id, Model model) {
		Product product = productService.selectById(id);
		model.addAttribute("product", product);
		
		//按照“，”分割subImages，
		String subImagesStr = product.getsub_images();
		if (null != subImagesStr && !subImagesStr.equals("")) {
			String[] subImages = subImagesStr.split(",");
			for (int i = 0; i < subImages.length; i++) {
				subImages[i] = subImages[i];
			}
			//放到域对象中s
			model.addAttribute("subImages", subImages);
		}
		
		return "product_detail";
	}
	
}