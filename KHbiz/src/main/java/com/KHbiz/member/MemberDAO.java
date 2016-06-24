package com.KHbiz.member;

public interface MemberDAO {
	public void join(MemberDTO memberDTO) throws Exception;
	
	public void update(MemberDTO memberDTO) throws Exception;
	
	public void delete(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO idCheck(String id) throws Exception;
	
	public MemberDTO idFindEmail(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO idFindPhone(MemberDTO memberDTO) throws Exception;

	public MemberDTO login(MemberDTO memberDTO) throws Exception; 
}
