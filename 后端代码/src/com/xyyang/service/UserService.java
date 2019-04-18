package com.xyyang.service;


import com.github.pagehelper.PageInfo;
import com.xyyang.bean.User;


public interface UserService {

	PageInfo<User> findUserByPage(int page, int pageSize);
	
}
