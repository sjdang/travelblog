package com.sjdang.manage.controller.content.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sjdang.manage.dao.CompanyDao;
import com.sjdang.manage.dao.login.ManageUserDao;
import com.sjdang.manage.entity.Company;
import com.sjdang.manage.entity.login.ManageUserEntity;
import com.sjdang.util.Constant;
import com.sjdang.util.UtilHttpClient;
import com.sjdang.util.UtilPrintWriter;
import com.sjdang.util.UtilProperties;

import javolution.util.FastMap;
import net.sf.json.JSONObject;

/**
 * @ClassName: com.sjdang.manage.controller.content.main.MainController
 * @Description: TODO(登录成功后主逻辑相关Controller)
 * @author SJDANG
 * @date 2018年2月19日 下午7:48:36
 * @version V1.0
 */
@Controller
@RequestMapping("/manage/main")
public class MainController {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ManageUserDao manageUserDao;
	@Autowired
	private CompanyDao companyDao;
	
	/**  
	* @Description: TODO(控制台首页)  
	* @param request
	* @param response
	* @return ModelAndView
	*/
	@RequestMapping("/index.do")
	public ModelAndView mainView(HttpServletRequest request, HttpServletResponse response){
		ModelAndView model = new ModelAndView(Constant.JSP_MANAGE + "/content/main/index");
		HttpSession session = request.getSession();
		if (session.getAttribute("manageUser") == null) {
			return new ModelAndView(Constant.JSP_MANAGE + "/login/login");
		}
		ManageUserEntity user = (ManageUserEntity) session.getAttribute("manageUser");
		String lastLoginTime = "";
		try {
			lastLoginTime = manageUserDao.getLatestLoginHistory(user.getUserId());
		} catch (Exception e) {
			logger.error(e);
		}
		model.addObject("user" ,user);
		model.addObject("lastLoginTime", lastLoginTime);
		return model;
	}
	
	/**  
	* @Description: TODO(从属性配置文件中解析提取百度API)  
	* @param request
	* @param response  
	* @return void
	*/
	@ResponseBody
	@RequestMapping(value="/baiduApi.do", method = RequestMethod.GET)
	public void getBaiduAccessKey(HttpServletRequest request, HttpServletResponse response){
		Map<String, String> akMap = UtilProperties.getKeyAndValue("baidu-api.properties");
		if (akMap.isEmpty()) {
			UtilPrintWriter.printJsonData(response, Constant.FAILURE, "请求失败：属性文件缺失", null);
			return;
		}
		UtilPrintWriter.printJsonData(response, Constant.SUCCESS, "请求成功", akMap);
	}
	
	/** 
	* @Description: TODO(通过聚合API查询当前城市未来5天天气状况) 
	* @param request
	* @param response
	* @param cityName
	* @return void
	* @date 2021年7月14日 上午10:40:52  
	*/
	@ResponseBody
	@RequestMapping(value="/juheApi/futureWeather.do", method=RequestMethod.POST)
	public void getJuheFutureWeather(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(value="cityName", required=true) String cityName) {
		Map<String, String> apiMap = UtilProperties.getKeyAndValue("juhe-api.properties");
		if (apiMap.isEmpty()) {
			UtilPrintWriter.printJsonData(response, Constant.FAILURE, Constant.FAILURE_MSG + "属性文件缺失", null);
			return;
		}
		String apiKey = apiMap.get("juhe_api_key");
		String apiUrl = apiMap.get("juhe_api_future_weather");
		Map<String, String> paramMap = FastMap.newInstance();
		paramMap.put("key", apiKey);
		paramMap.put("city", cityName);
		String apiData = UtilHttpClient.get(apiUrl, paramMap);
		JSONObject apiJson = JSONObject.fromObject(apiData);
		UtilPrintWriter.printJsonData(response, Constant.SUCCESS, Constant.SUCCESS_MSG, apiJson);
	}
	
	/** 
	* @Description: TODO(通过聚合API查询当前城市当天生活指数) 
	* @param request
	* @param response
	* @param cityName
	* @return void
	* @date 2021年7月14日 上午11:15:45  
	*/
	@ResponseBody
	@RequestMapping(value="/juheApi/livingIndex.do", method=RequestMethod.POST)
	public void getJuheLivingIndex(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="cityName", required=true) String cityName) {
		Map<String, String> apiMap = UtilProperties.getKeyAndValue("juhe-api.properties");
		if (apiMap.isEmpty()) {
			UtilPrintWriter.printJsonData(response, Constant.FAILURE, Constant.FAILURE_MSG + "属性文件缺失", null);
			return;
		}
		String apiKey = apiMap.get("juhe_api_key");
		String apiUrl = apiMap.get("juhe_api_living_index");
		Map<String, String> paramMap = FastMap.newInstance();
		paramMap.put("key", apiKey);
		paramMap.put("city", cityName);
		String apiData = UtilHttpClient.get(apiUrl, paramMap);
		JSONObject apiJson = JSONObject.fromObject(apiData);
		UtilPrintWriter.printJsonData(response, Constant.SUCCESS, Constant.SUCCESS_MSG, apiJson);
	}
	
	
	// -----------------------------------------------------------------------------------------------------
	
	@RequestMapping("/welcome.do")
	public String welcomeView(Model model){
		try {
			Thread.sleep(500);
			List<Company> companyList = companyDao.findAllCompany();
			model.addAttribute("companyList", companyList);
			model.addAttribute("title", "通威集团分子公司列表");
			List<ManageUserEntity> userList = manageUserDao.findAllUser();
			logger.error(userList);
		} catch (Exception e) {
			logger.error("Error happened when query company info: ", e);
		}
		return Constant.JSP_MANAGE + "/content/main/welcome";
	}
	
	@RequestMapping("/chinaMap.do")
	public String chinaMapView(Model model){
		try {
			Thread.sleep(100);
		} catch (Exception e) {
			logger.error("Error happened when query company info: ", e);
		}
		return Constant.JSP_MANAGE + "/content/main/china-map";
	}

}
