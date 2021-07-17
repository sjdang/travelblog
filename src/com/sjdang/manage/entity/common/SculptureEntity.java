package com.sjdang.manage.entity.common;

import java.util.Date;

/**
* @Package com.sjdang.manage.entity.common.SculptureEntity
* @Description: TODO(用户基础头像实体)  
* @author SJDANG
* @date 2018-03-24 21:41
* @version V1.0  
*/
public class SculptureEntity {
	
	private Integer sculptureId;
	private String sculptureUrl;
	private String sculptureClass;
	private Integer genderRole;
	private Integer isValid;
	private Integer createUser;
	private Date createTime;
	private Integer lastUpdateUser;
	private Date lastUpdateTime;
	
	public Integer getSculptureId() {
		return sculptureId;
	}
	public void setSculptureId(Integer sculptureId) {
		this.sculptureId = sculptureId;
	}
	public String getSculptureUrl() {
		return sculptureUrl;
	}
	public void setSculptureUrl(String sculptureUrl) {
		this.sculptureUrl = sculptureUrl;
	}
	public String getSculptureClass() {
		return sculptureClass;
	}
	public void setSculptureClass(String sculptureClass) {
		this.sculptureClass = sculptureClass;
	}
	public Integer getGenderRole() {
		return genderRole;
	}
	public void setGenderRole(Integer genderRole) {
		this.genderRole = genderRole;
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
	
	@Override
	public String toString() {
		return "SculptureEntity [sculptureId=" + sculptureId + ", sculptureUrl=" + sculptureUrl + ", sculptureClass="
				+ sculptureClass + ", genderRole=" + genderRole + ", isValid=" + isValid + ", createUser=" + createUser
				+ ", createTime=" + createTime + ", lastUpdateUser=" + lastUpdateUser + ", lastUpdateTime="
				+ lastUpdateTime + "]";
	}
	
}
