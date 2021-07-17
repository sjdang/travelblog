package com.sjdang.manage.controller.content.security;

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

import com.sjdang.manage.dao.security.MenuDao;
import com.sjdang.manage.entity.security.MenuEntity;
import com.sjdang.util.Common;
import com.sjdang.util.Constant;
import com.sjdang.util.UtilPrintWriter;

import javolution.util.FastList;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/manage/security/menu")
public class MenuController {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private MenuDao menuDao;
	
	@RequestMapping("/viewList.do")
	public ModelAndView viewMenuList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView(Constant.JSP_MANAGE + "/content/security/manage-menu");
		return model;
	}
	
	@ResponseBody
	@RequestMapping(value="/treeList.do")
	public void listMenuTree(HttpServletRequest request, HttpServletResponse response) {
		List<MenuEntity> menuList = null;
		try {
			menuList = menuDao.findAll();
		} catch (Exception e) {
			logger.error("Caught an exception while query Menu data:", e);
			UtilPrintWriter.printJsonData(response, Constant.FAILURE, "系统异常：查询失败，" + e.getMessage(), null);
			return;
		}
		List<Map<String, Object>> treeList = FastList.newInstance();
		JSONArray treeArr = Common.getTreeList(menuList, treeList);
		UtilPrintWriter.printJsonData(response, Constant.SUCCESS, "查询成功", treeArr);
	}
	
	@ResponseBody
	@RequestMapping(value="/save.do")
	public void saveMenu(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="operate", defaultValue="CREATE") String operate,
			MenuEntity entity) {
		int userId = Common.getCurrentManageUserId(request);
		entity.setLastUpdateUser(userId);
		try {
			if ("CREATE".equals(operate)) {
				String menuCode = this.getMenuCode(entity.getParentId());
				entity.setMenuCode(menuCode);
				entity.setCreateUser(userId);
				menuDao.insert(entity);
			} else {
				menuDao.update(entity);
			}
		} catch (Exception e) {
			logger.error("Caught an exception while save Menu:", e);
			UtilPrintWriter.printJsonData(response, Constant.FAILURE, "系统异常：保存失败，" + e.getMessage(), null);
			return;
		}
		UtilPrintWriter.printJsonData(response, Constant.SUCCESS, "保存成功", null);
	}
	
	@ResponseBody
	@RequestMapping(value="/delete.do")
	public void deleteMenu(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="menuId", required=true) Integer menuId) {
		try {
			menuDao.delete(menuId, null);
			menuDao.delete(null, menuId);
		} catch (Exception e) {
			logger.error("Caught an exception while delete Menu data:", e);
			UtilPrintWriter.printJsonData(response, Constant.FAILURE, "系统异常：删除失败，" + e.getMessage(), null);
			return;
		}
		UtilPrintWriter.printJsonData(response, Constant.SUCCESS, "删除成功", null);
	}
	
	@ResponseBody
	@RequestMapping(value="/getOne.do")
	public void getOneMenu(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="menuId", required=true) Integer menuId) {
		MenuEntity menuEntity = null;
		try {
			menuEntity = menuDao.findOne(menuId);
			if (menuEntity == null) {
				UtilPrintWriter.printJsonData(response, Constant.FAILURE, "系统异常：数据缺失", null);
				return;
			}
		} catch (Exception e) {
			logger.error("Caught an exception while query Menu data:", e);
			UtilPrintWriter.printJsonData(response, Constant.FAILURE, "系统异常：查询失败，" + e.getMessage(), null);
			return;
		}
		UtilPrintWriter.printJsonData(response, Constant.SUCCESS, "查询成功", menuEntity);
	}
	
	/**  
	* @Description: TODO(自动生成菜单编码)  
	* @param parentId
	* @return String
	*/
	private String getMenuCode(int parentId) {
		MenuEntity menuEntity = menuDao.getMaxCode(parentId);
		if (menuEntity == null) {
			if (parentId == 0) {
				return "10";
			}
			menuEntity = menuDao.findOne(parentId);
			return menuEntity.getMenuCode() + "10";
		}
		String preCode = menuEntity.getMenuCode();
		String suffix = preCode.substring(preCode.length() - 2);
		return preCode.substring(0, (preCode.length() - 2)) + (Integer.parseInt(suffix) + 1);
	}

}
