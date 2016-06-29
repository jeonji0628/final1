package com.KHbiz.p1;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHbiz.adminIoT.adminIoTDTO;
import com.KHbiz.adminIoT.adminIoTService;

@Controller
@RequestMapping("/adminIoT/*")
public class adminIoTController {

	@Autowired
	adminIoTService adminIoTService;
	
	@RequestMapping(value="/iotUpdate", method=RequestMethod.POST)
	public String iotUpdate(adminIoTDTO adminIoTDTO, Model model){
		System.out.println("iotUpdate 들어옴");
		System.out.println(adminIoTDTO.getCon_state());
		System.out.println(adminIoTDTO.getNum());
		
		adminIoTService.concentUpdate(adminIoTDTO);
		updateConcent(adminIoTDTO, model);
		return "/adminIoT/updateConcent";
	}
	//콘센트  리스트 뽑아오기
	@RequestMapping(value="/iotView", method=RequestMethod.POST)
	public void iotView(Model model){
		List<adminIoTDTO> concentList = adminIoTService.concentList();
		if(concentList != null){

			model.addAttribute("concentList", concentList);
		}
	}

	//콘센트 등록
	@RequestMapping(value="/iotInsertForm",method=RequestMethod.POST)
	public String iotInsertForm(adminIoTDTO adminIoTDTO,Model model){
	
		String []pin = adminIoTDTO.getCon_state().split(",");

		String temp="";
		for(int i=0; i<pin.length; i++){
			temp=temp+pin[i]+":OFF;";
		}
		adminIoTDTO.setCon_state(temp);
		adminIoTService.concentInsert(adminIoTDTO);
		iotView(model);
		return "adminIoT/iotView";
	}
	
	//아두이노에서 콘센트 정보 읽기
	@RequestMapping("/readConcent")
	public void readConcent(adminIoTDTO adminIoTDTO, Model model){
		adminIoTDTO.setAdduino("DEADBEEFFEED");
		adminIoTDTO = adminIoTService.concentState(adminIoTDTO);
		model.addAttribute("conState", adminIoTDTO);
	}
	
	//콘센트 정보 입력
	@RequestMapping(value="/updateConcent", method=RequestMethod.POST)
	public void updateConcent(adminIoTDTO adminIoTDTO, Model model){
		System.out.println("들어옴");
		List<adminIoTDTO> concentList = adminIoTService.concentList();
		ArrayList<String[]> passing = new ArrayList<String[]>();
		if(concentList != null){
			for(int i=0; i<concentList.size(); i++){
				passing.add(concentList.get(i).getCon_state().split(";"));
			}
			//passing 확인용
			/*for(int j=0; j<passing.size(); j++){
				System.out.println("asdasd");
				for(int k=0;k<passing.get(j).length;k++){
					System.out.println(passing.get(j)[k]);
				}
			}*/
			model.addAttribute("concentList", concentList);
			model.addAttribute("passing", passing);
		}
		
		
		/*adminIoTDTO = adminIoTService.concentState(adminIoTDTO);
		String[] temp = adminIoTDTO.getCon_state().split(";");
		model.addAttribute("conState", adminIoTDTO);
		model.addAttribute("temp", temp);*/
	}
}
