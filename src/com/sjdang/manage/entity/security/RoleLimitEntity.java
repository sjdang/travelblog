package com.sjdang.manage.entity.security;

public class RoleLimitEntity {
	
	private Integer limitId;
	private Integer roleId;
	private Integer menuId;
	
	public Integer getLimitId() {
		return limitId;
	}
	public void setLimitId(Integer limitId) {
		this.limitId = limitId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	
	@Override
	public String toString() {
		return "RoleLimitEntity [limitId=" + limitId + ", roleId=" + roleId + ", menuId=" + menuId + "]";
	}
	
}
