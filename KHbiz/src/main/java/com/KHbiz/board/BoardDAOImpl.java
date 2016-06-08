package com.KHbiz.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace="BoardMapper.";
	
	@Override
	public List<ReplyDTO> replyView(int num) throws Exception {
		List<ReplyDTO> ar = sqlSession.selectList(Namespace+"replyView",num);
		return ar;
	}
	
	/*@Override
	public int searchTotalList(MakePage mp) throws Exception {
		int result = sqlSession.selectOne(Namespace+"totalList",mp);
		return result;
	}*/
	
	/*@Override
	public int replyNum() throws Exception {
		
		return 0;
	}*/
	
	@Override
	public void reply(ReplyDTO replyDTO) throws Exception {
		sqlSession.insert(Namespace+"reply",replyDTO);
	}
	
	@Override
	public List<BoardDTO> search(MakePage mp) throws Exception {
		List<BoardDTO> ar = sqlSession.selectList(Namespace+"search",mp);
		return ar;
	}
	
	@Override
	public void boardUpdate1(BoardDTO boardDTO) throws Exception {
		sqlSession.update(Namespace+"boardUpdate",boardDTO);	
	}
	
	@Override
	public void boardDelete(int num) throws Exception {
		sqlSession.delete(Namespace+"boardDelete",num);
	}
	
	@Override
	public BoardDTO boardView(int num) throws Exception {
		
		sqlSession.update(Namespace+"countsUp",num);
		return sqlSession.selectOne(Namespace+"boardView",num);
	}
	
	@Override
	public void boardWrite(BoardDTO boardDTO) throws Exception {
		sqlSession.insert(Namespace+"boardWrite",boardDTO);
		System.out.println(boardDTO.getNum());
	}
	
	@Override
	public List<BoardDTO> list(MakePage mp) throws Exception {
		List<BoardDTO> ar = sqlSession.selectList(Namespace+"list",mp);
		return ar;
	}
	
	@Override
	public int totalList(String kind) throws Exception {
		return sqlSession.selectOne(Namespace+"totalList",kind);
	}
	
	
	
}
