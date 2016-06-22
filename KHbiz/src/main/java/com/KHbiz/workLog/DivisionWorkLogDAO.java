package com.KHbiz.workLog;

import java.util.List;

public interface DivisionWorkLogDAO {

	public List<DivisionWorkLogDTO> list(DivisionWorkLogDTO ddto) throws Exception;

	public void divisionWorkLogWrite(DivisionWorkLogDTO ddto) throws Exception;
}
