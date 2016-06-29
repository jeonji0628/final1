package com.KHbiz.approval;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KHbiz.member.Paging;

@Service
public class ApprovalServiceimpl implements ApprovalService{

	@Autowired
	private ApprovalDAO approvalDAO;
	private int perpage = 10;
	
	//신청서 리스트
	@Override
	public void applist(int curpage, String id, Model model) {
		List<ApprovalListDTO> ar = null;
		List<Integer> ar2 = null;
		Paging paging = null;
		int start = (curpage-1) * perpage;
		int last = curpage * perpage;
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("id", id);
		hs.put("start", start);
		hs.put("last", last);
		try {
			ar = approvalDAO.applist(hs);
			if(ar.size() == 0){
				model.addAttribute("result", "결재가 비어있습니다.");
			}else{
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				for (int i = 0; i < ar.size(); i++) {
					Date da = new Date();
					Date dead = transFormat.parse(ar.get(i).getDeadline());
					int compare = da.compareTo(dead);
					if(compare > 0 && ar.get(i).getStatus().equals("대기중") || compare > 0 && ar.get(i).getStatus().equals("진행중")){
						ar2 = new ArrayList<Integer>();
						ar2.add(ar.get(i).getNum());
					}
					String passing = ar.get(i).getReg_date().substring(0, 16);
					ar.get(i).setReg_date(passing);
					passing = ar.get(i).getDeadline().substring(0, 16);
					ar.get(i).setDeadline(passing);	
				}
				if(ar2 != null){
					approvalDAO.appupdate(ar2);					
					ar = approvalDAO.applist(hs);
				}
				int total = approvalDAO.count();
				paging = new Paging(curpage, perpage, total);
				model.addAttribute("approval", ar);
				model.addAttribute("paging", paging);
			} 
		}
			catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
		
	
	//신청서 db 입력
	@Override
	public void forminsert(ApprovalDTO approvalDTO, Model model) {
		try {
			approvalDAO.forminsert(approvalDTO);
			approvalDAO.approval(approvalDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//신청서 검색
	@Override
	public void search(int curpage, String id, String search, String text, Model model) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		Paging paging = null;
		List<ApprovalListDTO> ar = null;
		int start = (curpage-1) * perpage;
		int last = curpage * perpage;
		hs.put("text", text);
		hs.put("search", search);
		hs.put("id", id);
		hs.put("start", start);
		hs.put("last", last);
		try {
			ar = approvalDAO.searchApproval(hs);
			int total = approvalDAO.searchcount(hs);
			paging = new Paging(curpage, perpage, total);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("approval", ar);
		model.addAttribute("paging", paging);
		model.addAttribute("search", search);
		model.addAttribute("text", text);
	}
	
	@Override
	public void appselect(int num ,int state, Model model) {
		ApprovalDTO approvalDTO = new ApprovalDTO();
		ApprovalListDTO approvalListDTO = new ApprovalListDTO();
		 try {
				approvalDTO = approvalDAO.appselect(num);
				approvalListDTO = approvalDAO.appselect_img(num);
				String passing = approvalDTO.getStartday().substring(0, 10);
				approvalDTO.setStartday(passing);
				passing = approvalDTO.getLastday().substring(0, 10);
				approvalDTO.setLastday(passing);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 model.addAttribute("approvalDTO", approvalDTO);
		 model.addAttribute("approvalListDTO", approvalListDTO);
		 model.addAttribute("state", state);
	}
	
	@Override
	public void formupdate(ApprovalDTO approvalDTO) {
		try {
			
			approvalDAO.formupdate(approvalDTO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void approvalupdate(ApprovalDTO approvalDTO) {
		try {
			if(approvalDTO.getId().equals("1")){
				approvalDAO.approvalcomplete(approvalDTO.getNum());
			}else{
				approvalDAO.approvalupdate(approvalDTO);				
			}
			/*approvalDAO.statusupdate(approvalDTO);*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void formdelete(int num) {
		try {
			approvalDAO.formdelete(num);
			approvalDAO.approvaldelete(num);
			/*approvalDAO.statusdelete(num);*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	@Override
	public void receivelist(int curpage,String id, Model model) {
		List<ApprovalListDTO> ar = null;
		HashMap<String, Object> hs = new HashMap<String, Object>();
		Paging paging = null;
		int start = (curpage-1) * perpage;
		int last = curpage * perpage;
		hs.put("id", id);
		hs.put("start", start);
		hs.put("last", last);
		
		try {
			ar = approvalDAO.receivelist(hs);
			int total = approvalDAO.receivecount(hs);
			paging = new Paging(curpage, perpage, total);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(ar.size() == 0){
			model.addAttribute("result", "받은 결재가 없습니다.");
		}else{
			for (int i = 0; i < ar.size(); i++) {
				String passing = ar.get(i).getReg_date().substring(0, 16);
				ar.get(i).setReg_date(passing);
				passing = ar.get(i).getDeadline().substring(0, 16);
				ar.get(i).setDeadline(passing);
			}
			model.addAttribute("approval", ar);
			model.addAttribute("paging", paging);			
		}
	}
	
	@Override
	public void ongoingapproval(String id, Model model) {
		List<ApprovalDTO> ar = null;
		try {
			ar = approvalDAO.ongoingapproval(id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(ar.size() == 0 || ar == null){
			model.addAttribute("result", "진행중인 결재가 없습니다.");
		}else{
			for (int i = 0; i < ar.size(); i++) {
				String passing = ar.get(i).getApp_date().substring(0, 16);
				ar.get(i).setApp_date(passing);
				passing = ar.get(i).getReg_date().substring(0, 16);
				ar.get(i).setReg_date(passing);
			}
			model.addAttribute("DTO", ar);			
		}
	}
	
	@Override
	public void ceolist(int curpage,String id, Model model) {
		List<ApprovalListDTO> ar = null;
		HashMap<String, Integer> hs = new HashMap<String, Integer>();
		Paging paging = null;
		int start = (curpage-1) * perpage;
		int last = curpage * perpage;
		hs.put("start", start);
		hs.put("last", last);
		try {
			ar = approvalDAO.ceolist(hs);
			int total = approvalDAO.ceocount();
			paging = new Paging(curpage, perpage, total);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(ar.size() == 0){
			model.addAttribute("result", "받은 결재가 없습니다.");
		}else{
			for (int i = 0; i < ar.size(); i++) {
				String passing = ar.get(i).getApp_date().substring(0, 16);
				ar.get(i).setApp_date(passing);
				passing = ar.get(i).getReg_date().substring(0, 16);
				ar.get(i).setReg_date(passing);
				model.addAttribute("approval", ar);
				model.addAttribute("paging", paging);
			}
		}	
	}
	
	@Override
	public void approvalreturn(int num) {
		try {
			approvalDAO.approvalreturn(num);
			/*approvalDAO.statusreturn(num);*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void completelist(int curpage, String id, Model model) {
		List<ApprovalListDTO> ar = null;
		HashMap<String, Object> hs = new HashMap<String, Object>();
		Paging paging = null;
		int start = (curpage-1) * perpage;
		int last = curpage * perpage;
		hs.put("id", id);
		hs.put("start", start);
		hs.put("last", last);
		try {
			ar = approvalDAO.completelist(hs);
			if(ar.size() == 0){
				model.addAttribute("result", "결재함이 비었습니다.");
			}else{
				for (int i = 0; i < ar.size(); i++) {
					String passing = ar.get(i).getCom_date().substring(0, 16);
					ar.get(i).setCom_date(passing);
					passing = ar.get(i).getDeadline().substring(0, 16);
					ar.get(i).setDeadline(passing);
				}	
				int total = approvalDAO.completecount(hs);
				paging = new Paging(curpage, perpage, total);
				
				model.addAttribute("approval", ar);
				model.addAttribute("paging", paging);
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
