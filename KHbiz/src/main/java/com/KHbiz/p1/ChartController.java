package com.KHbiz.p1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/organizationChart/*")
public class ChartController {
	
	@RequestMapping(value="/allChart")
	public void chart(){
		
	}
}
