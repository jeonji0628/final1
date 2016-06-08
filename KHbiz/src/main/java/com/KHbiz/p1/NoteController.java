package com.KHbiz.p1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KHbiz.member.MemberDTO;
import com.KHbiz.note.NoteDTO;
import com.KHbiz.note.NoteService;

@Controller
@RequestMapping("/note/*")
public class NoteController {
	
	@Autowired
	NoteService noteservice;
	
	@RequestMapping("/noteList")
	public void notePage(@RequestParam(defaultValue="1") int curPage, Model model, String id, String state){
		noteservice.noteList(curPage,model);
		
	}
	@RequestMapping("/noteWrite")
	public void noteWrite(){
		
	}
	@RequestMapping("/search")
	public void search(){
		
	}
	@RequestMapping("/memberSearch")
	public String noteSearch(MemberDTO memberDTO, Model model){
		List<MemberDTO> list = noteservice.memberSearch(memberDTO); 
		model.addAttribute("list", list);
		return "/note/search2";
	}
	@RequestMapping("/noteSend")
	public String noteSend(NoteDTO noteDTO, Model model){
		
		int result= noteservice.sendNote(noteDTO);
		if(result>0){
			model.addAttribute("message", "글 작성 성공");
		}else{
			model.addAttribute("message", "글 작성 실패");
		}
		return "/note/noteList";
	}
	
}
