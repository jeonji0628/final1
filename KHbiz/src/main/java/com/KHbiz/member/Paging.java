package com.KHbiz.member;

public class Paging {
	private int startnum;
	private int lastnum;
	private int curblock;
	private int totalblock;
	
	public Paging(int curpage,int perpage,int total){
		int totalpage=0;
		int perblock=5;
		if(total%perpage == 0){
			totalpage = total/perpage;
		}else{
			totalpage = total/perpage+1;
		}
		
		if(totalpage%perblock == 0){
			totalblock = totalpage/perblock;
		}else{
			totalblock = totalpage/perblock+1;
		}
		
		if(curpage%perblock == 0){
			curblock = curpage/perblock;
		}else{
			curblock = curpage/perblock+1;
		}
		
		startnum = (curblock-1) * perblock+1;
		lastnum = curblock * perblock;
		if(curblock == totalblock){
			lastnum = totalpage;
		}
	}
	
	public int getStartnum() {
		return startnum;
	}
	public void setStartnum(int startnum) {
		this.startnum = startnum;
	}
	public int getLastnum() {
		return lastnum;
	}
	public void setLastnum(int lastnum) {
		this.lastnum = lastnum;
	}
	public int getCurblock() {
		return curblock;
	}
	public void setCurblock(int curblock) {
		this.curblock = curblock;
	}
	public int getTotalblock() {
		return totalblock;
	}
	public void setTotalblock(int totalblock) {
		this.totalblock = totalblock;
	}
	
}
