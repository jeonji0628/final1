package com.KHbiz.p1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.KHbiz.board.BoardDTO;
import com.KHbiz.board.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/boardUpdate",method=RequestMethod.GET)
	public void updateForm(@RequestParam int num, Model model){
		System.out.println(num);
		boardService.boardView(num,model);
	}
	
	@RequestMapping(value="/boardUpdate1", method=RequestMethod.POST)
	public String boardUpdate1(@ModelAttribute BoardDTO boardDTO){
		boardService.boardUpdate1(boardDTO);
		String kind = boardDTO.getKind();
		return "redirect:/board/boardList?curPage=1&kind="+kind;
	}
	
	@RequestMapping(value="/boardView")
	public void boardView(@RequestParam int num, Model model){
		boardService.boardView(num,model);
	}
	
	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam int num, String kind){		
		boardService.boardDelete(num);
		return "redirect:/board/boardList?curPage=1&kind"+kind;	
	}
	
	@RequestMapping("/boardList")	
	public void boardlist(@RequestParam(defaultValue="1") int curPage, String kind, Model model){
	 boardService.list(curPage, model, kind);
	}
	
	@RequestMapping(value="/boardWrite",method=RequestMethod.GET)
	public void writeForm(){		
	}
	
	@RequestMapping(value="/boardWrite",method=RequestMethod.POST)
	public String boardWrite(@ModelAttribute BoardDTO boardDTO){
		boardService.boardWrite(boardDTO);
		String kind = boardDTO.getKind();
		return "redirect:/board/boardList?curPage=1&kind="+kind;
	}
	
	
}
