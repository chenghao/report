package com.hao.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.googlecode.jsonplugin.JSONException;
import com.hao.constant.Namespace;
import com.hao.po.User;
import com.hao.service.IAdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private IAdminService adminService;
	
	@RequestMapping(value = "queryUser")
	@ResponseBody
	public void queryUser(HttpServletResponse response, HttpSession session) throws JSONException, IOException{
		String loginname = ((User)session.getAttribute(Namespace.USER_SESSION)).getLoginname();
		
		String result = adminService.queryNonSelfAllUser(loginname);
		response.getWriter().print(result);
	}
	
	
	@RequestMapping(value = "deleteUserByUserid")
	public void deleteUserByUserid(Integer userId, HttpServletResponse response) throws IOException{
		try{
			adminService.deleteUserByUserid(userId);
			response.getWriter().print("{\"result\":\"0\"" + "}");
		}catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("{\"result\":\"1\"" + "}");
		}
	}
	
}
