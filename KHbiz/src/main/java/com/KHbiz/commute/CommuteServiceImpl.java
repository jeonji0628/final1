package com.KHbiz.commute;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KHbiz.member.MemberDTO;

@Service
public class CommuteServiceImpl implements CommuteService {

	@Autowired
	CommuteDAO commuteDAO;
	
	//멤버 출퇴근 서치
	@Override
	public List<CommuteDTO> commuteSearch(CommuteDTO commuteDTO) {
		
		return commuteDAO.commuteSearch(commuteDTO);
	}
	//멤버 한명 서치 
	@Override
	public MemberDTO memberSearch(MemberDTO memberDTO) {
		System.out.println("멤버 서치 서비스 들어옴 ㅎ");
		memberDTO = commuteDAO.memberSearch(memberDTO);
		System.out.println("멤버 서치 dao 무사통과");
		return memberDTO;
	}
	
	//멤버 아이디 가져오기
	@Override
	public List<MemberDTO> memberList() {
		List<MemberDTO> memberList = commuteDAO.memberList();
		return memberList;
	}
	
	//회원 출근 정보 가져오기
	@Override
	public List<CommuteDTO> commuteList(CommuteDTO commuteDTO) {
		return commuteDAO.commuteList(commuteDTO);
		
	}
	//회원 상태 업데이트
	@Override
	public void commuteStateUpdate(CommuteDTO commuteDTO) {
		commuteDAO.commuteStateUpdate(commuteDTO);
		
	}
	//비고 등록
	@Override
	public void commuteMemoUpdate(CommuteDTO commuteDTO) {
		commuteDAO.commuteMemoUpdate(commuteDTO);
	
	}
	//퇴근 시간 등록
	@Override
	public void commuteOutUpdate(CommuteDTO commuteDTO) {
		commuteDAO.commuteOutUpdate(commuteDTO);
		
	}
	//회원 정보 리스트에 뿌리기
	@Override
	public CommuteDTO commuteOneList(CommuteDTO commuteDTO) {
		
		//오늘 정보를 뽑아옴
		commuteDTO = commuteDAO.commuteCheck(commuteDTO);
		return commuteDTO;
	}
	//출근 중복 체크
	@Override
	public CommuteDTO commuteCheck(CommuteDTO commuteDTO) {
		
		commuteDTO = commuteDAO.commuteCheck(commuteDTO);
		
		return commuteDTO;
	}
	
	//출근 시간 등록
	@Override
	public void commuteInsert(CommuteDTO commuteDTO) {
		
		int result = commuteDAO.commuteInsert(commuteDTO);
		
	}
}
