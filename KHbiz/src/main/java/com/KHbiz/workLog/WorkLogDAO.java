package com.KHbiz.workLog;

import java.util.List;

public interface WorkLogDAO {

	public List<WorkLogDTO> list(WorkLogDTO wdto) throws Exception;
	
}
