package com.KHbiz.schedule;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class scheduleDAOImpl implements scheduleDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "SchedulerMapper.";
	
	@Override
	public void schedulerform(scheduleDTO scheduleDTO) throws Exception {
		if(sqlSession.selectOne(namespace+"schedulerview", scheduleDTO) == null){
			sqlSession.insert(namespace+"schedulerform", scheduleDTO);
		}else{
			sqlSession.update(namespace+"schedulerupdate", scheduleDTO);
		}
	}
	
	@Override
	public List<scheduleDTO> schedulerlist(scheduleDTO scheduleDTO) throws Exception {
		return sqlSession.selectList(namespace+"schedulerlist", scheduleDTO);
	}
	
	@Override
	public scheduleDTO schedulerview(scheduleDTO scheduleDTO) throws Exception {
		return sqlSession.selectOne(namespace+"schedulerview", scheduleDTO);
	}
}
