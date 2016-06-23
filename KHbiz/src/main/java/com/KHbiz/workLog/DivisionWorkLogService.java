package com.KHbiz.workLog;

import org.springframework.ui.Model;

public interface DivisionWorkLogService {
	
	public void divisionWorkLogUpdate(DivisionWorkLogDTO ddto);
	
	public void divisionWorkLogUpdateForm(int num, Model model);
	
	public void divisionWorkLogDelete(int num);

	public void divisionWorkLogListUpdate(DivisionWorkLogDTO ddto);
	
	public void divisionWorkLogList(DivisionWorkLogDTO ddto, Model model);

	public void divisionWorkLogWrite(DivisionWorkLogDTO ddto);
	
	public void divisionWorkLogOneView(int num, Model model);
}
