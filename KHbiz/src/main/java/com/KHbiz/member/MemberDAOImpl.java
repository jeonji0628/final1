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
		System.out.println("memberlogin dao 들어옴");
		return sqlSession.selectOne(namespace+"login", memberDTO);
	}
}
