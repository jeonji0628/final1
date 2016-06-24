package com.KHbiz.board;

import java.util.List;

public interface BoardDAO {
	
	public BoardDTO boardOnePreview(int num) throws Exception;
	
	public List<BoardDTO> boardPreview(String kind) throws Exception;
	
	public int replyNum(int num) throws Exception;
	
	public List<BoardDTO> search1(MakePage mp) throws Exception;
	
	public void reply(ReplyDTO replyDTO) throws Exception;
	
	public List<ReplyDTO> replyView(int num) throws Exception;

	public List<BoardDTO> search(MakePage mp) throws Exception;
	
	public List<BoardDTO> list(MakePage mp) throws Exception;
	
	public int totalList(String kind) throws Exception;
	
	public void boardWrite(BoardDTO boardDTO) throws Exception;
	
	public BoardDTO boardView(int num) throws Exception;
	
	public void boardDelete(int num) throws Exception;
	
	public void boardUpdate1(BoardDTO boardDTO) throws Exception;
}
