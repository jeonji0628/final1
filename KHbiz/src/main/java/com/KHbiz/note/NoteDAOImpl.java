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
	
	
	@Override
	public int noteToConut(String id) {
		// TODO Auto-generated method stub
	
		return sqlSession.selectOne(NAMESPACE+"noteToConut", id);
	}
	//읽음처리
	@Override
	public int noteReadUpdate(int num) {
		return sqlSession.update(NAMESPACE+"noteReadUpdate", num);
		
	}
	@Override
	public int noteDel(NoteDTO noteDTO) {
		
		return sqlSession.delete(NAMESPACE+"noteDel", noteDTO);
	}
	//받은 메세지 딜리트 상태 변경
	@Override
	public int toDelUpdate(NoteDTO noteDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"toDelUpdate", noteDTO);
	}
	//보낸메세지 메세지 딜리트 상태
	@Override
	public int sendDelUpdate(NoteDTO noteDTO) {
		//보낸 메세지 del 상태 y로 변경
		return sqlSession.update(NAMESPACE+"sendDelUpdate", noteDTO);
	}
	@Override
	public NoteDTO delCheck(String del_num) {
		
		int num = Integer.parseInt(del_num);
		
		return sqlSession.selectOne(NAMESPACE+"delCheck", del_num);
		
	}
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
	public int count(int state, String id) {
		NoteDTO noteDTO = new NoteDTO();
		noteDTO.setSend_id(id);
		noteDTO.setState(state);
		return sqlSession.selectOne(NAMESPACE+"count", noteDTO);
	}
}
