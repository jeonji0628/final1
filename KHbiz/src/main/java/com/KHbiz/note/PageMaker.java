package com.KHbiz.note;

public class PageMaker {
	private int StartRow;
	private int lastRow;
	
	private String id;
	private int state;
	
	//시작번호
	private int startNum;
	//끝번호
	private int lastNum;
	//현재 블럭
	private int curBlock;
	//토탈 블럭
	private int totalBlock;
	
	private int perPage;
	private int perBlock;
	
	public PageMaker(int curPage, int totalCount){
		//curPage 현재 페이지
		
		perPage = 5; //보이는 페이지 수
		perBlock = 5; // 블럭당 페이지 수 
		setMember(curPage, totalCount);
	}
	
	private void setMember(int curPage, int totalCount){
		this.StartRow = (curPage-1) * perPage+1;
		this.lastRow = curPage * perPage;
		
		// 전체 게시물 수 
		int totalPage = 0;
		
		
		//총 페이지 수  = 전체 게시물 수  / 보이는 페이지 수  ex 10 페이지 = 100 / 10
		if(totalCount % perPage ==0){
			totalPage = totalCount / perPage;
		}else{
			totalPage = totalCount / perPage +1;
		}
		// 총 블럭 수  = 총 페이지 수 / 블럭당 페이지 수	
		if(totalPage % perBlock ==0){
			totalBlock = totalPage / perBlock;
		}else{
			totalBlock = totalPage / perBlock+1;
		}
		
		//현재 블럭 = 현제 페이지 / 블럭당 페이지 수
		if(curPage%perBlock == 0){
			curBlock = curPage / perBlock;
		}else{
			curBlock = curPage / perBlock+1;
		}
		
		//시작 번호 = (현재 페이지-1) * 블럭당 페이지 수 +1 
		//ex) 현재 페이지가 1일경우
		//시작번호 = (1-1) * 5+1 = 0 *5 +1 =1
		startNum = (curPage -1) * perBlock+1;
		
		//끝 번호 =(현재 블럭) * 블럭당 페이지 수 
		//ex) 현재 블럭 1 일경우
		//끝번호 = 1 * 5 = 5
		lastNum = curBlock*perBlock;
		
		if(curBlock == totalBlock){
			lastNum = totalPage;
		}
	}
	
	public int getStartRow() {
		return StartRow;
	}
	public void setStartRow(int startRow) {
		StartRow = startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
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
	
	
	
}
