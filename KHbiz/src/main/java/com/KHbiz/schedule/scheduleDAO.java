package com.KHbiz.schedule;

import java.util.List;

public interface scheduleDAO {
	public void schedulerform(scheduleDTO scheduleDTO) throws Exception;
	public List<scheduleDTO> schedulerlist(scheduleDTO scheduleDTO) throws Exception;
	public scheduleDTO schedulerview(scheduleDTO scheduleDTO) throws Exception;
}
