package com.KHbiz.adminIoT;

import java.util.List;

public interface adminIoTDAO {
	
	//콘센트 상태 업데이트 (num,con_state)받아옴
	public int concentUpdate(adminIoTDTO adminIoTDTO);
	
	public adminIoTDTO concentState(adminIoTDTO adminIoTDTO);
	//콘센트 번호 등록
	public int concentInsert(adminIoTDTO adminIoTDTO);
	//콘센트 리스트 뽑아오기
	public List<adminIoTDTO> concentList();
}
