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
import com.KHbiz.board.MakePage;
import com.KHbiz.board.ReplyDTO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	private BoardService boardService;
	
	
	
	@RequestMapping(value="reply", method=RequestMethod.POST)
	public String reply(@ModelAttribute ReplyDTO replyDTO, int num){
		replyDTO.setRef(num);
		boardService.reply(replyDTO);
		return "redirect:/board/boardView?num="+num;
	}
	
	@RequestMapping(value="/boardView")
	public void boardView(@RequestParam int num, Model model){
		boardService.boardView(num,model);
		boardService.replyView(num,model);
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
	
	@RequestMapping(value="/search", method=RequestMethod.GET)	//검색
	public String search(@ModelAttribute MakePage mp,String kind,Model model,int curPage){
		boardService.search(mp,model,kind,curPage);
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardList",method=RequestMethod.GET)	//검색어 없을때
	public void boardlist(@RequestParam(defaultValue="1") int curPage, String kind, Model model){
		boardService.list(curPage, model, kind);
	}
	
	@RequestMapping(value="/boardList",method=RequestMethod.POST)	//검색어 있을때
	public void boardlist(@RequestParam(defaultValue="1") int curPage, String kind, Model model, @ModelAttribute MakePage mp){
		boardService.list(curPage, model, kind, mp);
	}
	
	
	@RequestMapping(value="/boardUpdate",method=RequestMethod.GET)
	public void updateForm(@RequestParam int num, Model model){
		boardService.boardView(num,model);
	}
	
	@RequestMapping(value="/boardUpdate1", method=RequestMethod.POST)
	public String boardUpdate1(@ModelAttribute BoardDTO boardDTO){
		boardService.boardUpdate1(boardDTO);
		String kind = boardDTO.getKind();
		return "redirect:/board/boardList?curPage=1&kind="+kind;
	}
	
	
	@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
	public String boardDelete(@RequestParam int num, String kind){		
		String kind1 = kind;
		boardService.boardDelete(num);
		return "redirect:/board/boardList?curPage=1&kind="+kind1;
	}
	
}
