package com.situ.mall.util;

import java.io.File;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;



public class QiniuUploadUtil {
	//��������ַ
	public static final String SERVER_ADDRES = "http://otyf1hbht.bkt.clouddn.com/";
	
	/** �������� */
	// ���ú��˺ŵ�ACCESS_KEY��SECRET_KEY
	private static final String ACCESS_KEY = "dh_G6j1gaE1HkKEFxTwvRoF04IWHn7SCQtr19den";
	private static final String SECRET_KEY = "AFckYWcBtRsKiagjnKB_WOLDMNhcZYQOlsFb3KYp";
	// Ҫ�ϴ��Ŀռ�--Ŀǰ�õĲ��Կռ�--����Ҫ�޸�
	private static final String BUCKET_NAME = "java1707mall";

	/** ָ�����浽��ţ���ļ���--ͬ���ϴ��ᱨ�� {"error":"file exists"} */
	/**
	 * {"hash":"FrQF5eX_kNsNKwgGNeJ4TbBA0Xzr","key":"aa1.jpg"} �������� keyΪ��ţ�ռ��ַ
	 * http://imagetest.i.haierzhongyou.com/aa1.jpg
	 */
	// �ϴ�����ţ�󱣴���ļ���---��ָ���Ļ�����ţ�������-�޺�׺
	// String key = "hi.jpg";

	// ��Կ����
	private static Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
	// �����ϴ�����
	private static UploadManager uploadManager = new UploadManager();

	// ���ϴ���ʹ��Ĭ�ϲ��ԣ�ֻ��Ҫ�����ϴ��Ŀռ����Ϳ�����
	private static String getUpToken() {
		return auth.uploadToken(BUCKET_NAME);
	}

	public static String upload(byte[] file) {
		try {
			// ����put�����ϴ�
			Response res = uploadManager.put(file, null, getUpToken());
			// ��ӡ���ص���Ϣ
			System.out.println(res.bodyString());
			return (String) res.jsonToMap().get("key");
		} catch (QiniuException e) {
			Response r = e.response;
			// ����ʧ��ʱ��ӡ���쳣����Ϣ
			System.out.println(r.toString());
			try {
				// ��Ӧ���ı���Ϣ
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				// ignore
			}
		}
		return "";
	}

	public static String upload(File file) {
		try {
			// ����put�����ϴ�
			Response res = uploadManager.put(file, null, getUpToken());
			// ��ӡ���ص���Ϣ
			System.out.println(res.bodyString());
			return (String) res.jsonToMap().get("key");
		} catch (QiniuException e) {
			Response r = e.response;
			// ����ʧ��ʱ��ӡ���쳣����Ϣ
			System.out.println(r.toString());
			try {
				// ��Ӧ���ı���Ϣ
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				// ignore
			}
		}
		return "";
	}
	
	/**
     * ���url��ַ
     */
    public static String getUrl(String key) {
        return SERVER_ADDRES + key;
    }
}