package com.KHbiz.workLog;

import org.springframework.ui.Model;

public interface WorkLogService {
	
	public void workLogView(int num, Model model);

	public void workLogList(WorkLogDTO wdto, Model model);
	
	public void workLogWrite(WorkLogDTO wdto);
	
	public void workLogListUpdate(WorkLogDTO wdto);
	
	public void workLogDelete(int num);
	
	public void workLogUpdateForm(int num, Model model);
	
	public void workLogUpdate(WorkLogDTO wdto);
}
