package com.sjdang.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.log4j.Logger;

/**
* @Package com.sjdang.util.UtilProperties
* @Description: TODO(Properties属性文件解析工具类)  
* @author SJDANG
* @date 2018-03-21 22:35
* @version V1.0  
*/
public class UtilProperties {
	
	private static Logger logger = Logger.getLogger(UtilProperties.class.getName());
	
	/**  
	* @Description: TODO(将KEY-VALUE键值对封装为Map对象)  
	* @param propertiesFilename
	* @return Map<String,String>
	*/
	public static Map<String, String> getKeyAndValue(String propertiesFilename) {
		Map<String, String> map = new HashMap<String, String>();
		Properties p = new Properties();
		try {
			InputStream inStream = UtilProperties.class.getClassLoader().getResourceAsStream("com/resources/" + propertiesFilename);
			BufferedReader bf = new BufferedReader(new InputStreamReader(inStream, "UTF-8"));
			p.load(bf);
			Set<Object> keySet = p.keySet();
			for (Iterator<Object> it = keySet.iterator(); it.hasNext();) {
				String key = (String) it.next();
				String value = p.getProperty(key);
				map.put(key, value);
			}
			bf.close();
			inStream.close();
		} catch (UnsupportedEncodingException e) {
			logger.error(e);
		} catch (IOException e) {
			logger.error(e);
		}
		return map;
	}
	
	/**
	 * @Description: TODO(获取单个KEY对应的VALUE) 
	 * @param propertiesFilename
	 * @param key
	 * @return String
	 */
	public static String getValueByKey(String propertiesFilename, String key) {
		Map<String, String> map = getKeyAndValue(propertiesFilename);
		if (map.containsKey(key)) {
			return map.get(key);
		}
		return null;
	}
	
	private static UtilProperties single = null;

	public static UtilProperties getInstance() {
		if (single == null) {
			single = new UtilProperties();
		}
		return single;
	}

}
