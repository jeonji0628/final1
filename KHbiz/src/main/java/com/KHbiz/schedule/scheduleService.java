package com.KHbiz.schedule;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface scheduleService {

	public void schedulerform(scheduleDTO scheduleDTO);
	public void schdulerlist(scheduleDTO scheduleDTO, HttpServletRequest request);
	public void schedulerview(scheduleDTO scheduleDTO, Model model);
}
