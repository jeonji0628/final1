package com.KHbiz.p1;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KHbiz.schedule.scheduleDTO;
import com.KHbiz.schedule.scheduleService;

@Controller
@RequestMapping("/schedule/*")
public class SchedulerController {

	@Autowired
	private scheduleService scheduleService;
	
	@RequestMapping("/scheduler")
	public void scheduler(@ModelAttribute scheduleDTO scheduleDTO, HttpServletRequest request){
		scheduleService.schdulerlist(scheduleDTO, request);
	}
	
	@RequestMapping("/scheduleform")
	public String scheduleform(@ModelAttribute scheduleDTO scheduleDTO){
		scheduleService.schedulerform(scheduleDTO);
		return "redirect:/schedule/scheduler?id="+scheduleDTO.getId();
	}
	
	@RequestMapping("/schedulerview")
	public void schedulerview(@ModelAttribute scheduleDTO scheduleDTO, Model model){
		if(scheduleDTO.getId() != null){
			scheduleService.schedulerview(scheduleDTO, model);			
		}else{
			model.addAttribute("view", scheduleDTO);
		}
	}
	
}
