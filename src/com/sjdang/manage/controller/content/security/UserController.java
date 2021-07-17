package com.sjdang.manage.controller.content.security;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjdang.manage.dao.login.ManageUserDao;
import com.sjdang.manage.entity.login.ManageUserEntity;
import com.sjdang.util.Common;
import com.sjdang.util.Constant;
import com.sjdang.util.UtilPrintWriter;
import com.sjdang.util.page.DataTableVO;
import com.sjdang.util.page.Pagination;

/**
 * @ClassName: com.sjdang.manage.controller.content.security.UserController
 * @Description: TODO(管理控制台用户管理相关Controller)
 * @author SJDANG
 * @date 2018年3月10日 上午12:31:05
 * @version V1.0
 */
@Controller
@RequestMapping("/manage/security/user")
public class UserController {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ManageUserDao manageUserDao;
	
	@RequestMapping("/showLoginHistory.do")
	public String toMain() {
		return Constant.JSP_MANAGE + "/content/security/login-history";
	}
	
	@ResponseBody
	@RequestMapping(value="/loginHistoryData.do")
	public void loginHistoryData(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		DataTableVO dataTable = Common.getParamValues(request);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", dataTable.getStart());
		paramMap.put("length", dataTable.getLength());
		paramMap.put("searchValue", dataTable.getSearchValue());
		paramMap.put("userType", Constant.USER_TYPE_MANAGE);
		ManageUserEntity user = Common.getCurrentManageUser(request);
		if (user.getUserLevel() > 0) {
			paramMap.put("userId", user.getUserId());
		}
		List<Map<String, Object>> resultList = manageUserDao.listLoginHistory(paramMap);
		int totalCount = manageUserDao.getLoginHistoryCount(paramMap);
		Pagination<Map<String, Object>> pagination = new Pagination<Map<String, Object>>();
		pagination.setData(resultList);
		pagination.setDraw(dataTable.getDraw());
		pagination.setRecordsTotal(totalCount);
		pagination.setRecordsFiltered(totalCount);
		UtilPrintWriter.printDataTable(pagination, response);
	}
	
}
