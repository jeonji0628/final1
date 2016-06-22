package com.KHbiz.p1;

import java.sql.Date;
import java.util.Calendar;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.KHbiz.workLog.DivisionWorkLogDTO;
import com.KHbiz.workLog.DivisionWorkLogService;
@Controller
@RequestMapping("/divisionWorkLog/*")
public class DivisionWorkLogController {

	@Inject
	private DivisionWorkLogService divisionWorkLogService;
	
	@RequestMapping(value="/divisionWorkLogWrite",method=RequestMethod.GET)
	public void writeForm(){}
	
	@RequestMapping(value="/divisionWorkLogWrite",method=RequestMethod.POST)
	public String divisionWorkLogWrite(@ModelAttribute DivisionWorkLogDTO ddto, String gra,String divi, @RequestParam(value="reg", defaultValue="1") String reg ){
		if(gra.equals("사원")){
			ddto.setGrade(1);
		}else if(gra.equals("주임")){
			ddto.setGrade(2);
		}else if(gra.equals("대리")){
			ddto.setGrade(3);
		}else if(gra.equals("과장")){
			ddto.setGrade(4);
		}else if(gra.equals("차장")){
			ddto.setGrade(5);
		}else if(gra.equals("부장")){
			ddto.setGrade(6);
		}else if(gra.equals("실장")){
			ddto.setGrade(7);
		}else if(gra.equals("이사")){
			ddto.setGrade(8);
		}else if(gra.equals("대표이사")){
			ddto.setGrade(9);
			}
		String gra1 = gra;
		String divi1 = divi;
		String id = ddto.getId();
		ddto.setDivision(divi1);
		divisionWorkLogService.divisionWorkLogWrite(ddto);
		String state = ddto.getState();
		
		if(reg.equals("1")){
			Calendar ca = Calendar.getInstance();
			Date d = new Date(ca.getTimeInMillis());
			ddto.setReg_date(d);			
		}else {
			String yyyy = reg.substring(0,4);			
			String mm = reg.substring(4,6);			
			String dd = reg.substring(6,8);
			reg = yyyy+"-"+mm+"-"+dd;
			ddto.setReg_date(Date.valueOf(reg));
		}
		
		
		return "redirect:/divisionWorkLog/divisionWorkLogList?id="+id+"&state="+state+"&reg="+reg+"&gra="+gra1+"&divi="+divi1;
	}
	
	
	
	@RequestMapping(value="/divisionWorkLogList")
	public void divisionWorkLogList(@RequestParam(value="reg", defaultValue="1") String reg, DivisionWorkLogDTO ddto, Model model,String gra,String divi){
		ddto.setPosition(gra);
		if(gra.equals("사원")){
			ddto.setGrade(1);;
		}else if(gra.equals("주임")){
			ddto.setGrade(2);
		}else if(gra.equals("대리")){
			ddto.setGrade(3);
		}else if(gra.equals("과장")){
			ddto.setGrade(4);
		}else if(gra.equals("차장")){
			ddto.setGrade(5);
		}else if(gra.equals("부장")){
			ddto.setGrade(6);
		}else if(gra.equals("실장")){
			ddto.setGrade(7);
		}else if(gra.equals("이사")){
			ddto.setGrade(8);
		}else if(gra.equals("대표이사")){
			ddto.setGrade(9);
		}
		
		System.out.println(ddto.getGrade());
		
		if(reg.equals("1")){
			Calendar ca = Calendar.getInstance();
			Date d = new Date(ca.getTimeInMillis());
			ddto.setReg_date(d);			
		}else {
			String yyyy = reg.substring(0,4);			
			String mm = reg.substring(4,6);			
			String dd = reg.substring(6,8);
			reg = yyyy+"-"+mm+"-"+dd;
			ddto.setReg_date(Date.valueOf(reg));
		}		
		ddto.setDivision(divi);		
		divisionWorkLogService.divisionWorkLogList(ddto,model);
		
	}
	
}
