package com.KHbiz.adminIoT;

import java.util.List;

public interface adminIoTService {

	//콘센트 상태 업데이트
	public int concentUpdate(adminIoTDTO adminIoTDTO);
	
	public adminIoTDTO concentState(adminIoTDTO adminIoTDTO);
	//콘센트  등록
	public int concentInsert(adminIoTDTO adminIoTDTO);
	//콘센트 등록 리스트 뽑기
	public List<adminIoTDTO> concentList();
}
