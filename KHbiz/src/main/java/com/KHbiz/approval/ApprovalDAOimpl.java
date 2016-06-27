package com.KHbiz.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

@Repository
public class ApprovalDAOimpl implements ApprovalDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "ApprovalMapper.";
	
	@Override
	public List<ApprovalListDTO> applist(HashMap<String, Object> hs) throws Exception {
		return sqlSession.selectList(namespace+"applist", hs);
	}
	
	@Override
	public void appupdate(List<Integer> ar) throws Exception {
		sqlSession.update(namespace+"appupdate", ar);
	}
	
	@Override
	public int count() throws Exception {
		return sqlSession.selectOne(namespace+"count");
	}
	
	@Override
	public void forminsert(ApprovalDTO approvalDTO) throws Exception {
		sqlSession.insert(namespace+"forminsert", approvalDTO);
	}
	
	@Override
	public void approval(ApprovalDTO approvalDTO) throws Exception {
		sqlSession.insert(namespace+"approval", approvalDTO);
	}
	
	@Override
	public List<ApprovalListDTO> searchApproval(HashMap<String, Object> hs) throws Exception {
		return sqlSession.selectList(namespace+"searchApproval", hs);
	}
	
	@Override
	public int searchcount(HashMap<String, Object> hs) throws Exception {
		return sqlSession.selectOne(namespace+"searchcount", hs);
	}
	
	@Override
	public ApprovalDTO appselect(int num) throws Exception {
		return sqlSession.selectOne(namespace+"appselect", num);
	}
	
	@Override
	public ApprovalListDTO appselect_img(int num) throws Exception {
		return sqlSession.selectOne(namespace+"appselect_img", num);
	}
	
	@Override
	public void formupdate(ApprovalDTO approvalDTO) throws Exception {
		sqlSession.update(namespace+"formupdate", approvalDTO);	
	}
	
	@Override
	public void approvalupdate(ApprovalDTO approvalDTO) throws Exception {
		sqlSession.update(namespace+"approvalupdate", approvalDTO);
	}
	
	@Override
	public void approvalcomplete(int num) throws Exception {
		sqlSession.update(namespace+"approvalcomplete", num);
	}
	
	@Override
	public void formdelete(int num) throws Exception {
		sqlSession.delete(namespace+"formdelete", num);	
	}
	@Override
	public void approvaldelete(int num) throws Exception {
		sqlSession.delete(namespace+"approvaldelete", num);
		
	}
	
	@Override
	public List<ApprovalListDTO> receivelist(HashMap<String, Object> hs) throws Exception {
		return sqlSession.selectList(namespace+"receivelist", hs);
	}
	
	@Override
	public int receivecount(HashMap<String, Object> hs) throws Exception {		
		return sqlSession.selectOne(namespace+"receivecount", hs);
	}
	
	@Override
	public List<ApprovalListDTO> ceolist(HashMap<String, Integer> hs) throws Exception {
		return sqlSession.selectList(namespace+"ceolist", hs);
	}
	
	@Override
	public int ceocount() {
		return sqlSession.selectOne(namespace+"ceocount");
	}
	
	@Override
	public List<ApprovalDTO> ongoingapproval(String id) throws Exception {
		return sqlSession.selectList(namespace+"ongoingapproval",id);
	}
	
	@Override
	public void approvalreturn(int num) throws Exception {
		sqlSession.update(namespace+"approvalreturn", num);
	}
	
	@Override
	public List<ApprovalListDTO> completelist(HashMap<String, Object> hs) throws Exception {
		return sqlSession.selectList(namespace+"completelist", hs);
	}
	
	@Override
	public int completecount(HashMap<String, Object> hs) {
		return sqlSession.selectOne(namespace+"completecount", hs);
	}
}
