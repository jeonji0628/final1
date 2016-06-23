package com.KHbiz.workLog;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class DivisionWorkLogServiceImpl implements DivisionWorkLogService {

	@Inject
	private DivisionWorkLogDAO divisionWorkLogDAO;
	
	@Override
	public void divisionWorkLogUpdate(DivisionWorkLogDTO ddto) {
		try {
			divisionWorkLogDAO.divisionWorkLogUpdate(ddto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void divisionWorkLogUpdateForm(int num, Model model) {
		try {
			model.addAttribute(divisionWorkLogDAO.divisionWorkLogUpdateForm(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void divisionWorkLogDelete(int num) {
		try {
			divisionWorkLogDAO.divisionWorkLogDelete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		
	@Override
	public void divisionWorkLogListUpdate(DivisionWorkLogDTO ddto) {
		try {
			if(ddto.getPayment_state().equals("1")){
				ddto.setPayment_id("1");
			}		
			divisionWorkLogDAO.divisionWorkLogListUpdate(ddto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void divisionWorkLogOneView(int num, Model model) {
		try {
			model.addAttribute("divisionWorkLogOne",divisionWorkLogDAO.divisionWorkLogOneView(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void divisionWorkLogWrite(DivisionWorkLogDTO ddto) {
		
		try {
			if(ddto.getUpload() == null){
				ddto.setUpload("1");
			}
			if(ddto.getPayment_state() == null){
				ddto.setPayment_state("1");
			}
			if(ddto.getPayment_id() == null){
				ddto.setPayment_id("1");
			}
			divisionWorkLogDAO.divisionWorkLogWrite(ddto);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void divisionWorkLogList(DivisionWorkLogDTO ddto, Model model) {
		try {
			
		List<DivisionWorkLogDTO> ar = divisionWorkLogDAO.list(ddto);
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
		model.addAttribute("divisionWorkLog1",ar);
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	}
	
}
