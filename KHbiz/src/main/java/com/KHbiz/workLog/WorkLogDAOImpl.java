package com.KHbiz.workLog;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class WorkLogDAOImpl implements WorkLogDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace="WorkLogMapper.";
	
	@Override
	public List<WorkLogDTO> list(WorkLogDTO wdto) throws Exception {
		List<WorkLogDTO> ar = sqlSession.selectList(Namespace+"list",wdto);
		return ar;
	}
	
}
