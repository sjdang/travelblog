package com.sjdang.manage.dao.login;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sjdang.annotation.MybatisDao;
import com.sjdang.manage.entity.login.LoginHistoryEntity;
import com.sjdang.manage.entity.login.ManageUserEntity;

/**
 * @ClassName: com.sjdang.manage.dao.login.ManageUserEntityDao
 * @Description: TODO(�������̨�û����ݽӿ�)
 * @author SJDANG
 * @date 2018��2��17�� ����6:27:00
 * @version V1.0
 */
@MybatisDao
public interface ManageUserDao {
	
	public ManageUserEntity findOne(String userNo);
	
	public List<ManageUserEntity> findAll();
	
	public List<ManageUserEntity> findAllUser();
	
	public int createLoginHistory(LoginHistoryEntity history);
	
	public int updateLogoutTime(String sessionId);
	
	public List<Map<String, Object>> listLoginHistory(Map<String, Object> paramMap);
	
	public int getLoginHistoryCount(Map<String, Object> paramMap);
	
	public String getLatestLoginHistory(@Param("userId")int userId);

}
