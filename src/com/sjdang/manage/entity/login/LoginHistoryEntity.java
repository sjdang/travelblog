package com.sjdang.manage.entity.login;

import java.util.Date;

/**
 * @ClassName: com.sjdang.manage.entity.login.LoginHistoryEntity
 * @Description: TODO(��¼��ʷ��־ʵ��)
 * @author SJDANG
 * @date 2018��3��6�� ����4:20:18
 * @version V1.0
 */
public class LoginHistoryEntity {
	
	private Integer historyId;
	private String sessionId;
	private Integer userType;
	private Integer userId;
	private Date loginTime;
	private Date logoutTime;
	
	public Integer getHistoryId() {
		return historyId;
	}
	public void setHistoryId(Integer historyId) {
		this.historyId = historyId;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	public Date getLogoutTime() {
		return logoutTime;
	}
	public void setLogoutTime(Date logoutTime) {
		this.logoutTime = logoutTime;
	}
	
	@Override
	public String toString() {
		return "LoginHistoryEntity [historyId=" + historyId + ", sessionId=" + sessionId + ", userType=" + userType
				+ ", userId=" + userId + ", loginTime=" + loginTime + ", logoutTime=" + logoutTime + "]";
	}
	
}
