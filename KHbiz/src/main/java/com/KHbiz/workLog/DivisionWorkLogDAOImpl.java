package com.KHbiz.workLog;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DivisionWorkLogDAOImpl implements DivisionWorkLogDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace="DivisionWorkLogMapper.";
	
	@Override
	public void divisionWorkLogWrite(DivisionWorkLogDTO ddto) throws Exception {
		sqlSession.insert(Namespace+"write",ddto);		
	}
	
	@Override
	public List<DivisionWorkLogDTO> list(DivisionWorkLogDTO ddto) throws Exception {
		List<DivisionWorkLogDTO> ar = sqlSession.selectList(Namespace+"list",ddto);
		return ar;
			
}
}
