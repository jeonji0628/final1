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
	
	//회원가입
	@Override
	public void join(MemberDTO memberDTO){
		try {
			memberDAO.join(memberDTO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//회원수정
	@Override
	public MemberDTO update(MemberDTO memberDTO) {
		try {
			memberDAO.update(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberDTO;
	}
	
	//회원탈퇴
	@Override
	public MemberDTO delete(MemberDTO memberDTO) {
		try {
			memberDAO.delete(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberDTO;
	}
	
	//아이디 중복확인
	@Override
	public String idCheck(String id, MemberDTO memberDTO){
		String result="";
		try {
			memberDTO=memberDAO.idCheck(id);
			if(memberDTO==null){
				result="사용 가능한 아이디 입니다.";
			}else{
				result="사용 불가능한 아이디 입니다.";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	//계정찾기
	@Override
	public MemberDTO idFind(MemberDTO memberDTO) {
		if(memberDTO.getEmail()!=null){
			try {
				memberDTO = memberDAO.idFindEmail(memberDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				memberDTO = memberDAO.idFindPhone(memberDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return memberDTO;
	}
}
