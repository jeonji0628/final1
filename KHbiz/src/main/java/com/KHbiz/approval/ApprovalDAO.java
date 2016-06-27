package com.KHbiz.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

public interface ApprovalDAO {
	public List<ApprovalListDTO> applist(HashMap<String, Object> hs) throws Exception;
	public void appupdate(List<Integer> ar) throws Exception;
	public int count() throws Exception;
	public void forminsert(ApprovalDTO approvalDTO) throws Exception;
	public void approval(ApprovalDTO approvalDTO) throws Exception;
	public List<ApprovalListDTO> searchApproval(HashMap<String, Object> hs) throws Exception;
	public int searchcount(HashMap<String, Object> hs) throws Exception;
	public ApprovalDTO appselect(int num) throws Exception;
	public ApprovalListDTO appselect_img(int num) throws Exception;
	public void formupdate(ApprovalDTO approvalDTO) throws Exception;
	public void formdelete(int num) throws Exception;
	public void approvalupdate(ApprovalDTO approvalDTO) throws Exception;
	public void approvaldelete(int num) throws Exception;
	public List<ApprovalListDTO> receivelist(HashMap<String, Object> hs) throws Exception;
	public int receivecount(HashMap<String, Object> hs) throws Exception;
	public List<ApprovalListDTO> ceolist(HashMap<String, Integer> hs) throws Exception;
	public int ceocount() throws Exception;
	public List<ApprovalDTO> ongoingapproval(String id) throws Exception;
	public void approvalreturn(int num) throws Exception;
	public void approvalcomplete(int num) throws Exception;
	public List<ApprovalListDTO> completelist(HashMap<String, Object> hs) throws Exception;
	public int completecount(HashMap<String, Object> hs)throws Exception;
}
