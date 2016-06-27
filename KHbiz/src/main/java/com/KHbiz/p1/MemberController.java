package com.KHbiz.p1;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.KHbiz.member.MemberDTO;
import com.KHbiz.member.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member/joinForm")
	public void joinForm(){}
	
	@RequestMapping("/member/join")
	public String join(@ModelAttribute MemberDTO memberDTO,RedirectAttributes redirectAttributes,String address_etc){
		String a=memberDTO.getAddress()+" "+address_etc;
		memberDTO.setAddress(a);
		memberService.join(memberDTO);
		redirectAttributes.addFlashAttribute("message", "회원가입을 축하합니다.");
		return "redirect:/";
	}
	
	@RequestMapping("/member/idCheck")
	@ResponseBody
	public MemberDTO idCheck(String id, MemberDTO memberDTO){
		memberDTO.setId(memberService.idCheck(id, memberDTO));
		return memberDTO;	
	}
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberlogin(@ModelAttribute MemberDTO memberDTO, HttpSession session){

		memberDTO = memberService.login(memberDTO);
		session.setAttribute("member", memberDTO);
		if(memberDTO != null){
			return "home";
		}else{
			return "redirect:/";
		}
	}
	@RequestMapping("/memberLogout")
	public String memberlogout(HttpSession session){
		memberService.logout(session);
		return "redirect:/";
	}
	
	@RequestMapping("/member/idFindForm")
	public void idFindForm(){}
	
	@RequestMapping("/member/findResult")
	public void findResult(MemberDTO memberDTO, Model model){
		memberDTO = memberService.idFind(memberDTO);
		model.addAttribute("user", memberDTO);
	}
	
	@RequestMapping("/member/updateForm")
	public void updateForm(){}
	
	@RequestMapping("/member/update")
	public String update(MemberDTO memberDTO,HttpSession session, RedirectAttributes redirectAttributes, String address_etc){
		String a=memberDTO.getAddress()+" "+address_etc;
		memberDTO.setAddress(a);
		memberDTO=memberService.update(memberDTO);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/member/deleteForm")
	public void deleteForm(){}
	
	@RequestMapping("/member/delete")
	public String delete(MemberDTO memberDTO,HttpSession session){
		memberDTO=memberService.delete(memberDTO);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/member/myInfo")
	public void myInfo(){}
}
