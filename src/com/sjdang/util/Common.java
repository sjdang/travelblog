package com.sjdang.util;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.sjdang.manage.entity.login.ManageUserEntity;
import com.sjdang.manage.entity.security.MenuEntity;
import com.sjdang.util.page.DataTableVO;

import javolution.util.FastList;
import javolution.util.FastMap;
import net.sf.json.JSONArray;

/**
 * @ClassName: com.sjdang.util.Common
 * @Description: TODO(业务相关基本工具类)
 * @author SJDANG
 * @date 2018年3月10日 上午1:06:43
 * @version V1.0
 */
public class Common {
	
	private static Logger logger = Logger.getLogger(Common.class.getName());
	
	/**
	 * @Description: TODO(获取管理控制台当前用户)
	 * @author SJDANG
	 * @param request
	 * @return ManageUserEntity
	 */
	public static ManageUserEntity getCurrentManageUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ManageUserEntity user = (ManageUserEntity) session.getAttribute(Constant.MANAGE_SESSION);
		return user;
	}
	
	/**  
	* @Description: TODO(获取管理控制台当前用户ID)  
	* @param request
	* @return int
	*/
	public static int getCurrentManageUserId(HttpServletRequest request) {
		ManageUserEntity user = getCurrentManageUser(request);
		return user.getUserId();
	}
	
	/**
	 * @Description: TODO(封装DataTables关键请求参数)
	 * @author SJDANG
	 * @date 2018年3月10日 下午12:55:08
	 * @param request
	 * @return DataTableVO
	 */
	public static DataTableVO getParamValues(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			logger.error(e);
		}
		Map<String, String[]> parameterMap = request.getParameterMap();
		String[] draw = parameterMap.get("draw");
		String[] start = parameterMap.get("start");
		String[] length = parameterMap.get("length");
		String[] searchValue = parameterMap.get("search[value]");
		DataTableVO datatable = new DataTableVO();
		datatable.setDraw(Integer.parseInt(draw[0]));
		datatable.setStart(Integer.parseInt(start[0]));
		datatable.setLength(Integer.parseInt(length[0]));
		datatable.setSearchValue(searchValue[0]);
		return datatable;
	}
	
	/**  
	* @Description: TODO(通过递归算法生成菜单树)  
	* @param menuList
	* @param treeList
	* @return JSONArray
	*/
	public static JSONArray getTreeList(List<MenuEntity> menuList, List<Map<String, Object>> treeList) {
		if (!menuList.isEmpty() && !treeList.isEmpty()) {
			for (Map<String, Object> map : treeList) {
				List<Map<String, Object>> childList = FastList.newInstance();
				for (MenuEntity menuEntity : menuList) {
					String menuId = map.get("menuId").toString();
					String parentId = menuEntity.getParentId().toString();
					if (menuId.equals(parentId)) {
						Map<String, Object> childMap = FastMap.newInstance();
						childMap.put("text", "[" + menuEntity.getMenuCode() + "] " + menuEntity.getMenuName());
						int isValid = menuEntity.getIsValid();
						if (isValid == 0) {
							childMap.put("text", "[" + menuEntity.getMenuCode() + "] " + menuEntity.getMenuName() + "<span class='label label-warning mar-lft'>已禁用</span>");
						} else {
							childMap.put("text", "[" + menuEntity.getMenuCode() + "] " + menuEntity.getMenuName() + "</span><span class='label label-success mar-lft'>已启用</span>");
						}
						childMap.put("menuId", menuEntity.getMenuId());
						childMap.put("menuCode", menuEntity.getMenuCode());
						childMap.put("menuName", menuEntity.getMenuName());
						childMap.put("parent", menuEntity.getParentId());
						childMap.put("isValid", isValid);
						childList.add(childMap);
					}
				}
				if (childList.size() > 0) {
					List<String> tags = FastList.newInstance();
					tags.add(childList.size() + "");
					map.put("nodes", childList);
					map.put("tags", tags);
					getTreeList(menuList, childList);
				}
			}
		} else {
			if (menuList.isEmpty()) {
				return JSONArray.fromObject(treeList);
			}
			treeList = FastList.newInstance();
			for (MenuEntity menuEntity : menuList) {
				int parentId = menuEntity.getParentId();
				if (parentId == 0) {
					Map<String, Object> parentMap = FastMap.newInstance();
					int isValid = menuEntity.getIsValid();
					if (isValid == 0) {
						parentMap.put("text", "[" + menuEntity.getMenuCode() + "] " + menuEntity.getMenuName() + "<span class='label label-warning mar-lft'>已禁用</span>");
					} else {
						parentMap.put("text", "[" + menuEntity.getMenuCode() + "] " + menuEntity.getMenuName() + "<span class='label label-success mar-lft'>已启用</span>");
					}
					parentMap.put("menuId", menuEntity.getMenuId());
					parentMap.put("menuCode", menuEntity.getMenuCode());
					parentMap.put("menuName", menuEntity.getMenuName());
					parentMap.put("parent", menuEntity.getParentId());
					parentMap.put("isValid", isValid);
					treeList.add(parentMap);
				}
			}
			getTreeList(menuList, treeList);
		}
		return JSONArray.fromObject(treeList);
	}

}
