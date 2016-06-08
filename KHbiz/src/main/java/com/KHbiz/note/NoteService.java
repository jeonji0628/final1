package com.KHbiz.note;

import java.util.List;

import org.springframework.ui.Model;

import com.KHbiz.member.MemberDTO;

public interface NoteService {
	//멤버 서치
	public  List<MemberDTO> memberSearch(MemberDTO memberDTO);
	public int sendNote(NoteDTO noteDTO);
	public void noteList(int curPage,Model model, String id, int state);
	public void noteDelCheck(int state, String num_ar);
	public void noteReadUpdate(int num);
}
