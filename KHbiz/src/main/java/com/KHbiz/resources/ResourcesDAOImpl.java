package com.KHbiz.resources;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResourcesDAOImpl implements ResourcesDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "ResourcesMapper.";
	
	@Override
	public List<ResourcesDTO> allselect() throws Exception {
		return sqlSession.selectList(namespace+"allselect");
	}
	
	@Override
	public void bookresource(StatusDTO statusDTO) throws Exception {
		sqlSession.insert(namespace+"bookresource", statusDTO);
	}
	
	@Override
	public List<StatusDTO> booklist(int code) throws Exception {
		return sqlSession.selectList(namespace+"booklist", code);
	}
}
