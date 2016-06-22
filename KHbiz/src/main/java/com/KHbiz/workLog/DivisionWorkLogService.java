package com.KHbiz.workLog;

import org.springframework.ui.Model;

public interface DivisionWorkLogService {

	public void divisionWorkLogList(DivisionWorkLogDTO ddto, Model model);

	public void divisionWorkLogWrite(DivisionWorkLogDTO ddto);
}
