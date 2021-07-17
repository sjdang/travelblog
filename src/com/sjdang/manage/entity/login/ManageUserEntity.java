package com.sjdang.manage.entity.login;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: com.sjdang.manage.entity.login.ManageUserEntity
 * @Description: TODO(管理控制台用户实体)
 * @author SJDANG
 * @date 2018年2月17日 下午6:17:44
 * @version V1.0
 */
public class ManageUserEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	private String userNo;
	private String userName;
	private Integer userLevel;
	private String password;
	private String imageUrl;
	private Integer isValid;
	private Date createTime;
	private Date lastUpdateTime;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public Integer getIsValid() {
		return isValid;
	}
	public void setIsValid(Integer isValid) {
		this.isValid = isValid;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	
}
