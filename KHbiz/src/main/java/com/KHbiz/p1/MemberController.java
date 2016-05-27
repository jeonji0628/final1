package com.KHbiz.p1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KHbiz.member.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/memberLogin")
	public String memberlogin(){
		System.out.println("여기 들어옴");
		return "home";
	}
}
