package com.KHbiz.board;

import java.util.List;

public interface BoardDAO {
	
	public void reply(ReplyDTO replyDTO) throws Exception;
	
	public List<ReplyDTO> replyView(int num) throws Exception;

	public List<BoardDTO> search(BoardSearchType boardSearchType) throws Exception;
	
	public List<BoardDTO> list(MakePage p) throws Exception;
	
	public int totalList(String kind) throws Exception;
	
	public void boardWrite(BoardDTO boardDTO) throws Exception;
	
	public BoardDTO boardView(int num) throws Exception;
	
	public void boardDelete(int num) throws Exception;
	
	public void boardUpdate1(BoardDTO boardDTO) throws Exception;
}
