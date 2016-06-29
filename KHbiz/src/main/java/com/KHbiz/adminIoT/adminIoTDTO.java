package com.KHbiz.adminIoT;

import java.util.Date;

public class adminIoTDTO {
	
	private String  adduino;
	private String  position;
	private String  con_state;
	private String reg_date;
	private int num;
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getAdduino() {
		return adduino;
	}
	public void setAdduino(String adduino) {
		this.adduino = adduino;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getCon_state() {
		return con_state;
	}
	public void setCon_state(String con_state) {
		this.con_state = con_state;
	}
	    
}
