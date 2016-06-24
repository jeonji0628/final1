package com.KHbiz.workLog;

import java.sql.Date;

public class WorkLogDTO {

	private String id;
	private String dailyPlan;
	private String dailyResult;
	private String state;
	private String noted;
	private String upload;
	private Date reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDailyPlan() {
		return dailyPlan;
	}
	public void setDailyPlan(String dailyPlan) {
		this.dailyPlan = dailyPlan;
	}
	public String getDailyResult() {
		return dailyResult;
	}
	public void setDailyResult(String dailyResult) {
		this.dailyResult = dailyResult;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getNoted() {
		return noted;
	}
	public void setNoted(String noted) {
		this.noted = noted;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
}
