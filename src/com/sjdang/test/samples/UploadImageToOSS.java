package com.sjdang.test.samples;

import java.io.File;
import java.io.IOException;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;

public class UploadImageToOSS {
	
	private static String endpoint = "http://oss-cn-beijing.aliyuncs.com";
    private static String accessKeyId = "LTAIFkj3UthKqjEi";
    private static String accessKeySecret = "aPErQSOmKLj0tw8BE4BEkRmsXaddOY";
    private static String bucketName = "sjdang";
    private static String key = "201803140001.jpg";
    private static String uploadFile = "‪C:\\Users\\stdang\\Documents\\xian.jpg";
    
    public static void main(String[] args) throws IOException {        

        OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
        
        try {
        	
        	File file = new File(uploadFile);
        	if (file.exists()) {
        		ossClient.putObject(bucketName, key, file);
        	}
        	
        } catch (OSSException oe) {
            System.out.println("Caught an OSSException, which means your request made it to OSS, "
                    + "but was rejected with an error response for some reason.");
            System.out.println("Error Message: " + oe.getErrorCode());
            System.out.println("Error Code:       " + oe.getErrorCode());
            System.out.println("Request ID:      " + oe.getRequestId());
            System.out.println("Host ID:           " + oe.getHostId());
        } catch (ClientException ce) {
            System.out.println("Caught an ClientException, which means the client encountered "
                    + "a serious internal problem while trying to communicate with OSS, "
                    + "such as not being able to access the network.");
            System.out.println("Error Message: " + ce.getMessage());
        } catch (Throwable e) {
            e.printStackTrace();
        } finally {
            ossClient.shutdown();
        }
    }

}
