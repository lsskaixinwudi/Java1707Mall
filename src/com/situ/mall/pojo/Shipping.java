package com.situ.mall.pojo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Shipping implements Serializable{

	private Integer id;

    private Integer user_id;

    private String receiver_name;

    private String receiver_phone;

    private String receiver_mobile;

    private String receiver_province;

    private String receiver_city;

    private String receiver_district;

    private String receiver_address;

    private String receiver_zip;

    private Date create_time;

    private Date update_time;

	public Shipping() {
		super();
	}

	public Shipping(Integer id, Integer user_id, String receiver_name, String receiver_phone, String receiver_mobile,
			String receiver_province, String receiver_city, String receiver_district, String receiver_address,
			String receiver_zip, Date create_time, Date update_time) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.receiver_name = receiver_name;
		this.receiver_phone = receiver_phone;
		this.receiver_mobile = receiver_mobile;
		this.receiver_province = receiver_province;
		this.receiver_city = receiver_city;
		this.receiver_district = receiver_district;
		this.receiver_address = receiver_address;
		this.receiver_zip = receiver_zip;
		this.create_time = create_time;
		this.update_time = update_time;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getuser_id() {
		return user_id;
	}

	public void setuser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getreceiver_name() {
		return receiver_name;
	}

	public void setreceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getreceiver_phone() {
		return receiver_phone;
	}

	public void setreceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}

	public String getreceiver_mobile() {
		return receiver_mobile;
	}

	public void setreceiver_mobile(String receiver_mobile) {
		this.receiver_mobile = receiver_mobile;
	}

	public String getreceiver_province() {
		return receiver_province;
	}

	public void setreceiver_province(String receiver_province) {
		this.receiver_province = receiver_province;
	}

	public String getreceiver_city() {
		return receiver_city;
	}

	public void setreceiver_city(String receiver_city) {
		this.receiver_city = receiver_city;
	}

	public String getreceiver_district() {
		return receiver_district;
	}

	public void setreceiver_district(String receiver_district) {
		this.receiver_district = receiver_district;
	}

	public String getreceiver_address() {
		return receiver_address;
	}

	public void setreceiver_address(String receiver_address) {
		this.receiver_address = receiver_address;
	}

	public String getreceiver_zip() {
		return receiver_zip;
	}

	public void setreceiver_zip(String receiver_zip) {
		this.receiver_zip = receiver_zip;
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
		return "Shipping [id=" + id + ", user_id=" + user_id + ", receiver_name=" + receiver_name + ", receiver_phone="
				+ receiver_phone + ", receiver_mobile=" + receiver_mobile + ", receiver_province=" + receiver_province
				+ ", receiver_city=" + receiver_city + ", receiver_district=" + receiver_district + ", receiver_address="
				+ receiver_address + ", receiver_zip=" + receiver_zip + ", create_time=" + create_time + ", update_time="
				+ update_time + "]";
	}
    
    
}
