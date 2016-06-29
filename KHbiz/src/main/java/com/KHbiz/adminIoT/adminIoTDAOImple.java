package com.KHbiz.adminIoT;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class adminIoTDAOImple implements adminIoTDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	private static final String NAMESPACE="IoTMapper.";
	
	//콘센트 상태 업데이트
	@Override
	public int concentUpdate(adminIoTDTO adminIoTDTO) {
		System.out.println("dao들어옴");
		return sqlSession.update(NAMESPACE+"concentUpdate", adminIoTDTO);
	}
	//콘센트 리스트 출력
	@Override
	public List<adminIoTDTO> concentList() {
		return sqlSession.selectList(NAMESPACE+"concentList");
	}
	//콘센트 번호 등록
	@Override
	public int concentInsert(adminIoTDTO adminIoTDTO) {

		return sqlSession.insert(NAMESPACE+"concentInsert", adminIoTDTO);
	}
	
	@Override
	public adminIoTDTO concentState(adminIoTDTO adminIoTDTO) {
		// TODO Auto-generated method stub
		System.out.println("tasd : "+adminIoTDTO.getAdduino());
		return sqlSession.selectOne(NAMESPACE+"concentState", adminIoTDTO);
	}
}
