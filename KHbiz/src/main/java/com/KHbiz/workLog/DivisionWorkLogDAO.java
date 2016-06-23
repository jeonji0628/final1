package com.KHbiz.workLog;

import java.util.List;

public interface DivisionWorkLogDAO {
	
	public void divisionWorkLogUpdate(DivisionWorkLogDTO ddto) throws Exception;
	
	public DivisionWorkLogDTO divisionWorkLogUpdateForm(int num) throws Exception;
	
	public void divisionWorkLogDelete(int num) throws Exception;
	
	public void divisionWorkLogListUpdate(DivisionWorkLogDTO ddto) throws Exception;

	public DivisionWorkLogDTO divisionWorkLogOneView(int num) throws Exception;
	
	public List<DivisionWorkLogDTO> list(DivisionWorkLogDTO ddto) throws Exception;

	public void divisionWorkLogWrite(DivisionWorkLogDTO ddto) throws Exception;
}
