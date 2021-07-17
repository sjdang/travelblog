package com.sjdang.util;

/**
 * @ClassName: com.sjdang.util.Constant
 * @Description: TODO(常量工具类)
 * @author SJDANG
 * @date 2018年2月15日 下午5:44:29
 * @version V1.0
 */
public class Constant {
	
	// USER TYPE
	public static int USER_TYPE_MOBILE = 0;
	public static int USER_TYPE_MANAGE = 1;
	
	// SESSION NAME
	public static String MANAGE_SESSION = "manageUser";
	public static String MOBILE_SESSION = "mobileUser";
	
	// JSP ROOT NAME
	public static String JSP_MANAGE = "manage";
	public static String JSP_MOBILE = "mobile";
	
	// REQUEST RESULT FLAG
	public static int SUCCESS = 0;
	public static int FAILURE = 1;
	public static String SUCCESS_MSG = "请求成功";
	public static String FAILURE_MSG = "请求失败：";
	
	// REQUEST RESULT MAP KEY NAME
	public static String KEY_RESULT_FLAG = "resFlag";
	public static String KEY_RESULT_MSG = "resMsg";
	public static String KEY_RESULT_DATA = "resData";
	
	

}
