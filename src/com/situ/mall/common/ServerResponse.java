package com.situ.mall.common;

import java.io.Serializable;

public class ServerResponse<T> implements Serializable {
	
	private Integer status;
	
	private String msg;
	
	private T data;
	
	//告诉前台成功状态
	public static <T> ServerResponse<T> createSuccess() {
		return new ServerResponse<T>(ResponeCode.SUCCESS.getCode());
	}
	//告诉前台成功状态和信息
	public static <T> ServerResponse<T> createSuccess(String msg) {
		return new ServerResponse<T>(ResponeCode.SUCCESS.getCode(),msg);
	}
	//告诉前台成功状态、信息、和数据
	public static <T> ServerResponse<T> createSuccess(String msg, T data) {
		return new ServerResponse<T>(ResponeCode.SUCCESS.getCode(),msg,data); 
	}
	//告诉前台更改状态和数据
	public static <T> ServerResponse<T> createSuccess( T data) {
		return new ServerResponse<T>(ResponeCode.SUCCESS.getCode(),data); 
	}
	
	//告诉前台失败的状态
	public static <T> ServerResponse<T> createError() {
		return new ServerResponse<T>(ResponeCode.ERROR.getCode());
	}
	//告诉前台失败的状态和信息
	public static <T> ServerResponse<T> createError(String msg) {
		return new ServerResponse<T>(ResponeCode.ERROR.getCode(),msg);
	}
	//告诉前台失败的状态、信息、和数据
	public static <T> ServerResponse<T> createError(String msg, T data) {
		return new ServerResponse<T>(ResponeCode.ERROR.getCode(),msg,data); 
	}
	//告诉前台失败的状态和数据
	public static <T> ServerResponse<T> createError( T data) {
		return new ServerResponse<T>(ResponeCode.ERROR.getCode(),data); 
	}
	public ServerResponse() {
		super();
	}



	public ServerResponse(Integer status) {
		super();
		this.status = status;
	}



	public ServerResponse(Integer status, T data) {
		super();
		this.status = status;
		this.data = data;
	}



	public ServerResponse(Integer status, String msg) {
		super();
		this.status = status;
		this.msg = msg;
	}



	public ServerResponse(Integer status, String msg, T data) {
		super();
		this.status = status;
		this.msg = msg;
		this.data = data;
	}



	public Integer getStatus() {
		return status;
	}



	public void setStatus(Integer status) {
		this.status = status;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}



	public T getData() {
		return data;
	}



	public void setData(T data) {
		this.data = data;
	}



	@Override
	public String toString() {
		return "ServletRespone [status=" + status + ", msg=" + msg + ", data=" + data + "]";
	}
	
	
	
}