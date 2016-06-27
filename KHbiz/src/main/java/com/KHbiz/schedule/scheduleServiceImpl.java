package com.KHbiz.schedule;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class scheduleServiceImpl implements scheduleService {

	@Autowired
	private scheduleDAO scheduleDAO;
	
	@Override
	public void schedulerform(scheduleDTO scheduleDTO) {
		List<scheduleDTO> ar = null;
		try {
			scheduleDAO.schedulerform(scheduleDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void schdulerlist(scheduleDTO scheduleDTO, HttpServletRequest request) {
		List<scheduleDTO> ar = null;
		try {
			ar = scheduleDAO.schedulerlist(scheduleDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("scheduler", ar);
	}
	
	@Override
	public void schedulerview(scheduleDTO scheduleDTO, Model model) {
		try {
			String da = scheduleDTO.getDates();
			scheduleDTO = scheduleDAO.schedulerview(scheduleDTO);
			if(scheduleDTO == null){
				scheduleDTO = new scheduleDTO();
				scheduleDTO.setDates(da);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("view", scheduleDTO);
	}
}
