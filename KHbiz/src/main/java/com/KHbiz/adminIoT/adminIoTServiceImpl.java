package com.KHbiz.adminIoT;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class adminIoTServiceImpl implements adminIoTService {

	@Autowired
	adminIoTDAO adminIoTDAO;
	
	
	//콘센트 상태 업데이트
	@Override
	public int concentUpdate(adminIoTDTO adminIoTDTO) {
		System.out.println("update Service 들어옴");
		
		return adminIoTDAO.concentUpdate(adminIoTDTO);
	}
	
	@Override
	public List<adminIoTDTO> concentList() {
		
		
		//콘센트 리스트 뽑기
		return adminIoTDAO.concentList();
	}
	@Override
	public adminIoTDTO concentState(adminIoTDTO adminIoTDTO) {
		
		return adminIoTDAO.concentState(adminIoTDTO);
	}
	@Override
	public int concentInsert(adminIoTDTO adminIoTDTO) {
		
		return adminIoTDAO.concentInsert(adminIoTDTO);
	}
}
