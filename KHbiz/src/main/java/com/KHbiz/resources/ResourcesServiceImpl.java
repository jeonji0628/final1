package com.KHbiz.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KHbiz.approval.statusDTO;

@Service
public class ResourcesServiceImpl implements ResourcesService {

	@Autowired
	private ResourcesDAO resourcesDAO;
	
	@Override
	public void allselect(Model model) {
		List<ResourcesDTO> ar = null;
		try {
			ar = resourcesDAO.allselect();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("resources", ar);
	}
	
	@Override
	public void bookresource(StatusDTO statusDTO, Model model) {
		System.out.println(statusDTO.getStartday()); 
		try {
			resourcesDAO.bookresource(statusDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void booklist(int code, Model model) {
		List<StatusDTO> ar = null;
		try {
			 ar = resourcesDAO.booklist(code);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("booklist", ar);
	}
}
