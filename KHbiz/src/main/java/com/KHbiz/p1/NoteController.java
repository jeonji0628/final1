package com.KHbiz.p1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/note/*")
public class NoteController {
	@RequestMapping("/noteList")
	public void notePage(){
		
	}
}
