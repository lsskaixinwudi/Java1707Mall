package com.situ.mall.pojo;

import java.math.BigDecimal;
import java.util.Date;

import com.situ.mall.constant.MallConstant;
import com.situ.mall.util.QiniuUploadUtil;

public class Product {
	//商品id
    private Integer id;
    //分类id,对应category表的主键
    private Integer category_id;

    private String name;

    private String subtitle;

    private String main_image;

    private String sub_images;

    private String detail;

    private BigDecimal price;

    private Integer stock;

    private Integer status;

    private Date create_time;

    private Date update_time;
    
    public String getFullUrl() {
		return MallConstant.SERVER_ADDRES + main_image;
	}

    public Product(Integer id, Integer category_id, String name, String subtitle, String main_image, String sub_images, String detail, BigDecimal price, Integer stock, Integer status, Date create_time, Date update_time) {
        this.id = id;
        this.category_id = category_id;
        this.name = name;
        this.subtitle = subtitle;
        this.main_image = main_image;
        this.sub_images = sub_images;
        this.detail = detail;
        this.price = price;
        this.stock = stock;
        this.status = status;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    public Product(Integer category_id, String name, String subtitle, String main_image, String sub_images, String detail,
			BigDecimal price, Integer stock, Integer status, Date create_time, Date update_time) {
		super();
		this.category_id = category_id;
		this.name = name;
		this.subtitle = subtitle;
		this.main_image = main_image;
		this.sub_images = sub_images;
		this.detail = detail;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.create_time = create_time;
		this.update_time = update_time;
	}



	public Product() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getcategory_id() {
        return category_id;
    }

    public void setcategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = (subtitle == null ? null : subtitle.trim());
    }

    public String getmain_image() {
        return main_image;
    }

    public void setmain_image(String main_image) {
        this.main_image = main_image == null ? null : main_image.trim();
    }

    public String getsub_images() {
        return sub_images;
    }

    public void setsub_images(String sub_images) {
        this.sub_images = sub_images == null ? null : sub_images.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getcreate_time() {
        return create_time;
    }

    public void setcreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getupdate_time() {
        return update_time;
    }

    public void setupdate_time(Date update_time) {
        this.update_time = update_time;
    }

	@Override
	public String toString() {
		return "Product [id=" + id + ", category_id=" + category_id + ", name=" + name + ", subtitle=" + subtitle
				+ ", main_image=" + main_image + ", sub_images=" + sub_images + ", detail=" + detail + ", price=" + price
				+ ", stock=" + stock + ", status=" + status + ", create_time=" + create_time + ", update_time="
				+ update_time + "]";
	}
    
}