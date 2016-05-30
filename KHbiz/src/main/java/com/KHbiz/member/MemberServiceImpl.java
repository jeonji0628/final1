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
			System.out.println("memberlogin : memberservice 들어옴");
			memberDTO = memberDAO.login(memberDTO);
			
			/*System.out.println(memberDTO.getId());*/
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
