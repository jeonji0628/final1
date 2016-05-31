package com.KHbiz.board;

import java.util.List;

public interface BoardDAO {

	public List<BoardDTO> list(MakePage p) throws Exception;
	
	public int totalList() throws Exception;
	
	public void boardWrite(BoardDTO boardDTO) throws Exception;
	
	public BoardDTO boardView(int num) throws Exception;
	
	public void boardDelete(int num) throws Exception;
	
	public void boardUpdate1(BoardDTO boardDTO) throws Exception;
}
