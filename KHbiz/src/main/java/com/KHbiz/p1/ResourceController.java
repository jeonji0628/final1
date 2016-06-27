package com.KHbiz.p1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KHbiz.resources.ResourcesService;
import com.KHbiz.resources.StatusDTO;

@Controller
@RequestMapping("/resources/*")
public class ResourceController {

	@Autowired
	private ResourcesService resourcesService;
	
	@RequestMapping("/allresources")
	public void allresources(Model model){
		resourcesService.allselect(model);
	}
	
	@RequestMapping("/bookresources")
	public String bookresources(StatusDTO statusDTO, Model model){
		resourcesService.bookresource(statusDTO, model);
		return "redirect:/resources/allresources";
	}
	
	@RequestMapping("/booklist")
	public void booklist(@RequestParam int code, Model model){
		resourcesService.booklist(code, model);
	}
	
}
