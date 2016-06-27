package com.KHbiz.member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "MemberMapper.";
	
	@Override
	public List<MemberDTO> searchApproval(String name) throws Exception {
		return sqlSession.selectList(namespace+"searchApproval", name);
	}
	
	@Override
	public void changeChart(MemberDTO memberDTO) throws Exception {
		sqlSession.update(namespace+"changeChart",memberDTO);
		
	}
	
	@Override
	public List<MemberDTO> searchChart(HashMap<String, String> hs) throws Exception {
		return sqlSession.selectList(namespace+"searchChart", hs);
	}
	
	@Override
	public int PagingChart() throws Exception {
		return sqlSession.selectOne(namespace+"PagingChart");
	}
	
	@Override
	public List<MemberDTO> AllChart(HashMap<String, Integer> hs) throws Exception {
		return sqlSession.selectList(namespace+"AllChart" , hs);
	}
	
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace+"login", memberDTO);
	}
	
	
	@Override
	public void join(MemberDTO mdto) throws Exception {
		sqlSession.insert(namespace+"join", mdto);
	}
	
	@Override
	public void update(MemberDTO memberDTO) throws Exception {
		sqlSession.update(namespace+"update", memberDTO);
	}
	
	@Override
	public void delete(MemberDTO memberDTO) throws Exception {
		sqlSession.delete(namespace+"delete", memberDTO);
	}
	
	@Override
	public MemberDTO idCheck(String id) throws Exception {
		return sqlSession.selectOne(namespace+"idCheck", id);
	}
	
	@Override
	public MemberDTO idFindEmail(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace+"idFindEmail",memberDTO);
	}
	
	@Override
	public MemberDTO idFindPhone(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace+"idFindPhone",memberDTO);
		
	}
}
