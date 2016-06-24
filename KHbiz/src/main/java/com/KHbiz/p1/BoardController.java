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
	
	@RequestMapping(value="/boardPreview")
	public void boardPreview(Model model){
		boardService.boardPreview(model);	
	}
	
	@RequestMapping(value="/boardOnePreview")
	public void boardOnePreview(@RequestParam int num, Model model){
		boardService.boardOnePreview(num,model);
	}
	
	//리플
	@RequestMapping(value="reply", method=RequestMethod.POST)
	public String reply(@ModelAttribute ReplyDTO replyDTO, int num){
		replyDTO.setRef(num);
		boardService.reply(replyDTO);
		return "redirect:/board/boardView?num="+num;
	}
	
	//글 보기
	@RequestMapping(value="/boardView")
	public void boardView(@RequestParam int num, Model model){
		boardService.boardView(num,model);
		boardService.replyView(num,model);
	}
	
	//글 쓰기 폼
	@RequestMapping(value="/boardWrite",method=RequestMethod.GET)
	public void writeForm(){		
	}
	
	// 글 쓰기
	@RequestMapping(value="/boardWrite",method=RequestMethod.POST)
	public String boardWrite(@ModelAttribute BoardDTO boardDTO){
		boardService.boardWrite(boardDTO);
		String kind = boardDTO.getKind();
		return "redirect:/board/boardList?curPage=1&kind="+kind;
	}
	
	//검색
	@RequestMapping(value="/search", method=RequestMethod.GET)	
	public String search(@ModelAttribute MakePage mp,String kind,Model model,@RequestParam(defaultValue="1") int curPage){
		if(curPage == 0){
			curPage = 1;
		}
		boardService.search(mp,model,kind,curPage);
		return "board/boardList";
	}
	
	//리스트
	@RequestMapping(value="/boardList",method=RequestMethod.GET)	
	public void boardlist(@RequestParam(defaultValue="1") int curPage, String kind, Model model,MakePage mp){	
		boardService.list(curPage,kind, model,mp);		
	}
	
	//수정폼
	@RequestMapping(value="/boardUpdate",method=RequestMethod.GET)
	public void updateForm(@RequestParam int num, Model model){
		boardService.boardView(num,model);
	}
	
	//수정
	@RequestMapping(value="/boardUpdate1", method=RequestMethod.POST)
	public String boardUpdate1(@ModelAttribute BoardDTO boardDTO){
		boardService.boardUpdate1(boardDTO);
		String kind = boardDTO.getKind();
		return "redirect:/board/boardList?curPage=1&kind="+kind;
	}
	
	//삭제
	@RequestMapping(value="/boardDelete", method=RequestMethod.GET)
	public String boardDelete(@RequestParam int num, String kind){		
		String kind1 = kind;
		boardService.boardDelete(num);
		return "redirect:/board/boardList?curPage=1&kind="+kind1;
	}
	
}
