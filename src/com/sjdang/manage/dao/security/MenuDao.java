package com.sjdang.manage.dao.security;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sjdang.annotation.MybatisDao;
import com.sjdang.manage.entity.security.MenuEntity;

@MybatisDao
public interface MenuDao {
	
	public int insert(MenuEntity entity);
	
	public int update(MenuEntity entity);
	
	public int delete(@Param("menuId")Integer menuId, @Param("parentId")Integer parentId);
	
	public MenuEntity findOne(@Param("menuId")Integer menuId);
	
	public List<MenuEntity> findAll();
	
	public MenuEntity getMaxCode(@Param("parentId")Integer parentId);

}
