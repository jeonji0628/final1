package com.KHbiz.p1;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.KHbiz.commute.CommuteDTO;
import com.KHbiz.commute.CommuteService;
import com.KHbiz.member.MemberDTO;

@Controller
@RequestMapping("/commute/*")
public class CommuteController {
	//state
	@Autowired
	CommuteService commuteService;
	
	//토탈 시간 구하는 함수 
	public CommuteDTO totalTime(CommuteDTO commuteDTO){
		
		//출근 , 퇴근 시간 시,분으로 분류
		int startTime_h =Integer.parseInt(commuteDTO.getStarttime().substring(0, 2));
		int startTime_m =Integer.parseInt(commuteDTO.getStarttime().substring(3, 5));
		int finTime_h =Integer.parseInt(commuteDTO.getFintime().substring(0, 2));
		int finTime_m =Integer.parseInt(commuteDTO.getFintime().substring(3, 5));
		
		//지각, 조퇴 구분
		if(startTime_h >=9){
			if(startTime_m>0){
				//state == 1 은 지각
				commuteDTO.setState(1);
			}
		}
		
		//시간 차이 비교
		int total_h = finTime_h - startTime_h;
		int total_m = finTime_m - startTime_m;
		
		if(total_m < 0){
			total_m = total_m * -1;
		}else if(total_m > 60){
			total_h = total_h +total_m/60;
			total_m = total_m%60;
		}
		
		//근무 판별
		if(total_h>=8 && commuteDTO.getState() != 1){
			//state == 0 정상근무
			commuteDTO.setState(3);
		}else if(total_h<8 && commuteDTO.getState() != 1){
			//state == 1 사유 퇴근
			commuteDTO.setState(2);
		}
		
		commuteDTO.setTotal_h(total_h);
		commuteDTO.setTotal_m(total_m);
		
		
		return commuteDTO;
	}
	
	//시간 구하는 함수 
	public CommuteDTO time(CommuteDTO commuteDTO){
		
		 long Time = System.currentTimeMillis();    
		 Timestamp startTime = new Timestamp(Time);
		 String start= startTime.toString();
		 commuteDTO.setReg_date(start.substring(0,10));
		 commuteDTO.setStarttime(start.substring(11, 16));
		 commuteDTO.setFintime(start.substring(11, 16));
		 return commuteDTO;
	}
	
	//멤버들의 출퇴근 내역 조회
	@RequestMapping(value="/commuteSearch2", method=RequestMethod.POST)
	public String commuteSearch2(CommuteDTO commuteDTO, String year, String month, Model model, MemberDTO memberDTO){
		//특정 날짜 , id의 전체 리스트 불러오기
		commuteDTO.setReg_date(year+"-"+month);
		List<CommuteDTO> commuteSearch =  commuteService.commuteSearch(commuteDTO);
		
		String date = commuteDTO.getReg_date();
		int total_h=0;
		int total_m=0;
		int total_su=commuteSearch.size();

		if(commuteSearch != null){
			//회원 출퇴근 정보
			model.addAttribute("commuteSearch", commuteSearch);
			//회원들의 아이디만 가져오기
			List<MemberDTO> memberList = commuteService.memberList();
			model.addAttribute("memberList", memberList);
			//회원 정보 한명 불러오기
			memberDTO = commuteService.memberSearch(memberDTO);
			
			if(memberDTO != null){
				model.addAttribute("memberOneList", memberDTO);
				
				for (int i = 0; i < commuteSearch.size(); i++) {
					total_h = total_h + commuteSearch.get(i).getTotal_h();
					total_m = total_m + commuteSearch.get(i).getTotal_m();
				}
				if(total_m>60){
					total_h = total_h + total_m/60;
					total_m = total_m%60;
				}
				List<Integer> total_time = new ArrayList<Integer>();
				//0은 총 근무일수
				total_time.add(0, total_su);
				//1은 총 근무 시간
				total_time.add(1, total_h);
				//2는 총 근무 분
				total_time.add(2, total_m);
				
				model.addAttribute("total_time", total_time);
				model.addAttribute("date", date);
			}
			
		}
		
		
		
		
		return "/commute/commuteSearch";
	}
	
	//비고 작성
	@RequestMapping(value="/commuteMemoInsert", method=RequestMethod.POST)
	public String commuteMemoUpdate(CommuteDTO commuteDTO, Model model){
		commuteDTO = time(commuteDTO);
		
		commuteService.commuteMemoUpdate(commuteDTO);
		
		commuteDTO = commuteService.commuteOneList(time(commuteDTO));
		model.addAttribute("oneList", commuteDTO);
		model.addAttribute("list", commuteService.commuteList(commuteDTO));
		return "/commute/commuteList";
	}

	//퇴근처리
	@RequestMapping(value="/commuteOutWork", method=RequestMethod.POST)
	public String commuteOutWork(CommuteDTO commuteDTO, Model model){
		
		commuteDTO = time(commuteDTO);
		
		commuteService.commuteOutUpdate(commuteDTO);
		commuteDTO = commuteService.commuteOneList(commuteDTO);
		//토탈시간 구하는 함수
		commuteDTO = totalTime(commuteDTO);
		
		
		//state 업데이트
		commuteService.commuteStateUpdate(commuteDTO);
		
		
		
		List<CommuteDTO> list = commuteService.commuteList(commuteDTO);
		
		model.addAttribute("allList", list);
		model.addAttribute("oneList", commuteDTO);
		
		return "/commute/commuteList";
	}
	
	//출퇴근 내역 조회
	@RequestMapping(value="/commuteSearch", method=RequestMethod.POST)
	public void commuteSearch(MemberDTO memberDTO,Model model){
		
		List<MemberDTO> memberList = commuteService.memberList();
		model.addAttribute("memberList", memberList);
		
	}
	
	//리스트 뽑아오기
	@RequestMapping(value="/commuteList", method=RequestMethod.POST)
	public void commuteList(@ModelAttribute CommuteDTO commuteDTO, Model model){
		
		List<CommuteDTO> list = commuteService.commuteList(commuteDTO);
		model.addAttribute("allList", list);
		
		commuteDTO = commuteService.commuteOneList(time(commuteDTO));
		model.addAttribute("oneList", commuteDTO);
		
	}
	
	//출근 처리
	@RequestMapping(value="/commuteGowork", method=RequestMethod.POST )
	public String commuteGowork(CommuteDTO commuteDTO, Model model){
	  
	  
	  CommuteDTO commuteDTO2 =commuteDTO;
	  
	  //디비가서 체크
	  commuteDTO = commuteService.commuteCheck(time(commuteDTO));
	  model.addAttribute("oneList", commuteDTO);
	  
	  if(commuteDTO == null){
		  
		  //db에 인서트
		  commuteService.commuteInsert(commuteDTO2);
		  commuteDTO = commuteService.commuteOneList(time(commuteDTO2));
		  model.addAttribute("oneList", commuteDTO);
		  List<CommuteDTO> list = commuteService.commuteList(commuteDTO);
		  model.addAttribute("allList", list);
		  
	  }else{
		  //날짜 중복 	
		  model.addAttribute("message", "이미 출근 처리 되었습니다.");
	  }

		return "/commute/commuteList";
	}
}
