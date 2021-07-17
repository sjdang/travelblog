package com.sjdang.manage.controller.content.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sjdang.manage.dao.security.RoleDao;
import com.sjdang.manage.entity.login.ManageUserEntity;
import com.sjdang.manage.entity.security.RoleEntity;
import com.sjdang.util.Common;
import com.sjdang.util.Constant;
import com.sjdang.util.UtilPrintWriter;
import com.sjdang.util.page.DataTableVO;
import com.sjdang.util.page.Pagination;

@Controller
@RequestMapping("/manage/security/role")
public class RoleController {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private RoleDao roleDao;
	
	@RequestMapping("/viewList.do")
	public ModelAndView viewRoleList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView(Constant.JSP_MANAGE + "/content/security/manage-role-list");
		return model;
	}
	
	@ResponseBody
	@RequestMapping(value="/dataList.do")
	public void GetSculptureDataList(HttpServletRequest request, HttpServletResponse response) {
		DataTableVO dataTable = Common.getParamValues(request);
		RoleEntity entity = new RoleEntity();
		entity.setDraw(dataTable.getDraw());
		entity.setStart(dataTable.getStart());
		entity.setLength(dataTable.getLength());
		entity.setSearchValue(dataTable.getSearchValue());
		ManageUserEntity user = Common.getCurrentManageUser(request);
		if (user.getUserLevel() > 0) {
			entity.setCreateUser(user.getUserId());
		}
		Pagination<RoleEntity> pagination = new Pagination<RoleEntity>();
		try {
			List<RoleEntity> dataList = roleDao.list(entity);
			int dataCount = roleDao.count(entity);
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

}
