package com.hao.po;

public class Report extends Base {

	private static final long serialVersionUID = 1L;

	private Integer reportId;
	private String assess;
	private String nextWeekWorkPlan;
	private String nextWeekFinishTime;
	private String nextWeekContent;
	private String nextWeekTarget;
	private String thisWeekWorkPlan;
	private String thisWeekFinishTime;
	private String thisWeekContent;
	private String thisWeekTarget;
	private String finishStatus;
	private String finishRatio;
	private String uniqueFlag;
	private Integer userId;

	public String getAssess() {
		return assess;
	}

	public void setAssess(String assess) {
		this.assess = assess;
	}

	public String getNextWeekWorkPlan() {
		return nextWeekWorkPlan;
	}

	public void setNextWeekWorkPlan(String nextWeekWorkPlan) {
		this.nextWeekWorkPlan = nextWeekWorkPlan;
	}

	public String getNextWeekContent() {
		return nextWeekContent;
	}

	public void setNextWeekContent(String nextWeekContent) {
		this.nextWeekContent = nextWeekContent;
	}

	public String getNextWeekTarget() {
		return nextWeekTarget;
	}

	public void setNextWeekTarget(String nextWeekTarget) {
		this.nextWeekTarget = nextWeekTarget;
	}

	public String getThisWeekWorkPlan() {
		return thisWeekWorkPlan;
	}

	public void setThisWeekWorkPlan(String thisWeekWorkPlan) {
		this.thisWeekWorkPlan = thisWeekWorkPlan;
	}

	public String getNextWeekFinishTime() {
		return nextWeekFinishTime;
	}

	public void setNextWeekFinishTime(String nextWeekFinishTime) {
		this.nextWeekFinishTime = nextWeekFinishTime;
	}

	public String getThisWeekFinishTime() {
		return thisWeekFinishTime;
	}

	public void setThisWeekFinishTime(String thisWeekFinishTime) {
		this.thisWeekFinishTime = thisWeekFinishTime;
	}

	public String getThisWeekContent() {
		return thisWeekContent;
	}

	public void setThisWeekContent(String thisWeekContent) {
		this.thisWeekContent = thisWeekContent;
	}

	public String getThisWeekTarget() {
		return thisWeekTarget;
	}

	public void setThisWeekTarget(String thisWeekTarget) {
		this.thisWeekTarget = thisWeekTarget;
	}

	public String getFinishStatus() {
		return finishStatus;
	}

	public void setFinishStatus(String finishStatus) {
		this.finishStatus = finishStatus;
	}

	public String getFinishRatio() {
		return finishRatio;
	}

	public void setFinishRatio(String finishRatio) {
		this.finishRatio = finishRatio;
	}

	public String getUniqueFlag() {
		return uniqueFlag;
	}

	public void setUniqueFlag(String uniqueFlag) {
		this.uniqueFlag = uniqueFlag;
	}

	public Integer getReportId() {
		return reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
