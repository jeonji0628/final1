package com.KHbiz.p1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commute/*")
public class CommuteController {
	
	
	@RequestMapping("/commuteList")
	public void commuteList(){
		System.out.println("들어옴");
	}
}
