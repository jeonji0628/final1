package com.KHbiz.note;

import java.util.List;


import com.KHbiz.member.MemberDTO;

public interface NoteDAO {
	//메세지 보낼 사람 찾기
	public List<MemberDTO> search(MemberDTO mdto);
	// 메세지 보내기
	public int noteSend(NoteDTO noteDTO);
	//받은 메세지 리스트보기
	public List<NoteDTO> noteList(PageMaker pageMaker);
	
	public int count(int state,String id);
	
	//delcheck
	public NoteDTO delCheck(String del_num);
	
	//senddelUpdate
	public int sendDelUpdate(NoteDTO noteDTO);
	
	//To_delUpdate
	public int toDelUpdate(NoteDTO noteDTO);
	
	//noteDel
	public int noteDel(NoteDTO noteDTO);
	
	//읽음처리
	public int noteReadUpdate(int num);
	
}
