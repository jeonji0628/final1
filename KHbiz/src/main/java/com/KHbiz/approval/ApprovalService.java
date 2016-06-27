package com.KHbiz.approval;

import org.springframework.ui.Model;

public interface ApprovalService {
	public void applist(int curpage, String id, Model model);
	public void forminsert(ApprovalDTO approvalDTO, Model model);
	public void search(int curpage, String id,String search,String text , Model model);
	public void appselect(int num,int state, Model model);
	public void formupdate(ApprovalDTO approvalDTO);
	public void formdelete(int num);
	public void approvalupdate(ApprovalDTO approvalDTO);
	public void receivelist(int curpage,String id, Model model);
	public void approvalreturn(int num);
	public void ongoingapproval(String id,Model model);
	public void ceolist(int curpage, String id,Model model);
	public void completelist(int curpage, String id, Model model);
}
