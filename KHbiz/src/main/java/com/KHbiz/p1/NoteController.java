package com.KHbiz.p1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.KHbiz.member.MemberDTO;
import com.KHbiz.note.NoteDTO;
import com.KHbiz.note.NoteService;
import com.KHbiz.note.PageMaker;

@Controller
@RequestMapping("/note/*")
public class NoteController {
	
	@Autowired
	NoteService noteservice;
	
	@RequestMapping("/noteTitleListModel")
	public String notelistModel(String id, String contents, String date,@RequestParam int state,@RequestParam int num, Model model){
		
		model.addAttribute("id", id);
		model.addAttribute("contents", contents);
		model.addAttribute("date", date);
		model.addAttribute("state", state);
		
		//읽음 처리
		noteservice.noteReadUpdate(num);
		
		return "/note/noteTitleListModel";
	}
	@RequestMapping("/noteDel")
	public String noteDel(String del_num, String id, @RequestParam int view_state){
		
		//state == 1 받은메세지에서 옴
		
		//state == 2 보낸메세지에서 옴
		String[] num_ar = del_num.split(",");
		
		
		for(int i=1; i<num_ar.length; i++){
			
			noteservice.noteDelCheck(view_state, num_ar[i]);
			
		}
		return "redirect:/note/noteList?id="+id+"&state="+view_state;
	}
	
	@RequestMapping("/noteList")
	public String notePage(@RequestParam(defaultValue="1") int curPage, Model model, String id, @RequestParam(defaultValue="1") int state, String num){
		//state 받은메세지
		//보낸메시지 상태
		
		
		//state = 1 받은메세지함
		//state = 2 보낸메세지
		//id = memberdto id
		noteservice.noteList(curPage, model, id, state);
		
		return "/note/noteList";
	}
	
	@RequestMapping("/noteWrite")
	public void noteWrite(String id, Model model){
		model.addAttribute("id", id);
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
		noteDTO.setSend_del("N");
		noteDTO.setTo_del("N");
		int result= noteservice.sendNote(noteDTO);
		
		if(result>0){
			model.addAttribute("message", "글 작성 성공");
		}else{
			model.addAttribute("message", "글 작성 실패");
		}
		return "redirect:/note/noteList?id="+noteDTO.getSend_id()+"&state=1";
	}
	
}
