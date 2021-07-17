package com.sjdang.util;

import java.util.UUID;

import org.apache.commons.lang.StringUtils;

/**
* @Package com.sjdang.util.UtilString
* @Description: TODO(字符串处理工具类)  
* @author SJDANG
* @date 2018-03-21 22:38
* @version V1.0  
*/
public class UtilString {
	
	/**  
	* @Description: TODO(截取文件名后缀，如:.JPG)
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
	* @Description: TODO(通过原始文件名生成随机文件名)  
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
