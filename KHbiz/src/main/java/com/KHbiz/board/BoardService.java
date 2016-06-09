package com.KHbiz.board;

import org.springframework.ui.Model;


public interface BoardService {
	
	public void replyView(int num, Model model);
	
	public void reply(ReplyDTO replyDTO);
/*	
	public void search(MakePage mp, Model model,String kind,int curPage);
*/
	/*public void list(int curPage, String kind,Model model);*/
	
	public void list(int curPage, Model model, String kind, MakePage mp);

	public void boardWrite(BoardDTO boardDTO);
	
	public void boardView(int num, Model model);
	
	public void boardDelete(int num);
	
	public void boardUpdate(int num, Model model);
	
	public void boardUpdate1(BoardDTO boardDTO);
}
