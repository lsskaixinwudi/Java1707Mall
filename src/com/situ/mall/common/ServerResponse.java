package com.situ.mall.common;

import java.io.Serializable;

public class ServerResponse<T> implements Serializable {
	
	private Integer status;
	
	private String msg;
	
	private T data;
	
	//����ǰ̨�ɹ�״̬
	public static <T> ServerResponse<T> createSuccess() {
		return new ServerResponse<T>(ResponeCode.SUCCESS.getCode());
	}
	//����ǰ̨�ɹ�״̬����Ϣ
	public static <T> ServerResponse<T> createSuccess(String msg) {
		return new ServerResponse<T>(ResponeCode.SUCCESS.getCode(),msg);
	}
	//����ǰ̨�ɹ�״̬����Ϣ��������
	public static <T> ServerResponse<T> createSuccess(String msg, T data) {
		return new ServerResponse<T>(ResponeCode.SUCCESS.getCode(),msg,data); 
	}
	//����ǰ̨����״̬������
	public static <T> ServerResponse<T> createSuccess( T data) {
		return new ServerResponse<T>(ResponeCode.SUCCESS.getCode(),data); 
	}
	
	//����ǰ̨ʧ�ܵ�״̬
	public static <T> ServerResponse<T> createError() {
		return new ServerResponse<T>(ResponeCode.ERROR.getCode());
	}
	//����ǰ̨ʧ�ܵ�״̬����Ϣ
	public static <T> ServerResponse<T> createError(String msg) {
		return new ServerResponse<T>(ResponeCode.ERROR.getCode(),msg);
	}
	//����ǰ̨ʧ�ܵ�״̬����Ϣ��������
	public static <T> ServerResponse<T> createError(String msg, T data) {
		return new ServerResponse<T>(ResponeCode.ERROR.getCode(),msg,data); 
	}
	//����ǰ̨ʧ�ܵ�״̬������
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