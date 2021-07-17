package com.sjdang.manage.dao;

import java.util.List;

import com.sjdang.annotation.MybatisDao;
import com.sjdang.manage.entity.Company;
import com.sjdang.util.page.DataTableVO;

@MybatisDao
public interface CompanyDao {
	
	public List<Company> findAllCompany();
	
	public List<Company> findByPage(DataTableVO dataTable);
	
	public int getTotalCount();

}
