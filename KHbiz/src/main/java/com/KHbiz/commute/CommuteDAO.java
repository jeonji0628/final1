package com.KHbiz.commute;

import java.util.HashMap;
import java.util.List;

import com.KHbiz.member.MemberDTO;

public interface CommuteDAO {

	//날짜, 아이디로 가져오기
	public List<CommuteDTO> commuteSearch(CommuteDTO commuteDTO);
	//회원 한명 정보 가져오기
	public MemberDTO  memberSearch(MemberDTO memberDTO);
	//회원들의 아이디 가져오기
	public List<MemberDTO> memberList();
	//회원 상태 업데이트
	public int commuteStateUpdate(CommuteDTO commuteDTO);
	//비고 등록
	public int commuteMemoUpdate(CommuteDTO commuteDTO);
	//퇴근 시간 등록
	public int commuteOutUpdate(CommuteDTO commuteDTO);
	//출근 중복 체크
	public CommuteDTO commuteCheck(CommuteDTO commuteDTO);
	//출근 날짜 등록
	public int  commuteInsert(CommuteDTO commuteDTO);
	//회원의 출퇴근 리스트 뽑기
	public List<CommuteDTO> commuteList(CommuteDTO commuteDTO);
}
