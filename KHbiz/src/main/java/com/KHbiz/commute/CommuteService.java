package com.KHbiz.commute;

import java.util.List;

import com.KHbiz.member.MemberDTO;

public interface CommuteService {
	
	//멤버 한명 정보 서치 
	public MemberDTO memberSearch(MemberDTO memberDTO);
	//출퇴근 조회
	public List<CommuteDTO> commuteSearch(CommuteDTO commuteDTO);
	//회원 정보 긁어오기
	public List<MemberDTO> memberList();
	//출근 리스트 불르기
	public List<CommuteDTO> commuteList(CommuteDTO commuteDTO);
	//회원 출근 상태 업데이트
	public void commuteStateUpdate(CommuteDTO commuteDTO);
	//회원 출근 정보 리스트에 뿌리기
	public CommuteDTO commuteOneList(CommuteDTO commuteDTO);
	//출근 중복 체크
	public CommuteDTO commuteCheck(CommuteDTO commuteDTO);
	//출근 시간 등록
	public void commuteInsert(CommuteDTO commuteDTO);
	//퇴근 시간 등록
	public void commuteOutUpdate(CommuteDTO commuteDTO);
	//비고 등록
	public void commuteMemoUpdate(CommuteDTO commuteDTO);
}
