package com.sjdang.manage.controller.content.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sjdang.manage.dao.common.SculptureDao;
import com.sjdang.manage.entity.common.SculptureEntity;
import com.sjdang.manage.entity.common.SculptureEntityVO;
import com.sjdang.manage.entity.login.ManageUserEntity;
import com.sjdang.util.Common;
import com.sjdang.util.Constant;
import com.sjdang.util.UtilOSSClient;
import com.sjdang.util.UtilPrintWriter;
import com.sjdang.util.page.DataTableVO;
import com.sjdang.util.page.Pagination;

/**
* @Package com.sjdang.manage.controller.content.common.SculptureController
* @Description: TODO(用户基础头像相关Controller)  
* @author SJDANG
* @date 2018-03-25 22:35
* @version V1.0  
*/
@Controller
@RequestMapping("/manage/common/sculpture")
public class SculptureController {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private SculptureDao sculptureDao;
	
	@RequestMapping("/viewList.do")
	public ModelAndView viewSculptureList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView(Constant.JSP_MANAGE + "/content/common/common-sculpture");
		return model;
	}
	
	@ResponseBody
	@RequestMapping(value="/dataList.do")
	public void GetSculptureDataList(HttpServletRequest request, HttpServletResponse response) {
		DataTableVO dataTable = Common.getParamValues(request);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("start", dataTable.getStart());
		paramMap.put("length", dataTable.getLength());
		paramMap.put("searchValue", dataTable.getSearchValue());
		ManageUserEntity user = Common.getCurrentManageUser(request);
		if (user.getUserLevel() > 0) {
			paramMap.put("createUser", user.getUserId());
		}
		Pagination<SculptureEntityVO> pagination = new Pagination<SculptureEntityVO>();
		try {
			List<SculptureEntityVO> dataList = sculptureDao.list(paramMap);
			int dataCount = sculptureDao.count(paramMap);
			pagination.setData(dataList);
			pagination.setDraw(dataTable.getDraw());
			pagination.setRecordsTotal(dataCount);
			pagination.setRecordsFiltered(dataCount);
		} catch (Exception e) {
			pagination.setRecordsTotal(0);
			pagination.setRecordsFiltered(0);
			logger.error(e);
		}
		UtilPrintWriter.printDataTable(pagination, response);
	}
	
	@ResponseBody
	@RequestMapping(value="/save.do")
	public void saveSculpture(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="operate", defaultValue="CREATE") String operate,
			@RequestParam(value="upload", defaultValue="FALSE") String upload,
			SculptureEntity entity) {
		if (upload.equals("TRUE")) {
			String fileName = UtilOSSClient.uploadSculptureImage(request, false);
			entity.setSculptureUrl(fileName);
		}
		int userId = Common.getCurrentManageUserId(request);
		entity.setLastUpdateUser(userId);
		try {
			if (operate.equals("CREATE")) {
				entity.setCreateUser(userId);
				entity.setIsValid(1);
				sculptureDao.create(entity);
			} else {
				sculptureDao.update(entity);
			}
		} catch (Exception e) {
			logger.error("Caught an exception when create Sculpture:", e);
			UtilPrintWriter.printJsonData(response, Constant.FAILURE, "系统异常：保存失败，" + e.getMessage(), null);
			return;
		}
		UtilPrintWriter.printJsonData(response, Constant.SUCCESS, "保存成功", null);
	}

}
