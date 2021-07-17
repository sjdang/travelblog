package com.sjdang.util;

import java.util.UUID;

import org.apache.commons.lang.StringUtils;

/**
* @Package com.sjdang.util.UtilString
* @Description: TODO(�ַ�����������)  
* @author SJDANG
* @date 2018-03-21 22:38
* @version V1.0  
*/
public class UtilString {
	
	/**  
	* @Description: TODO(��ȡ�ļ�����׺����:.JPG)
	* @param fileName
	* @return String
	*/
	public static String getSuffixOfFile(String fileName) {
		if (!StringUtils.contains(fileName, ".")) {
			return null;
		}
		return fileName.substring(fileName.lastIndexOf("."));
	}
	
	/**  
	* @Description: TODO(ͨ��ԭʼ�ļ�����������ļ���)  
	* @param fileName
	* @return String
	*/
	public static String getRandomFileName(String fileName) {
		String suffix = getSuffixOfFile(fileName);
		if (StringUtils.isEmpty(suffix)) {
			return null;
		}
		return UUID.randomUUID() + suffix;
	}

}
