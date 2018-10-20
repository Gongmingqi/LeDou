package com.wangbo.joybeans.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wangbo.joybeans.pojo.User;

public interface UserService {
	User login(String account,String pwd);
	
	void regist(User user);
	
	List<User> queryAll();
	
	List<User> queryConditionUser(Map<String, Object> params);
	
	List<User> queryConditionUserPagination(Map<String, Object> params);

	void recoverUser(int[] ids);
	
	void pauseUser(int[] ids);
	
	List<User> userPagination(Map<String, Integer> params);
	
	User queryUserById(Integer userId);
	
	void consumeMoney(Map<String, Object> params);

}
