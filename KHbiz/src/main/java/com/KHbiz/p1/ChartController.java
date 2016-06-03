package com.KHbiz.p1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KHbiz.member.MemberDTO;
import com.KHbiz.member.MemberService;

@Controller
@RequestMapping("/organizationChart/*")
public class ChartController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/changeChart" )
	public String change(@ModelAttribute MemberDTO memberDTO){
		memberService.ChangeChart(memberDTO);
		return "redirect:/organizationChart/allChart?curpage=1";
	}
	
	@RequestMapping(value="/updateChart")
	public void update(@ModelAttribute MemberDTO memberDTO, Model model){
		memberDTO = memberService.login(memberDTO);
		model.addAttribute("chart", memberDTO);
	}
	
	@RequestMapping(value="/searchChart")
	public void search(@RequestParam int curpage,@RequestParam("search") String search, @RequestParam("text") String text,Model model){
		memberService.searchChart(curpage, search, text, model);
	}
	
	@RequestMapping(value="/allChart")
	public void chart(@RequestParam int curpage,Model model){
		memberService.AllChart(curpage,model);
	}
	
	@RequestMapping(value="/divisionChart")
	public void divisionchart(@RequestParam int curpage,Model model){
		memberService.AllChart(curpage,model);
	}
}

