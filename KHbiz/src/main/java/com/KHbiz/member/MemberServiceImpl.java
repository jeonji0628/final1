package com.KHbiz.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired	
	private MemberDAO memberDAO;
	private int perpage = 10;
	
	@Override
	public void searchApproval(String name, Model model) {
		List<MemberDTO> ar = null;
		try {
			ar = memberDAO.searchApproval(name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		model.addAttribute("list", ar);
	}
	
	@Override
	public void ChangeChart(MemberDTO memberDTO) {
		try {
			memberDAO.changeChart(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void searchChart(int curpage,String search, String text,Model model) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("search", search);
		hs.put("text", text);
		List<MemberDTO> ar = null;
		Paging paging = null;
		try {
			ar = memberDAO.searchChart(hs);
			int total = ar.size();
			if(ar.size() != 0){
				paging = new Paging(curpage, perpage, total);
				model.addAttribute("paging", paging);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("result", ar);
		
	}
	
	@Override
	public void AllChart(int curpage, Model model) {
		List<MemberDTO> ar = null;
		int start = (curpage-1) * perpage;
		int last = curpage * perpage;
		HashMap<String, Integer> hs = new HashMap<String, Integer>();
		hs.put("start", start);
		hs.put("last", last);
		Paging paging = null;
		try {
			ar =  memberDAO.AllChart(hs);
			int total = memberDAO.PagingChart();
			paging = new Paging(curpage, perpage, total);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("chart",ar);
		model.addAttribute("paging", paging);
	}
	
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
