package com.hao.service;

import com.hao.po.User;

public interface IUserService {

	String register(User user);

	User login(User user);
}
