package com.KHbiz.note;

public class NoteDTO {
	
	private int num;
	private String send_id;
	private String to_id;
	private String title;
	private String contents;
	private int state;
	private String reg_date;
	private String division;
	private String position;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
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
