package com.hao.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hao.constant.Namespace;
import com.hao.po.User;
import com.hao.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;
	
	@RequestMapping(value = "/login")
	public String login(User user, Model map, HttpSession session){
		User u = userService.login(user);
		if(u != null){
			session.setAttribute(Namespace.USER_SESSION, u);
			if(user.getLoginname().equals("admin")){
				return "admin";
			}else{
				return "report";
			}
		}else{
			map.addAttribute("result", "用户名或密码不存在.");
			return "index";
		}
	}
	
	@RequestMapping(value = "/register")
	public String register(User user, Model map){
		try{
			String result = userService.register(user);
			if(result.equals("ok")){
				map.addAttribute("result", "注册成功, 请登录.");
				return "index";
			}else if(result.equals("err")){
				map.addAttribute("result", "注册失败, 登录名已存在.");
				return "register";
			}
		}catch (Exception e) {
			e.printStackTrace();
			map.addAttribute("result", "注册失败, 请重新注册.");
		}
		return "register";
	}
}
