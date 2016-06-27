package com.KHbiz.approval;

public class ApprovalDTO {
	private int num;
	private String title;
	private String decider1;
	private String decider2;
	private String contents;
	private String startday;
	private String lastday;
	private String name;
	private String id;
	private String division;
	private String position;
	private String reg_date;
	private String app_date;
	private String com_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getCom_date() {
		return com_date;
	}
	public void setCom_date(String com_date) {
		this.com_date = com_date;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getApp_date() {
		return app_date;
	}
	public void setApp_date(String app_date) {
		this.app_date = app_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDecider1() {
		return decider1;
	}
	public void setDecider1(String decider1) {
		this.decider1 = decider1;
	}
	public String getDecider2() {
		return decider2;
	}
	public void setDecider2(String decider2) {
		this.decider2 = decider2;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getLastday() {
		return lastday;
	}
	public void setLastday(String lastday) {
		this.lastday = lastday;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}


}
