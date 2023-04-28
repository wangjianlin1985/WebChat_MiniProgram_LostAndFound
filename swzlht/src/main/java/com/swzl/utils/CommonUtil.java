package com.swzl.utils;

import java.security.MessageDigest;
import java.util.UUID;

/**
 * 工具类
 */
public class CommonUtil {
	
	/**
	 * 生成 ID
	 * @return
	 */
	public static String id(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	 * 字符串MD5加密
	 * @param string
	 * @return
	 */
	public final static String md5password(String string) {
		char hexDigits[] = { '0', '1', '2', '3', 
				'4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };
		try {
			byte[] btInput = string.getBytes("utf-8");
			// 获得MD5摘要算法�?? MessageDigest 对象
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// 使用指定的字节更新摘�??
			mdInst.update(btInput);
			// 获得密文
			byte[] md = mdInst.digest();
			// 把密文转换成十六进制的字符串形式
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
