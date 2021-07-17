package com.sjdang.manage.dao.common;

import java.util.List;
import java.util.Map;

import com.sjdang.annotation.MybatisDao;
import com.sjdang.manage.entity.common.SculptureEntity;
import com.sjdang.manage.entity.common.SculptureEntityVO;

/**
* @Package com.sjdang.manage.dao.common.SculptureDao
* @Description: TODO(用户基础头像相关接口)  
* @author SJDANG
* @date 2018-03-25 22:38
* @version V1.0  
*/
@MybatisDao
public interface SculptureDao {
	
	public int create(SculptureEntity entity);
	
	public int update(SculptureEntity entity);
	
	public List<SculptureEntityVO> list(Map<String, Object> paramMap);
	
	public int count(Map<String, Object> paramMap);
	
}
