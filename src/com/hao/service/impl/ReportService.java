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
import com.hao.po.Report;
import com.hao.service.IReportService;

@Service
public class ReportService implements IReportService {
	@Autowired
	private ICommonDao<Report> commonDao;

	@Override
	public String saveReport(List<Report> list, Map<String, Object> map) {

		List<Report> r = commonDao.findByMapList(Namespace.REPORT + ".queryReportByUseridAndUniqueFlag", map);
		if (r.size() == 0) {
			for(Report report : list){
				commonDao.insert(Namespace.REPORT + ".saveReport", report);
			}
			return "ok";
		} else {
			return "err";
		}
	}

	@Override
	public String chooseUniqueFlag(Integer userId) throws JSONException {
		List<Report> reports = commonDao.findByFieldList(Namespace.REPORT + ".chooseUniqueFlag", userId);
		
		List<Map<String, Object>> rows = new ArrayList<Map<String,Object>>();
		Map<String, Object> map;
		Map<String, Object> resultJson = new HashMap<String, Object>();
		
		for(Report report : reports){
			map = new HashMap<String, Object>();
			map.put("uniqueFlag", report.getUniqueFlag());
			rows.add(map);
		}
		
		String result = "";
		resultJson.put("rows", rows);
		
		result = JSONUtil.serialize(resultJson);
		
		return result;
	}

	@Override
	public String queryReport(Map<String, Object> map) throws JSONException {
		List<Report> reports = commonDao.findByMapList(Namespace.REPORT + ".queryReportByUseridAndUniqueFlag", map);
		
		List<Map<String, Object>> rows = new ArrayList<Map<String,Object>>();
		Map<String, Object> m;
		Map<String, Object> resultJson = new HashMap<String, Object>();
		
		for(Report report : reports){
			m = new HashMap<String, Object>();
			m.put("reportId", report.getReportId());
			m.put("assess", report.getAssess());
			m.put("nextWeekWorkPlan", report.getNextWeekWorkPlan());
			String nextWeekFinishTime = report.getNextWeekFinishTime();
			if(nextWeekFinishTime == null){
				m.put("nextWeekFinishTime", "");
			}else{
				m.put("nextWeekFinishTime", nextWeekFinishTime);
			}
			m.put("nextWeekContent", report.getNextWeekContent());
			m.put("nextWeekTarget", report.getNextWeekTarget());
			m.put("thisWeekWorkPlan", report.getThisWeekWorkPlan());
			m.put("thisWeekFinishTime", report.getThisWeekFinishTime());
			m.put("thisWeekContent", report.getThisWeekContent());
			m.put("thisWeekTarget", report.getThisWeekTarget());
			m.put("finishStatus", report.getFinishStatus());
			m.put("finishRatio", report.getFinishRatio());
			m.put("uniqueFlag", report.getUniqueFlag());
			
			rows.add(m);
		}
		
		String result = "";
		resultJson.put("rows", rows);
		
		result = JSONUtil.serialize(resultJson);
		
		return result;
	}

	@Override
	public void saveShowReport(Map<String, List<Report>> map) {
		List<Report> updateList = map.get("updateList");
		List<Report> insertList = map.get("insertList");
		
		for(Report report : updateList){
			commonDao.updateByBase(Namespace.REPORT + ".updateShowReport", report);
		}
		for(Report report : insertList){
			commonDao.insert(Namespace.REPORT + ".saveReport", report);
		}
	}

	@Override
	public void deleteReportByReportid(String reportIds) {
		commonDao.deleteByField(Namespace.REPORT + ".deleteReportByReportid", reportIds);
		
	}

}
