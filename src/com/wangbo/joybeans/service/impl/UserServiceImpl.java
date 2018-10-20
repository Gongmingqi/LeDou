package com.wangbo.joybeans.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangbo.joybeans.mapper.UserMapper;
import com.wangbo.joybeans.pojo.PageBean;
import com.wangbo.joybeans.pojo.User;
import com.wangbo.joybeans.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	/**
	 * Spring  IOC
	 */
	@Autowired
	private UserMapper userMapper;

	@Override
	public User login(String account,String pwd) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("account", account);
		params.put("pwd", pwd);
		User user1 = userMapper.login(params);
		return user1;
	}

	@Override
	public void regist(User user) {
		userMapper.regist(user);
	}

	@Override
	public List<User> queryAll() {
		return userMapper.queryAll();
		
	}

	@Override
	public List<User> queryConditionUser(Map<String, Object> params) {
		
		List<User> list = userMapper.queryConditionUser(params);
		return list;
	}
	
	@Override
	public List<User> queryConditionUserPagination(Map<String, Object> params) {
		List<User> list = userMapper.queryConditionUserPagination(params);
		return list;
	}

	@Override
	public void recoverUser(int[] ids) {
		Map<String, int[]> params = new HashMap<String,int[]>();
		params.put("array", ids);
		userMapper.recoverUser(params);
	}

	@Override
	public void pauseUser(int[] ids) {
		Map<String, int[]> params = new HashMap<String,int[]>();
		params.put("array", ids);
		userMapper.pauseUser(params);
		
	}

	@Override
	public List<User> userPagination(Map<String, Integer> params) {
		
		List<User> list = userMapper.userPagination(params);
		
		return list;
	}

	@Override
	public User queryUserById(Integer userId) {
		return userMapper.queryUserById(userId);
	}

	@Override
	public void consumeMoney(Map<String, Object> params) {
		userMapper.consumeMoney(params);
		
	}

	

	

	

}
