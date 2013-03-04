package com.hao.service;

import java.util.List;
import java.util.Map;

import com.googlecode.jsonplugin.JSONException;
import com.hao.po.Report;

public interface IReportService {

	String saveReport(List<Report> list, Map<String, Object> map);
	
	String chooseUniqueFlag(Integer userId) throws JSONException;
	
	String queryReport(Map<String, Object> map) throws JSONException;
	
	void saveShowReport(Map<String, List<Report>> map);
	
	void deleteReportByReportid(String reportIds);
}
