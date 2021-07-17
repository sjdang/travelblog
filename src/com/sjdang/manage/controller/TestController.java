package com.sjdang.manage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sjdang.manage.dao.CompanyDao;
import com.sjdang.manage.entity.Company;
import com.sjdang.util.Constant;
import com.sjdang.util.UtilOSSClient;
import com.sjdang.util.UtilPrintWriter;
import com.sjdang.util.page.DataTableVO;
import com.sjdang.util.page.Pagination;

import javolution.util.FastMap;

@Controller
@RequestMapping("/manage/test")
public class TestController {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private CompanyDao companyDao;
	
	@RequestMapping("/dataTable.do")
	public String toMain(){
		return Constant.JSP_MANAGE + "/dataTable";
	}
	
	@RequestMapping("/upload.do")
	public String toUpload(){
		return Constant.JSP_MANAGE + "/content/base/base-sculpture";
	}
	
	@RequestMapping("/websocketTest.do")
	public String viewWebsocketTest(){
		return Constant.JSP_MANAGE + "/websocket-test";
	}
	
	@RequestMapping("/getAllOrgs.do")
	public String getAllOrgs(Model model){
		List<Company> companyList = companyDao.findAllCompany();
		model.addAttribute("companyList", companyList);
		model.addAttribute("title", "通威集团分子公司列表");
		return Constant.JSP_MANAGE + "/main";
	}
	
	@RequestMapping("/gotoAllOrgsView.do")
	public ModelAndView gotoAllOrgsView(){
		ModelAndView model = new ModelAndView(Constant.JSP_MANAGE + "/main");
		List<Company> companyList = companyDao.findAllCompany();
		model.addObject("companyList", companyList);
		model.addObject("title", "通威集团分子公司列表");
		return model;
	}
	
	@RequestMapping("/gotoLoginView.do")
	public ModelAndView gotoLoginView(){
		ModelAndView model = new ModelAndView(Constant.JSP_MANAGE + "/login/login");
		return model;
	}
	
	@RequestMapping("/analysisData.do")
	public void analysisData(HttpServletRequest request, HttpServletResponse response){
		String jsonStr = "{\"resFlag\":\"success\",\"amountData\":[12,40,50,15,20,20],\"priceData\":[30,30,20,15,10,40]}";
		try {
			PrintWriter writer = response.getWriter();
			writer.print(jsonStr);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			logger.error("IOException", e);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/getAllOrgsByJson.do")
	public void getAllOrgsByJson(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> jsonMap = FastMap.newInstance();
		List<Company> companyList = companyDao.findAllCompany();
		jsonMap.put("resFlag", "success");
		jsonMap.put("resData", companyList);
		UtilPrintWriter.printJsonData(jsonMap, response);
	}
	
	@ResponseBody
	@RequestMapping(value="/testDataTable.do")
	public void testDataTable(HttpServletRequest request, HttpServletResponse response,
			DataTableVO dataTable) throws InterruptedException{
		Thread.sleep(500);
		List<Company> resultList = companyDao.findByPage(dataTable);
		int totalCount = companyDao.getTotalCount();
		Pagination<Company> pagination = new Pagination<Company>();
		pagination.setData(resultList);
		pagination.setDraw(dataTable.getDraw());
		pagination.setRecordsTotal(totalCount);
		pagination.setRecordsFiltered(totalCount);
		UtilPrintWriter.printDataTable(pagination, response);
	}
	
	@ResponseBody
	@RequestMapping("/uploadImage.do")
	public void uploadImage(HttpServletRequest request, HttpServletResponse response){
		String fileName = UtilOSSClient.uploadContentImage(request, true);
		logger.info(fileName);
	}

}
