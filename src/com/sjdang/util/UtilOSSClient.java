package com.sjdang.util;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;

/**
* @Package com.sjdang.util.UtilOSSClient
* @Description: TODO(阿里云OSS文件云存储API工具类)  
* @author SJDANG
* @date 2018-03-21 22:42
* @version V1.0  
*/
public class UtilOSSClient {
	
	private static Logger logger = Logger.getLogger(UtilOSSClient.class.getName());
	
    /**  
    * @Description: TODO(用户头像上传)  
    * @param request
    * @param watermark
    * @return String
    */
    public static String uploadSculptureImage(HttpServletRequest request, boolean watermark) {
    	String folderPath = "travelblog/sculpture/";
    	return uploadFileToOSS(request, folderPath, watermark);
    }
    
    /**  
    * @Description: TODO(内容图片上传)  
    * @param request
    * @param watermark
    * @return String
    */
    public static String uploadContentImage(HttpServletRequest request, boolean watermark) {
    	String folderPath = "travelblog/content/";
    	return uploadFileToOSS(request, folderPath, watermark);
    }
    
    /**  
    * @Description: TODO(OSS文件上传)  
    * @param request
    * @param folderPath
    * @param watermark
    * @return String
    */
    private static String uploadFileToOSS(HttpServletRequest request, String folderPath, boolean watermark) {
    	
    	Map<String, String> map = UtilProperties.getKeyAndValue("alibaba-api.properties");
		String endpoint = map.get("oss_endpoint");
		String accessKeyId = map.get("oss_accesskeyid");
		String accessKeySecret = map.get("oss_accesskeysecret");
		String bucketName = map.get("oss_bucketname");
		String rootUrl = map.get("oss_rooturl");
		String displayRule = map.get("oss_displayrule");
		
    	MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iter = multiRequest.getFileNames();
        if (!iter.hasNext()) {
        	logger.debug("Warning: The file is not exists.");
        	return null;
        }
        MultipartFile imageFile = multiRequest.getFile(iter.next().toString());
        if (imageFile.isEmpty()) {
        	return null;
        }
        String fileName = UtilString.getRandomFileName(imageFile.getOriginalFilename());
        boolean isSuccess = true;
        
		OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
		try {
			ossClient.putObject(bucketName, folderPath + fileName, imageFile.getInputStream());
		} catch (OSSException oe) {
			isSuccess = false;
			logger.error("Caught an OSSException, which means your request made it to OSS, but was rejected with an error response for some reason.", oe);
		} catch (ClientException ce) {
			isSuccess = false;
			logger.error("Caught an ClientException, which means the client encountered a serious internal problem while trying to communicate with OSS, such as not being able to access the network.", ce);
		} catch (IOException ie) {
			isSuccess = false;
			logger.error(ie);
		} catch (Throwable te) {
			isSuccess = false;
			logger.error(te);
        } finally {
            ossClient.shutdown();
        }
		
    	if (!isSuccess) {
    		return null;
    	}
    	if (watermark) {
    		// example: https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/xian.jpg?x-oss-process=style/TRAVEL_BLOG_IMAGE_RULE
    		return rootUrl + "/" + folderPath + fileName + "?" + displayRule;
    	}
    	// example: https://sjdang.oss-cn-beijing.aliyuncs.com/travelblog/sculpture/xian.jpg
    	return rootUrl + "/" + folderPath + fileName;
    }

}
