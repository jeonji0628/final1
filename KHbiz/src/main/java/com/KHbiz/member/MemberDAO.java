package com.KHbiz.member;

import java.util.HashMap;
import java.util.List;

public interface MemberDAO {
	public void join(MemberDTO memberDTO) throws Exception;
	
	public void update(MemberDTO memberDTO) throws Exception;
	
	public void delete(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO idCheck(String id) throws Exception;
	
	public MemberDTO idFindEmail(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO idFindPhone(MemberDTO memberDTO) throws Exception;

	 public MemberDTO login(MemberDTO memberDTO) throws Exception; 
	 public List<MemberDTO> AllChart(HashMap<String, Integer> hs) throws Exception;
	 public int PagingChart() throws Exception;
	 public List<MemberDTO> searchChart(HashMap<String, String> hs) throws Exception;
	 public void changeChart(MemberDTO memberDTO) throws Exception;
	 public List<MemberDTO> searchApproval(String name) throws Exception;

}
