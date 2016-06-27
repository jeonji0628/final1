package com.KHbiz.p1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KHbiz.approval.ApprovalDTO;
import com.KHbiz.approval.ApprovalService;
import com.KHbiz.member.MemberService;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ApprovalService approvalService;
	
	
	@RequestMapping("/approvalRegister")
	public void approval(@RequestParam int curpage,@RequestParam String id, Model model){
		approvalService.applist(curpage, id, model);
	}
	
	@RequestMapping("/forminsert")
	public String form(@ModelAttribute ApprovalDTO approvalDTO, Model model){
		approvalService.forminsert(approvalDTO, model);
		return "redirect:/approval/approvalRegister?curpage=1&id="+approvalDTO.getId();
	}
	
	@RequestMapping("/selectperson")
	public void person(@RequestParam String name,Model model){
		memberService.searchApproval(name, model);
	}
	
	@RequestMapping("/searchApproval")
	public void searchApproval(@RequestParam int curpage,@RequestParam String id,@RequestParam String search ,@RequestParam String text,Model model){
		approvalService.search(curpage, id, search, text, model);
	}
	
	//결재 조회
	@RequestMapping("/reference")
	public void reference(@RequestParam int curpage,@RequestParam String id, Model model){
		approvalService.applist(curpage, id, model);
	}
	
	@RequestMapping("/changeapproval")
	public void changeapproval(@RequestParam int num,@RequestParam int state, Model model){
		approvalService.appselect(num, state, model);
	}
	
	@RequestMapping("/formupdate")
	public String formupdate(@ModelAttribute ApprovalDTO approvalDTO,@RequestParam("state") int state){
		if(state == 0){
			approvalService.formupdate(approvalDTO);
		}
		else if(state == 1){
			approvalService.approvalupdate(approvalDTO);
		}
		else{
			approvalService.approvalupdate(approvalDTO);
		}
		return "redirect:/approval/reference?curpage=1&id="+approvalDTO.getId();
	}
	
	@RequestMapping("/formdelete")
	public String formdelete(@RequestParam int num, @RequestParam String id){
		approvalService.formdelete(num);
		return "redirect:/approval/reference?curpage=1&id="+id;
	}
	
	@RequestMapping("/receiveApproval")
	public void receive(@RequestParam int curpage, @RequestParam String id, Model model){
		//대표이사 아이디로 진행중인 결재들 검색
		if(id.equals("1")){
			approvalService.ceolist(curpage, id, model);
		}else{
			approvalService.receivelist(curpage, id, model);			
		}
	}

	@RequestMapping("/ongoingapproval")
	public void ongoingapproval(@RequestParam String id,Model model){
		approvalService.ongoingapproval(id,model);
	}	
	
	@RequestMapping("/formreturn")
	public String formreturn(@RequestParam int num, @RequestParam String id){
		approvalService.approvalreturn(num);
		return "redirect:/approval/receiveApproval?curpage=1&id="+id;
	}
	
	@RequestMapping("/completeApproval")
	public void completeApproval(@RequestParam int curpage, @RequestParam String id, Model model){
		approvalService.completelist(curpage, id, model);
	}
	
	/*@RequestMapping("/searchpaging")
	public void searchpaging(@RequestParam int curpage,@RequestParam String id,@RequestParam String search ,@RequestParam String text,Model model){
		approvalService.search(curpage, id, search, text, model);
	}*/
}
