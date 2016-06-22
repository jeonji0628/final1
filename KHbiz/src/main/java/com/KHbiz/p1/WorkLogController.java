package com.KHbiz.p1;

import java.sql.Date;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.KHbiz.workLog.WorkLogDAO;
import com.KHbiz.workLog.WorkLogDTO;
import com.KHbiz.workLog.WorkLogService;
@Controller
@RequestMapping("/workLog/*")
public class WorkLogController {
	
	@Inject
	private WorkLogService workLogService;
	
	//글쓰기 폼
	@RequestMapping(value="/workLogWrite",method=RequestMethod.GET)
	public void writeForm(){}
	
	//수정폼
	@RequestMapping(value="workLogUpdate", method=RequestMethod.GET)
	public void updateForm(@RequestParam int num, Model model){
		workLogService.workLogUpdateForm(num, model);
	}
	
	@RequestMapping(value="workLogOneView", method=RequestMethod.GET)
	public void workLogOneView(int num,Model model){		
		workLogService.workLogView(num, model);	
	}
	
	
	
	@RequestMapping(value="workLogUpdate",method=RequestMethod.POST)
	public String workLogUpdate(@ModelAttribute WorkLogDTO wdto,@RequestParam(value="reg", defaultValue="1") String reg, String gra, String divi){
		String gra1 = gra;
		if(gra.equals("사원")){
			wdto.setGrade(1);
		}else if(gra.equals("주임")){
			wdto.setGrade(2);
		}else if(gra.equals("대리")){
			wdto.setGrade(3);
		}else if(gra.equals("과장")){
			wdto.setGrade(4);
		}else if(gra.equals("차장")){
			wdto.setGrade(5);
		}else if(gra.equals("부장")){
			wdto.setGrade(6);
		}else if(gra.equals("실장")){
			wdto.setGrade(7);
		}else if(gra.equals("이사")){
			wdto.setGrade(8);
		}else if(gra.equals("대표이사")){
			wdto.setGrade(9);
			}	
	
		String yyyy = reg.substring(0,4);			
		String mm = reg.substring(5,7);			
		String dd = reg.substring(8,10);
		reg = yyyy+mm+dd;
		String id= wdto.getId();
		String state = wdto.getState();			
		workLogService.workLogUpdate(wdto);		
		return "redirect:/workLog/workLogList?id="+id+"&state="+state+"&reg="+reg+"&gra="+gra1+"&divi="+divi;
	}
	
	//글쓰기
	@RequestMapping(value="/workLogWrite",method=RequestMethod.POST)
	public String workLogWrite(@ModelAttribute WorkLogDTO wdto,String gra, String divi,@RequestParam(value="reg", defaultValue="1") String reg){
		if(gra.equals("사원")){
			wdto.setGrade(1);
		}else if(gra.equals("주임")){
			wdto.setGrade(2);
		}else if(gra.equals("대리")){
			wdto.setGrade(3);
		}else if(gra.equals("과장")){
			wdto.setGrade(4);
		}else if(gra.equals("차장")){
			wdto.setGrade(5);
		}else if(gra.equals("부장")){
			wdto.setGrade(6);
		}else if(gra.equals("실장")){
			wdto.setGrade(7);
		}else if(gra.equals("이사")){
			wdto.setGrade(8);
		}else if(gra.equals("대표이사")){
			wdto.setGrade(9);
			}			
		String gra1 = gra;
		String divi1 = divi;		
		String id = wdto.getId();
		wdto.setDivision(divi1);
		workLogService.workLogWrite(wdto);
		String state = wdto.getState();
		
		if(reg.equals("1")){
			Calendar ca = Calendar.getInstance();
			Date d = new Date(ca.getTimeInMillis());
			wdto.setReg_date(d);			
		}else {
			String yyyy = reg.substring(0,4);			
			String mm = reg.substring(4,6);			
			String dd = reg.substring(6,8);
			reg = yyyy+"-"+mm+"-"+dd;
			wdto.setReg_date(Date.valueOf(reg));
		}
		
		return "redirect:/workLog/workLogList?id="+id+"&state="+state+"&reg="+reg+"&gra="+gra1+"&divi="+divi1;
	}
	
	@RequestMapping(value="/workLogDelete")
	public String workLogDelete(@RequestParam int num, WorkLogDTO wdto, String reg, String gra, String divi){	
		String id = wdto.getId();
		String state = wdto.getState();
		workLogService.workLogDelete(num);
			
		return "redirect:/workLog/workLogList?id="+id+"&state="+state+"&reg="+reg+"&gra="+gra+"&divi="+divi;
	}
	
	@RequestMapping(value="/workLogListUpdate")
	public String workLogListUpdate(@ModelAttribute WorkLogDTO wdto,String gra,String divi,String reg){
		
		if(gra.equals("사원")){
			wdto.setGrade(1);
		}else if(gra.equals("주임")){
			wdto.setGrade(2);
		}else if(gra.equals("대리")){
			wdto.setGrade(3);
		}else if(gra.equals("과장")){
			wdto.setGrade(4);
		}else if(gra.equals("차장")){
			wdto.setGrade(5);
		}else if(gra.equals("부장")){
			wdto.setGrade(6);
		}else if(gra.equals("실장")){
			wdto.setGrade(7);
		}else if(gra.equals("이사")){
			wdto.setGrade(8);
		}else if(gra.equals("대표이사")){
			wdto.setGrade(9);
			}
		String id = wdto.getPayment_id();
		String gra1 = gra;
		String divi1 = divi;		
		workLogService.workLogListUpdate(wdto);
		String state = wdto.getState();
		
		return "redirect:/workLog/workLogList?id="+id+"&state="+state+"&reg="+reg+"&gra="+gra1+"&divi="+divi1;
	}
	
	//리스트
	@RequestMapping(value="/workLogList")
	public void workLogList(@RequestParam(value="reg", defaultValue="1") String reg, WorkLogDTO wdto, Model model,String gra,String divi){
		
		if(gra.equals("사원")){
			wdto.setGrade(1);
		}else if(gra.equals("주임")){
			wdto.setGrade(2);
		}else if(gra.equals("대리")){
			wdto.setGrade(3);
		}else if(gra.equals("과장")){
			wdto.setGrade(4);
		}else if(gra.equals("차장")){
			wdto.setGrade(5);
		}else if(gra.equals("부장")){
			wdto.setGrade(6);
		}else if(gra.equals("실장")){
			wdto.setGrade(7);
		}else if(gra.equals("이사")){
			wdto.setGrade(8);
		}else if(gra.equals("대표이사")){
			wdto.setGrade(9);
		}
		
		if(reg.equals("1")){
			Calendar ca = Calendar.getInstance();
			Date d = new Date(ca.getTimeInMillis());
			wdto.setReg_date(d);			
		}else {
			String yyyy = reg.substring(0,4);			
			String mm = reg.substring(4,6);			
			String dd = reg.substring(6,8);
			reg = yyyy+"-"+mm+"-"+dd;
			wdto.setReg_date(Date.valueOf(reg));
		}			
		
		wdto.setDivision(divi);
		workLogService.workLogList(wdto,model); //num, id, state, reg_date, (payment_state, payment_id)
	}

}
