package com.KHbiz.note;

import java.util.List;

import org.springframework.ui.Model;

import com.KHbiz.member.MemberDTO;

public interface NoteService {
	//안읽은 쪽지 확인[홈에 갯수 출력]
	public int noteToConut(String id);
	//멤버 서치
	public  List<MemberDTO> memberSearch(MemberDTO memberDTO);
	//쪽지 보내기
	public int sendNote(NoteDTO noteDTO);
	//쪽지 리스트 뽑아오기
	public void noteList(int curPage,Model model, String id, int state);
	//쪽지 삭제 확인
	public void noteDelCheck(int state, String num_ar);
	//쪽지 읽음 상태 업데이트
	public void noteReadUpdate(int num);
}
