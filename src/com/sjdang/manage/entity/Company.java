package com.sjdang.manage.entity;

import java.io.Serializable;

/**
 * @ClassName: com.sjdang.manage.entity.Company
 * @Description: TODO(公司实体)
 * @author SJDANG
 * @date 2018年2月16日 下午7:54:06
 * @version V1.0
 */
public class Company implements Serializable {

	/** 
	* @Fields serialVersionUID : TODO() 
	*/ 
	private static final long serialVersionUID = 1L;
	
	private String companyId;
	private String companyName;
	private String companyCode;
	private String isAvailable;
	
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}
	
	@Override
	public String toString() {
		return "Company [companyId=" + companyId + ", companyCode=" + companyCode + ", companyName=" + companyName + ", isAvailable=" + isAvailable + "]";
	}
	

}
