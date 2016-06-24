package com.KHbiz.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "MemberMapper.";
	
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
