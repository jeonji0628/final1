package com.KHbiz.workLog;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class WorkLogServiceImpl implements WorkLogService {

	@Inject
	private WorkLogDAO workLogDAO;
	
	@Override
	public void workLogView(int num, Model model) {
		try {						
			model.addAttribute("workLogOne",workLogDAO.workLogView(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void workLogUpdate(WorkLogDTO wdto) {		
		try {
			workLogDAO.workLogUpdate(wdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void workLogUpdateForm(int num, Model model) {		
		try {					
			model.addAttribute(workLogDAO.workLogUpdateForm(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void workLogDelete(int num) {
		try {
			workLogDAO.workLogDelete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void workLogWrite(WorkLogDTO wdto) {
		try {
			if(wdto.getUpload() == null){
				wdto.setUpload("1");
			}
			if(wdto.getPayment_state() == null){
				wdto.setPayment_state("1");
			}
			if(wdto.getPayment_id() == null){
				wdto.setPayment_id("1");
			}
			workLogDAO.workLogWrite(wdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	
	@Override
	public void workLogListUpdate(WorkLogDTO wdto) {
		try {			
			if(wdto.getPayment_state().equals("1")){
				wdto.setPayment_id("1");
			}
			workLogDAO.workLogListUpdate(wdto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void workLogList(WorkLogDTO wdto, Model model) {
		try {
			List<WorkLogDTO> ar = workLogDAO.list(wdto);		
			for(int i=0; i<ar.size(); i++){
				if(ar.get(i).getPayment_state().equals("1")){
					ar.get(i).setPayment_state("미결제");
				}else if(ar.get(i).getPayment_state().equals("2")){
					ar.get(i).setPayment_state("결제완료");
				}else if(ar.get(i).getPayment_state().equals("3")){
					ar.get(i).setPayment_state("수정후 다시 제출 요망");
				}else{
					ar.get(i).setPayment_state("미결제");
				}
			}
			model.addAttribute("personalWorkLog",ar);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
