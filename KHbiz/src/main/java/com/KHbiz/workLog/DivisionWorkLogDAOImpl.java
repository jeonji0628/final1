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
	public void divisionWorkLogUpdate(DivisionWorkLogDTO ddto) throws Exception {
		sqlSession.update(Namespace+"update",ddto);		
	}
	
	@Override
	public DivisionWorkLogDTO divisionWorkLogUpdateForm(int num) throws Exception {
		
		return sqlSession.selectOne(Namespace+"divisionWorkLogUpdateForm",num);
	}
	
	@Override
	public void divisionWorkLogDelete(int num) throws Exception {
		sqlSession.delete(Namespace+"delete",num);		
	}
	
	@Override
	public void divisionWorkLogListUpdate(DivisionWorkLogDTO ddto) throws Exception {
		sqlSession.update(Namespace+"listUpdate",ddto);		
	}	
	
	@Override
	public DivisionWorkLogDTO divisionWorkLogOneView(int num) throws Exception {
		return sqlSession.selectOne(Namespace+"view",num);
	}
	
	@Override
	public void divisionWorkLogWrite(DivisionWorkLogDTO ddto) throws Exception {
		sqlSession.insert(Namespace+"write",ddto);		
	}
	
	@Override
	public List<DivisionWorkLogDTO> list(DivisionWorkLogDTO ddto) throws Exception {
		int grade = ddto.getGrade();					
			List<DivisionWorkLogDTO> ar = sqlSession.selectList(Namespace+"list",ddto);			
			for(int i=0;i<ar.size();i++){
				ar.get(i).setGrade(grade);						
		}		
			return ar;
		
}
}
