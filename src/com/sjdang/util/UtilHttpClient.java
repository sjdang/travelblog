package com.sjdang.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

/**
* @Package com.sjdang.util.UtilHttpClient
* @Description: TODO(HttpClient请求工具类)  
* @author SJDANG
* @date 2018-03-21 22:46
* @version V1.0  
*/
public class UtilHttpClient {
	
	private static Logger logger = Logger.getLogger(UtilHttpClient.class.getName());
	
	/**  
	* @Description: TODO(通过HttpClient进行POST请求)  
	* @param url
	* @param params
	* @return String
	*/  
	public static String post(String url, Map<String, String> params) {
        CloseableHttpClient httpClient = HttpClients.createDefault();  
        HttpPost httpPost = new HttpPost(url);  
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		Set<String> keys = params.keySet();
		for (String key : keys) {
			nvps.add(new BasicNameValuePair(key, params.get(key)));
		}
        String body = "";
        try {  
        	UrlEncodedFormEntity urlEntity = new UrlEncodedFormEntity(nvps, "UTF-8");  
            httpPost.setEntity(urlEntity);  
            CloseableHttpResponse response = httpClient.execute(httpPost);  
            try {  
                HttpEntity entity = response.getEntity();  
                if (entity != null) {  
                	body = EntityUtils.toString(entity, "UTF-8");
                }  
            } finally {  
                response.close();  
            }  
        } catch (ClientProtocolException e) {  
        	logger.error(e.getMessage());
        } catch (UnsupportedEncodingException e) {  
        	logger.error(e.getMessage());
        } catch (IOException e) {  
        	logger.error(e.getMessage());
        } finally {  
            try {  
            	httpClient.close();  
            } catch (IOException e) {  
            	logger.error(e.getMessage());
            }  
        }
        return body;
	}
	
	/**  
	* @Description: TODO(通过HttpClient进行GET请求)  
	* @param url
	* @param params
	* @return String
	*/  
	public static String get(String url, Map<String, String> params) {
        CloseableHttpClient httpClient = HttpClients.createDefault();  
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		Set<String> keys = params.keySet();
		for (String key : keys) {
			nvps.add(new BasicNameValuePair(key, params.get(key)));
		}
        String body = "";
        try {
        	String paramStr = EntityUtils.toString(new UrlEncodedFormEntity(nvps, "UTF-8")); 
			HttpGet httpGet = new HttpGet(url + "?" + paramStr);  
            CloseableHttpResponse response = httpClient.execute(httpGet);  
            try {  
                HttpEntity entity = response.getEntity();  
                if (entity != null) {  
                	body = EntityUtils.toString(entity, "UTF-8");
                }  
            } finally {  
                response.close();
            }  
        } catch (ClientProtocolException e) {  
        	logger.error(e.getMessage());
        } catch (IOException e) {  
        	logger.error(e.getMessage());
        } finally {  
            try {  
            	httpClient.close();  
            } catch (IOException e) {  
            	logger.error(e.getMessage());
            }  
        }  
        return body;
    }
	
}
