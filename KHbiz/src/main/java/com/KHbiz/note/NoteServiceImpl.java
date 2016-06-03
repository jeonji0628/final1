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
	public void noteList(int curPage,Model model) {
		List<NoteDTO> list = null;
		PageMaker pageMaker = new PageMaker(curPage, notedao.count());
		list = notedao.noteList(pageMaker);
		
		model.addAttribute("noteList", list);
		model.addAttribute("pageMaker", pageMaker);		
	}
}
