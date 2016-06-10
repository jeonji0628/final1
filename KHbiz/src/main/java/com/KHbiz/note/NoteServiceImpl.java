package com.KHbiz.note;

import java.util.ArrayList;
import java.util.List;

import javax.xml.stream.events.NotationDeclaration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KHbiz.member.MemberDTO;

@Service
public class NoteServiceImpl implements NoteService {

	@Autowired
	NoteDAO notedao;
	
	
	
	@Override
	public void noteReadUpdate(int num) {
		
		notedao.noteReadUpdate(num);
	}
	@Override
	public void noteDelCheck(int view_state, String del_num) {
		NoteDTO noteDTO =  notedao.delCheck(del_num);
		if(view_state == 1){
			//받은메세지
			//보낸 메세지 상태가 Y면
			if(noteDTO.getSend_del().equals("Y")){
				notedao.noteDel(noteDTO);
			}else if(noteDTO.getTo_del().equals("N")){
				//update send_del == y
				notedao.toDelUpdate(noteDTO);
			}
			
		}
		if(view_state == 2){
			//보낸메세지
			//받은 메세지 상태가 Y면
			if(noteDTO.getTo_del().equals("Y")){
				//delete
				notedao.noteDel(noteDTO);
			}else if(noteDTO.getSend_del().equals("N")){
				//update to_del == y
				notedao.sendDelUpdate(noteDTO);
			}
			
		}
		
		
	}
	@Override
	public List<MemberDTO> memberSearch(MemberDTO memberDTO) {
		List<MemberDTO> list = notedao.search(memberDTO);
		
		if(list.size() == 0){
			list = null;
		}
		return list;
	}
	
	@Override
	public int sendNote(NoteDTO noteDTO) {
		int result= notedao.noteSend(noteDTO);
		
		return result;
	}
	
	@Override
	public void noteList(int curPage, Model model, String id, int state) {
		List<NoteDTO> list = null;
		PageMaker pageMaker = new PageMaker(curPage, notedao.count(state,id));
		pageMaker.setId(id);
		pageMaker.setState(state);
		list = notedao.noteList(pageMaker);
		
		//sysdate 파싱
		for(int i=0; i<list.size(); i++){
			String passing = list.get(i).getReg_date().substring(0, 16);
			list.get(i).setReg_date(passing);
		}
	
		model.addAttribute("noteList", list);
		model.addAttribute("pageMaker", pageMaker);		
	}
}
