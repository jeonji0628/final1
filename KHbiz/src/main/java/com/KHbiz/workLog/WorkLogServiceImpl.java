package com.KHbiz.workLog;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class WorkLogServiceImpl implements WorkLogService {

	@Inject
	private WorkLogDAO workLogDAO;
	
	@Override
	public void workLogList(WorkLogDTO wdto, Model model) {
		try {
			List<WorkLogDTO> ar = workLogDAO.list(wdto);
			model.addAttribute("personalWorkLog",ar);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		/*try {
			model.addAttribute("personalWorkLog",workLogDAO.list(id));
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	}
	
}
