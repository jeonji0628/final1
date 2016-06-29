package com.KHbiz.commute;

import java.sql.Date;

public class CommuteDTO {
	
	private String id;
	private String starttime;
	private String fintime;
	private int state;
	private String memo;
	private String reg_date;
	private int total_h;
	private int total_m;
	
	
	//state == 0 결근
	//state == 1 지각
	//state == 2 사유 퇴근
	//state == 3 정상퇴근
	
	public int getTotal_h() {
		return total_h;
	}
	public void setTotal_h(int total_h) {
		this.total_h = total_h;
	}
	public int getTotal_m() {
		return total_m;
	}
	public void setTotal_m(int total_m) {
		this.total_m = total_m;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getFintime() {
		return fintime;
	}
	public void setFintime(String fintime) {
		this.fintime = fintime;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	

}
