package com.sjdang.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.sjdang.util.date.JsonDateValueProcessor;
import com.sjdang.util.page.Pagination;

import javolution.util.FastMap;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * @ClassName: com.sjdang.util.UtilPrintWriter
 * @Description: TODO(AJAX���󷵻�JSON����)
 * @author SJDANG
 * @date 2018��2��14�� ����9:16:32
 * @version V1.0
 */
public class UtilPrintWriter {
	
	private static Logger logger = Logger.getLogger(UtilPrintWriter.class.getName());
	
	/**
	 * @Description: TODO(������ת��ΪJSON���ݲ�����)
	 * @param response
	 * @param resFlag
	 * @param resMsg
	 * @param resData
	 */
	public static void printJsonData(HttpServletResponse response, int resFlag, String resMsg, Object resData) {
		Map<String, Object> resultMap = FastMap.newInstance();
		resultMap.put(Constant.KEY_RESULT_FLAG, resFlag);
		resultMap.put(Constant.KEY_RESULT_MSG, resMsg);
		resultMap.put(Constant.KEY_RESULT_DATA, resData);
		printJsonData(resultMap, response);
	}
	
	/**
	 * @Description: TODO(��Map<String, Object>ת��ΪJSON���ݲ�����)
	 * @param resultMap
	 * @param response
	 * @return void
	 */
	public static void printJsonData(Map<String, Object> resultMap, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		JSONObject jsonObj = JSONObject.fromObject(resultMap, jsonConfig);
		try {
			PrintWriter writer = response.getWriter();
			writer.print(jsonObj);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			logger.error("IOException:", e);
		}
	}
	
	/**
	 * @Description: TODO(��Pagination<Object>ת��ΪDataTable JSON�����������)
	 * @param pagination
	 * @param response
	 * @return void
	 */
	public static void printDataTable(Pagination<?> pagination, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		JSONObject jsonObj = JSONObject.fromObject(pagination, jsonConfig);
		try {
			PrintWriter writer = response.getWriter();
			writer.print(jsonObj);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			logger.error("IOException:", e);
		}
	}
	

}
