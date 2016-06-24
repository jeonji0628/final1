package com.KHbiz.p1;

import java.sql.Date;
import java.util.Calendar;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
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

	@Autowired
	private DivisionWorkLogService divisionWorkLogService;
	
	@RequestMapping(value="/divisionWorkLogUpdate", method=RequestMethod.GET)
	public void updateForm(@RequestParam int num, Model model){
		divisionWorkLogService.divisionWorkLogUpdateForm(num, model);
	}
	
	@RequestMapping(value="/divisionWorkLogUpdate", method=RequestMethod.POST)
	public String divisionWorkLogUpdate(@ModelAttribute DivisionWorkLogDTO ddto, @RequestParam(value="reg", defaultValue="1") String reg, String gra, String divi){
		String gra1 = gra;
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
		String yyyy = reg.substring(0,4);			
		String mm = reg.substring(5,7);			
		String dd = reg.substring(8,10);
		reg = yyyy+mm+dd;
		String id= ddto.getId();
		String state = ddto.getState();
		
		System.out.println("divi:"+divi);
		System.out.println("gra1:"+gra1);
		divisionWorkLogService.divisionWorkLogUpdate(ddto);
		return "redirect:/divisionWorkLog/divisionWorkLogList?id="+id+"&state="+state+"&reg="+reg+"&gra="+gra1+"&divi="+divi;
		
	}
	
	@RequestMapping(value="/divisionWorkLogDelete")
	public String divisionWorkLogDelete(@RequestParam int num, DivisionWorkLogDTO ddto, String reg, String gra, String divi){
		String id = ddto.getId();
		String state = ddto.getState();
		
		divisionWorkLogService.divisionWorkLogDelete(num);
		
		return "redirect:/divisionWorkLog/divisionWorkLogList?id="+id+"&state="+state+"&reg="+reg+"&gra="+gra+"&divi="+divi;
	}
	
	@RequestMapping(value="divisionWorkLogOneView", method=RequestMethod.GET)
	public void divisionWorkLogOneView(int num, Model model){
		divisionWorkLogService.divisionWorkLogOneView(num,model);
	}
	
	@RequestMapping(value="/divisionWorkLogListUpdate")
	public String divisionWorkLogListUpdate(@ModelAttribute DivisionWorkLogDTO ddto, String gra, String divi, String reg){
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
		String id = ddto.getPayment_id();
		String gra1 = gra;
		String divi1 = divi;
		divisionWorkLogService.divisionWorkLogListUpdate(ddto);
		String state = ddto.getState();
		
		return "redirect:/divisionWorkLog/divisionWorkLogList?id="+id+"&state="+state+"&reg="+reg+"&gra="+gra1+"&divi="+divi1;
	}
	
	@RequestMapping(value="/divisionWorkLogWrite",method=RequestMethod.GET)
	public void writeForm(){
		
		
	}
	
	@RequestMapping(value="/divisionWorkLogWrite",method=RequestMethod.POST)
	public String divisionWorkLogWrite(@ModelAttribute DivisionWorkLogDTO ddto, String gra,String divi, @RequestParam(value="reg", defaultValue="1") String reg, Model model ){
		//division num* position job name id plan result noted state reg_date* upload* payment_state* payment_id* grade*
		ddto.setPosition(gra);
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
		String gra1 = gra;
		ddto.setPosition(gra);
		System.out.println("asdasd");
		System.out.println("일로옴");
		if(gra1.equals("사원")){
			ddto.setGrade(1);;
		}else if(gra1.equals("주임")){
			ddto.setGrade(2);
		}else if(gra1.equals("대리")){
			ddto.setGrade(3);
		}else if(gra1.equals("과장")){
			ddto.setGrade(4);
		}else if(gra1.equals("차장")){
			ddto.setGrade(5);
		}else if(gra1.equals("부장")){
			ddto.setGrade(6);
		}else if(gra1.equals("실장")){
			ddto.setGrade(7);
		}else if(gra1.equals("이사")){
			ddto.setGrade(8);
		}else if(gra1.equals("대표이사")){
			ddto.setGrade(9);
		}		
		
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
