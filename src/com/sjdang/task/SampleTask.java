package com.sjdang.task;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.sjdang.manage.dao.CompanyDao;
import com.sjdang.manage.entity.Company;

@Component
public class SampleTask {
	
	@Autowired
	private CompanyDao companyDao;
	
	/**
	 * 定时计算，每天凌晨 01:00 执行一次
	 */
	@Scheduled(cron = "0 0 18 * * *")
	public void show() {
		List<Company> companyList = companyDao.findAllCompany();
		System.out.println("cron:" + (new Date().toString()) + " - " + companyList.toString());
	} 
 
	/**
	 * 启动时执行一次，之后每隔60秒执行一次 
	 */
	@Scheduled(fixedRate = 1000*60)  
	public void print() {
		List<Company> companyList = companyDao.findAllCompany();
		System.out.println("fixedRate:" + (new Date().toString()) + " - " + companyList.toString());
	}

}
