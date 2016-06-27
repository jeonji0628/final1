package com.KHbiz.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MemberService {
	
	public MemberDTO login(MemberDTO memberDTO);
	
	public void logout(HttpSession session);
	

	public void AllChart(int curpage, Model model); //조직관리
	public void searchChart(int curpage,String search, String text, Model model);
	public void ChangeChart(MemberDTO memberDTO);
	
	public void searchApproval(String name,Model model);

	public void join(MemberDTO memberDTO);
	
	public MemberDTO update(MemberDTO memberDTO);
	
	public MemberDTO delete(MemberDTO memberDTO);
	
	public String idCheck(String id, MemberDTO memberDTO);
	
	public MemberDTO idFind(MemberDTO memberDTO);
}
