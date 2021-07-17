package com.sjdang.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import org.apache.log4j.Logger;

/**
 * @ClassName: com.sjdang.util.UtilMd5
 * @Description: TODO(MD5加密算法工具类)
 * @author SJDANG
 * @date 2018年2月14日 下午9:36:30
 * @version V1.0
 */
public class UtilMd5 {
	
	private static Logger logger = Logger.getLogger(UtilMd5.class.getName());
	
	/** 
	* @Title: encryptByMD5 
	* @Description: TODO(用MD5加密算法加密字符串,字符串中每个字符转换为对应的ASCII值后逐个加密) 
	* @param str
	* @return String
	* @date 2017年6月20日 下午4:26:25  
	*/
	public static String encryptByMD5(String str) {
	    StringBuffer md5Code = new StringBuffer();
	    try {
	        MessageDigest md5 = MessageDigest.getInstance("MD5");
	        byte[] digest = md5.digest(str.getBytes());
	        for (byte b : digest) {
	            String hexString = Integer.toHexString(b & 0xff);
	            if (hexString.length() < 2) {
	                hexString = "0"+hexString;
	            }
	            md5Code = md5Code.append(b);
	        }
	    } catch (NoSuchAlgorithmException e) {
	    	logger.error("NoSuchAlgorithmException:", e);
	        return "";
	    }
	    return md5Code.toString();
	}
	
	/** 
	* @Title: encoderByMD5 
	* @Description: TODO(用MD5加密算法加密字符串,字符串转化为BASE64后直接加密) 
	* @param str
	* @return String
	* @date 2017年6月20日 下午4:50:03  
	*/
	public static String encoderByMD5(String str){
		String md5Code = "";  
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			Base64.Encoder encoder = Base64.getEncoder();
			md5Code = encoder.encodeToString(md5.digest(str.getBytes("utf-8")));
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			logger.error("NoSuchAlgorithmException:", e);
			return "";
		}
	    return md5Code;
	}
	
	public static void main(String[] args){
		String str = "admin1234";
		System.out.println(encoderByMD5(str));
	}

}
