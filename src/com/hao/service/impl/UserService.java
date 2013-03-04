package com.hao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hao.constant.Namespace;
import com.hao.dao.ICommonDao;
import com.hao.po.User;
import com.hao.service.IUserService;

@Service
public class UserService implements IUserService {

	@Autowired
	private ICommonDao<User> commonDao;
	
	@Override
	public String register(User user) {
		User u = commonDao.findByField(Namespace.USER + ".queryUserByLoginname", user.getLoginname());
		if(u == null){
			commonDao.insert(Namespace.USER + ".register", user);
			return "ok";
		}else{
			return "err";
		}
	}

	@Override
	public User login(User user) {
		return commonDao.findByBase(Namespace.USER + ".login", user);
	}


}
