package com.KHbiz.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired	
	private MemberDAO memberDAO;
	
	//로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		try {
			memberDTO = memberDAO.login(memberDTO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return memberDTO;
	}
	
	//로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
