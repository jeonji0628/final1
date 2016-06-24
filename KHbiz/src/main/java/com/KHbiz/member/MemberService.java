package com.KHbiz.member;

import javax.servlet.http.HttpSession;

public interface MemberService {
	
	public MemberDTO login(MemberDTO memberDTO);
	
	public void logout(HttpSession session);
	
	public void join(MemberDTO memberDTO);
	
	public MemberDTO update(MemberDTO memberDTO);
	
	public MemberDTO delete(MemberDTO memberDTO);
	
	public String idCheck(String id, MemberDTO memberDTO);
	
	public MemberDTO idFind(MemberDTO memberDTO);
}
