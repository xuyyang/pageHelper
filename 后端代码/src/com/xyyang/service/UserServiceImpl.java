package com.xyyang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xyyang.bean.User;
import com.xyyang.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper userMapper;

	public PageInfo<User> findUserByPage(int page, int pageSize) {
		PageHelper.startPage(page, pageSize);
		List<User> list = userMapper.select();
		return new PageInfo<User>(list);
	}
	
	
}
