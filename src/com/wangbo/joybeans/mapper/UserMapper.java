package com.wangbo.joybeans.mapper;

import java.util.List;
import java.util.Map;

import com.wangbo.joybeans.pojo.User;

public interface UserMapper {
	User login(Map<String, String> params);
	
	void regist(User user);
	
	List<User> queryAll();
	
	List<User> queryConditionUser(Map<String, Object> params);
	
	List<User> queryConditionUserPagination(Map<String, Object> params);
	
	void recoverUser(Map<String, int[]> params);
	
	void pauseUser(Map<String, int[]> params);
	
	List<User> userPagination(Map<String, Integer> params);
	
	User queryUserById(Integer userId);
	
	void consumeMoney(Map<String, Object> params);
}
