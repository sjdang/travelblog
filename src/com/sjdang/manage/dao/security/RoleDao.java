package com.sjdang.manage.dao.security;

import java.util.List;

import com.sjdang.annotation.MybatisDao;
import com.sjdang.manage.entity.security.RoleEntity;

@MybatisDao
public interface RoleDao {
	
    public int insert(RoleEntity entity);
	
	public int update(RoleEntity entity);
	
	
    public List<RoleEntity> list(RoleEntity entity);
	
	public int count(RoleEntity entity);

}
