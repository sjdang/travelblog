package com.sjdang.manage.entity.security;

import java.util.Date;

import com.sjdang.util.page.DataTableVO;

public class RoleEntity extends DataTableVO {
	
	private Integer roleId;
	private String roleCode;
	private String roleName;
	private Integer roleLevel;
	private String roleDesc;
	private Integer isValid;
	private Integer createUser;
	private Date createTime;
	private Integer lastUpdateUser;
	private Date lastUpdateTime;
	
	private String createUserName;
	private String lastUpdateUserName;
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Integer getRoleLevel() {
		return roleLevel;
	}
	public void setRoleLevel(Integer roleLevel) {
		this.roleLevel = roleLevel;
	}
	public String getRoleDesc() {
		return roleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
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
	
	public String getCreateUserName() {
		return createUserName;
	}
	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}
	public String getLastUpdateUserName() {
		return lastUpdateUserName;
	}
	public void setLastUpdateUserName(String lastUpdateUserName) {
		this.lastUpdateUserName = lastUpdateUserName;
	}
	
	@Override
	public String toString() {
		return "RoleEntity [roleId=" + roleId + ", roleCode=" + roleCode + ", roleName=" + roleName + ", roleLevel="
				+ roleLevel + ", roleDesc=" + roleDesc + ", isValid=" + isValid + ", createUser=" + createUser
				+ ", createTime=" + createTime + ", lastUpdateUser=" + lastUpdateUser + ", lastUpdateTime="
				+ lastUpdateTime + ", createUserName=" + createUserName + ", lastUpdateUserName=" + lastUpdateUserName
				+ "]";
	}
	
}
