package com.hao.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.googlecode.jsonplugin.JSONException;
import com.googlecode.jsonplugin.JSONUtil;
import com.hao.constant.Namespace;
import com.hao.dao.ICommonDao;
import com.hao.po.User;
import com.hao.service.IAdminService;

@Service
public class AdminService implements IAdminService {
	@Autowired
	private ICommonDao<User> commonDao;

	@Override
	public String queryNonSelfAllUser(String loginname) throws JSONException {
		List<User> list = commonDao.findByFieldList(Namespace.ADMIN + ".queryNonSelfAllUser", loginname);
		
		List<Map<String, Object>> rows = new ArrayList<Map<String,Object>>();
		Map<String, Object> m;
		Map<String, Object> resultJson = new HashMap<String, Object>();
		
		for(User user : list){
			m = new HashMap<String, Object>();
			m.put("userId", user.getUserId());
			m.put("loginname", user.getLoginname());
			m.put("username", user.getUsername());
			m.put("department", user.getDepartment());
			m.put("post", user.getPost());
			
			rows.add(m);
		}
		
		String result = "";
		resultJson.put("rows", rows);
		result = JSONUtil.serialize(resultJson);
		
		return result;
	}

	@Override
	public void deleteUserByUserid(Integer userId) {
		commonDao.deleteByField(Namespace.ADMIN + ".deleteUserByUserid", userId);
		
	}

}
