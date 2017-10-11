package com.situ.mall.pojo;

import java.io.Serializable;
import java.util.Date;

public class Student implements Serializable {

	private Integer id;
	private String name;
	private Integer age;
	private String gender;
	private String address;
	private Banji banji;

	public Student() {
		super();
	}



	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	

	public Banji getBanji() {
		return banji;
	}






	public Student(Integer id, String name, Integer age, String gender, String address, Banji banji) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.banji = banji;
	}






	public void setBanji(Banji banji) {
		this.banji = banji;
	}






	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + ", gender=" + gender + ", address=" + address
				+ ", banji=" + banji + "]";
	}
	

	

}
