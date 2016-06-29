package com.KHbiz.commute;

import java.util.HashMap;
import java.util.List;

import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KHbiz.member.MemberDTO;

@Repository
public class CommuteDAOImpl implements CommuteDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	private static final String NAMESPACE="CommuteMapper.";
	
	//날짜, 아이디로 가져오기
	@Override
	public List<CommuteDTO> commuteSearch(CommuteDTO commuteDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"commuteSearch", commuteDTO);
	}	
	//멤버 정보 하나 가져오기
	@Override
	public MemberDTO memberSearch(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"memberSearch", memberDTO);
	}
	//회원 이름 가져오기
	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList(NAMESPACE+"memberList");
		
	}
	//회원의 출퇴근 리스트 뽑기
	@Override
	public List<CommuteDTO> commuteList(CommuteDTO commuteDTO) {
		
		return sqlSession.selectList(NAMESPACE+"commuteList", commuteDTO);
		
	}
	
	//회원 상태 업데이트
	public int commuteStateUpdate(CommuteDTO commuteDTO){
		return sqlSession.update(NAMESPACE+"commuteStateUpdate", commuteDTO);
	}
	
	//비고 등록
	public int commuteMemoUpdate(CommuteDTO commuteDTO) {
		System.out.println("daoimpl id : " + commuteDTO.getId());
		System.out.println("daoimpl memo : " + commuteDTO.getMemo());
		System.out.println("daoimpl reg_date : " + commuteDTO.getReg_date());
		return sqlSession.update(NAMESPACE+"commuteMemoUpdate", commuteDTO);
		
	};
	//퇴근 시간 등록
	@Override
	public int commuteOutUpdate(CommuteDTO commuteDTO) {
		System.out.println("id:"+commuteDTO.getId());
		System.out.println("date:"+commuteDTO.getReg_date());
		System.out.println("finetime:"+commuteDTO.getFintime());
		return sqlSession.update(NAMESPACE+"commuteOutUpdate", commuteDTO);
	}
	//출근 시간 등록
	@Override
	public int commuteInsert(CommuteDTO commuteDTO) {
		System.out.println("daoImpl id: "+ commuteDTO.getId());
		System.out.println("daoImpl reg_date : " +commuteDTO.getReg_date());
		System.out.println("daoImpl startTime : " + commuteDTO.getStarttime());
		return sqlSession.insert(NAMESPACE+"commuteInsert", commuteDTO);
	}
	
	//출근 중복 체크
	@Override
	public CommuteDTO commuteCheck(CommuteDTO commuteDTO) {
		return sqlSession.selectOne(NAMESPACE+"commuteCheck", commuteDTO);
	}
}
