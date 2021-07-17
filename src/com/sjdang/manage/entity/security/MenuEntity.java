package com.sjdang.manage.entity.security;

import java.util.Date;

/**
* @Package com.sjdang.manage.entity.security.MenuEntity
* @Description: TODO(管理控制台菜单实体)  
* @author SJDANG
* @date 2018-04-08 22:18
* @version V1.0  
*/
public class MenuEntity {
	
	private Integer menuId;
	private String menuCode;
	private String menuName;
	private String menuIcon;
	private String menuUrl;
	private String menuDesc;
	private Integer menuSort;
	private Integer parentId;
	private Integer isValid;
	private Integer createUser;
	private Date createTime;
	private Integer lastUpdateUser;
	private Date lastUpdateTime;
	
	private String parentMenuCode;
	private String parentMenuName;
	
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getMenuDesc() {
		return menuDesc;
	}
	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}
	public Integer getMenuSort() {
		return menuSort;
	}
	public void setMenuSort(Integer menuSort) {
		this.menuSort = menuSort;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getIsValid() {
		return isValid;
	}
	public void setIsValid(Integer isValid) {
		this.isValid = isValid;
	}
	public Integer getCreateUser() {
		return createUser;
	}
	public void setCreateUser(Integer createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getLastUpdateUser() {
		return lastUpdateUser;
	}
	public void setLastUpdateUser(Integer lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	
	public String getParentMenuCode() {
		return parentMenuCode;
	}
	public void setParentMenuCode(String parentMenuCode) {
		this.parentMenuCode = parentMenuCode;
	}
	public String getParentMenuName() {
		return parentMenuName;
	}
	public void setParentMenuName(String parentMenuName) {
		this.parentMenuName = parentMenuName;
	}
	
	@Override
	public String toString() {
		return "MenuEntity [menuId=" + menuId + ", menuCode=" + menuCode + ", menuName=" + menuName + ", menuIcon="
				+ menuIcon + ", menuUrl=" + menuUrl + ", menuDesc=" + menuDesc + ", menuSort=" + menuSort
				+ ", parentId=" + parentId + ", isValid=" + isValid + ", createUser=" + createUser + ", createTime="
				+ createTime + ", lastUpdateUser=" + lastUpdateUser + ", lastUpdateTime=" + lastUpdateTime
				+ ", parentMenuCode=" + parentMenuCode + ", parentMenuName=" + parentMenuName + "]";
	}
	
}
