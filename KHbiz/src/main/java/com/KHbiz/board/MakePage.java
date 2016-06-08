package com.KHbiz.board;
public class MakePage {
	private String searchType;
	private String searchWord;	
	private String kind;
	private int startRow; 
	private int lastRow;
	private int startNum;
	private int lastNum;
	private int totalBlock;
	private int curBlock;
	private int perPage;
	private int perBlock;
	private int curPage;
	private int totalList;
	
	
	public MakePage() {}
	public MakePage(int curPage, int totalList){
		perPage = 10;
		perBlock = 10;
		setMember(curPage, totalList);
	}
	
	private void setMember(int curPage, int totalList){
		this.startRow = (curPage - 1) * perPage + 1;
		this.lastRow = curPage * perPage;
		int totalPage = sum(totalList, perPage);
		totalBlock = sum(totalPage,perBlock);
		curBlock = sum(curPage, perBlock);
		startNum = (curBlock - 1) * perBlock + 1;
		if(curBlock == totalBlock){
			lastNum = totalPage;
		}else{
			lastNum = curBlock * perBlock;
		}
	}
	
	private int sum(int num1, int num2){
		int num = 0;
		if(num1 % num2 == 0){
			num = num1 / num2;
		}else{
			num = num1 / num2 +1;
		}
		return num;
	}
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotalList() {
		return totalList;
	}
	public void setTotalList(int totalList) {
		this.totalList = totalList;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
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
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
}
