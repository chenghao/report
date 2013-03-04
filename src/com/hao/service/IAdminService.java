package com.hao.service;

import com.googlecode.jsonplugin.JSONException;

public interface IAdminService {

	String queryNonSelfAllUser(String loginname) throws JSONException;
	
	void deleteUserByUserid(Integer userId);
}
