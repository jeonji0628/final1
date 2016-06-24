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
	public WorkLogDTO workLogView(int num) throws Exception {
		return sqlSession.selectOne(Namespace+"view",num);
		
	}
	
	@Override
	public void workLogUpdate(WorkLogDTO wdto) throws Exception {
		sqlSession.update(Namespace+"update",wdto);
	}	
	
	@Override
	public WorkLogDTO workLogUpdateForm(int num) throws Exception {
		return sqlSession.selectOne(Namespace+"workLogUpdateForm",num);
	}
	
	@Override
	public void workLogDelete(int num) throws Exception {		
		sqlSession.delete(Namespace+"delete",num);
	}
	
	@Override
	public void workLogWrite(WorkLogDTO wdto) throws Exception {
		sqlSession.insert(Namespace+"write",wdto);		
	}
	
	@Override
	public void workLogListUpdate(WorkLogDTO wdto) throws Exception {
		sqlSession.update(Namespace+"listUpdate",wdto);		
	}
	
	@Override
	public List<WorkLogDTO> list(WorkLogDTO wdto) throws Exception {
		int grade = wdto.getGrade();
		if(wdto.getGrade() > 3){
			List<WorkLogDTO> ar = sqlSession.selectList(Namespace+"list2",wdto);
			for(int i=0;i<ar.size();i++){
				ar.get(i).setGrade(grade);
			}
			return ar;
		}else{			
			List<WorkLogDTO> ar = sqlSession.selectList(Namespace+"list",wdto);
			for(int i=0;i<ar.size();i++){
				ar.get(i).setGrade(grade);
			}			
			return ar;
		}
	}
	
}
