package com.KHbiz.p1;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHbiz.member.MemberDTO;
import com.KHbiz.member.MemberService;
import com.KHbiz.note.NoteService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	NoteService noteService;
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberlogin(@ModelAttribute MemberDTO memberDTO, HttpSession session, String id, Model model ){
		memberDTO = memberService.login(memberDTO);
		session.setAttribute("member", memberDTO);
		System.out.println(id);
		if(memberDTO != null){
			model.addAttribute("message_to", noteService.noteToConut(id));
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
}
