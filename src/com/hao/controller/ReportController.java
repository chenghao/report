package com.hao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.googlecode.jsonplugin.JSONException;
import com.hao.po.Report;
import com.hao.service.IReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private IReportService reportService;

	@RequestMapping(value = "/saveReport")
	public void saveReport(String param, HttpServletResponse response) throws IOException {
		List<Report> list = new ArrayList<Report>();
		Report report;
		Map<String, Object> map = new HashMap<String, Object>();
		
		String[] reports = param.split("\u0001");
		int i = 0;
		for(String str : reports){
			report = new Report();
			
			String[] reportItems = str.split("\\|");
			report.setUserId(Integer.valueOf(reportItems[0]));
			report.setUniqueFlag(reportItems[1]);
			report.setAssess(reportItems[2]);
			report.setNextWeekWorkPlan(reportItems[3]);
			String nextWeekFinishTime = reportItems[4];
			if("".equals(nextWeekFinishTime.trim())){
				report.setNextWeekFinishTime(null);
			}else{
				report.setNextWeekFinishTime(nextWeekFinishTime);
			}
			report.setNextWeekContent(reportItems[5]);
			report.setNextWeekTarget(reportItems[6]);
			report.setThisWeekWorkPlan(reportItems[7]);
			report.setThisWeekFinishTime(reportItems[8]);
			report.setThisWeekContent(reportItems[9]);
			report.setThisWeekTarget(reportItems[10]);
			report.setFinishStatus(reportItems[11]);
			report.setFinishRatio(reportItems[12]);
			
			list.add(report);
			
			if(i == 0){
				map.put("userId", report.getUserId());
				map.put("uniqueFlag", report.getUniqueFlag());
				
				i++;
			}
		}
		
		try {
			String result = "";
			result = reportService.saveReport(list, map);
				
			if (result.equals("ok")) {
				response.getWriter().print("{\"result\":\"0\"" + "}");
			} else if (result.equals("err")) {
				response.getWriter().print("{\"result\":\"1\"" + "}");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("{\"result\":\"2\"" + "}");
		}
	}
	
	@RequestMapping(value = "showSaveReport")
	public void showSaveReport(String param, HttpServletResponse response) throws IOException{
		List<Report> updateList = new ArrayList<Report>();
		List<Report> insertList = new ArrayList<Report>();
		String deleteReportIds = "";
		Report report;
		Map<String, List<Report>> map = new HashMap<String, List<Report>>();
		
		String[] params = param.split("\u0002");
		
		String[] reports = params[0].split("\u0001");
		for(String str : reports){
			report = new Report();
			
			String[] reportItems = str.split("\\|");
			report.setUserId(Integer.valueOf(reportItems[0]));
			report.setUniqueFlag(reportItems[1]);
			report.setAssess(reportItems[2]);
			report.setNextWeekWorkPlan(reportItems[3]);
			report.setNextWeekFinishTime(reportItems[4]);
			report.setNextWeekContent(reportItems[5]);
			report.setNextWeekTarget(reportItems[6]);
			report.setThisWeekWorkPlan(reportItems[7]);
			report.setThisWeekFinishTime(reportItems[8]);
			report.setThisWeekContent(reportItems[9]);
			report.setThisWeekTarget(reportItems[10]);
			report.setFinishStatus(reportItems[11]);
			report.setFinishRatio(reportItems[12]);
			
			if(!"".equals(reportItems[13].trim())){
				report.setReportId(Integer.valueOf(reportItems[13]));
				updateList.add(report);
			}else{
				insertList.add(report);
			}
		}
		
		String[] reportIds = params[1].split("\\|");
		int reportIdsLength = reportIds.length;
		for(int i = 0; i < reportIdsLength; i++){
			if(i == 0){
				deleteReportIds += reportIds[i].trim();
			}else{
				deleteReportIds += "," + reportIds[i].trim();
			}
		}
		
		map.put("updateList", updateList);
		map.put("insertList", insertList);
		
		try {
			reportService.saveShowReport(map);
			if(!"".equals(deleteReportIds)){
				reportService.deleteReportByReportid(deleteReportIds);
			}
				
			response.getWriter().print("{\"result\":\"0\"" + "}");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("{\"result\":\"1\"" + "}");
		}
	}
	
	
	@RequestMapping(value = "chooseUniqueFlag")
	@ResponseBody
	public void chooseUniqueFlag(Integer userId, HttpServletResponse response) throws IOException, JSONException{
		String result = reportService.chooseUniqueFlag(userId);
		
		response.getWriter().print(result);
	}
	
	@RequestMapping(value = "queryReportByUseridAndUniqueFlag")
	@ResponseBody
	public void queryReportByUseridAndUniqueFlag(Integer userId, String uniqueFlag, HttpServletResponse response) throws JSONException, IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("uniqueFlag", uniqueFlag);
		
		String result = reportService.queryReport(map);
		response.getWriter().print(result);
	}
	
}
