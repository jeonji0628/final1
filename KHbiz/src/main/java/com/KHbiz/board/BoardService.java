package com.KHbiz.board;

import org.springframework.ui.Model;

public interface BoardService {

	public void list(int curPage, Model model, String kind);

	public void boardWrite(BoardDTO boardDTO);
	
	public void boardView(int num, Model model);
	
	public void boardDelete(int num);
	
	public void boardUpdate(int num, Model model);
	
	public void boardUpdate1(BoardDTO boardDTO);
}
