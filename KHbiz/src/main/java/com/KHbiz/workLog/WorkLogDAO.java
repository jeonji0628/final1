package com.KHbiz.workLog;

import java.util.List;

public interface WorkLogDAO {
	
	public WorkLogDTO workLogView(int num) throws Exception;

	public List<WorkLogDTO> list(WorkLogDTO wdto) throws Exception;
	
	public void workLogWrite(WorkLogDTO wdto) throws Exception;
	
	public void workLogListUpdate(WorkLogDTO wdto) throws Exception;
	
	public void workLogDelete(int num) throws Exception;
	
	public WorkLogDTO workLogUpdateForm(int num) throws Exception;
	
	public void workLogUpdate(WorkLogDTO wdto) throws Exception;
}
