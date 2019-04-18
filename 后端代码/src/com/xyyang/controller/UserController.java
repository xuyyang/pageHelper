package com.xyyang.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.github.pagehelper.PageInfo;
import com.xyyang.bean.User;
import com.xyyang.service.UserService;

@Controller
public class UserController{
	
	@Autowired
	UserService userService;	
	
	@RequestMapping(value="list",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findAllByPage(int page,int pageSize,HttpServletResponse response){
		
		//response设置响应头，解决跨域请求问题
		//No 'Access-Control-Allow-Origin' header is present on the requested resource
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		PageInfo<User> pager = userService.findUserByPage(page,pageSize);
		//总条数
		resultMap.put("total", pager.getTotal());
		//获取每页数据
		resultMap.put("rows", pager.getList());
		System.out.println(resultMap);
		return resultMap;
		
	}
	
	
}
