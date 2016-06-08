package com.KHbiz.note;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KHbiz.member.MemberDTO;

@Repository
public class NoteDAOImpl implements NoteDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="NoteMapper.";
	
	//메세지 보낼 사람 찾기
	@Override
	public List<MemberDTO> search(MemberDTO mdto) {
		return sqlSession.selectList(NAMESPACE+"search", mdto);
	}
	//메세지 보내기	
	@Override
	public int noteSend(NoteDTO noteDTO) {
		return sqlSession.insert(NAMESPACE+"noteSend", noteDTO);
	}
	//받은 메세지 리스트
	@Override
	public List<NoteDTO> noteList(PageMaker pageMaker) {
		return sqlSession.selectList(NAMESPACE+"noteList", pageMaker);
	}
	@Override
	public int count() {
		return sqlSession.selectOne(NAMESPACE+"count");
	}
}
