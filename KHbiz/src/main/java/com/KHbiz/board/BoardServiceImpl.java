package com.KHbiz.board;

import java.util.ArrayList;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void replyView(int num, Model model) {
		try {
			model.addAttribute("reply",boardDAO.replyView(num));			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@Override
	public void reply(ReplyDTO replyDTO) {
		try {
			boardDAO.reply(replyDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@Override
	public void boardUpdate1(BoardDTO boardDTO) {
		try {
			boardDAO.boardUpdate1(boardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	
	
	@Override
	public void boardUpdate(int num, Model model) {
		try {
			model.addAttribute(boardDAO.boardView(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@Override
	public void boardDelete(int num) {
		try {
			boardDAO.boardDelete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@Override
	public void boardView(int num, Model model) {
		try {
			model.addAttribute(boardDAO.boardView(num)); //키값이 없으면 클래스명이 키값으로.
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void boardWrite(BoardDTO boardDTO) {
		try {
			boardDAO.boardWrite(boardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void search(MakePage mp, Model model,String kind,int curPage) {
		try {
			model.addAttribute("list",boardDAO.search(mp));			
			mp.setKind(kind);
			int searchTotalList = boardDAO.totalList(kind);
			mp.setCurPage(curPage);
			mp.setTotalList(searchTotalList);
			model.addAttribute("page",mp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
		
	@Override
	public void list(int curPage, Model model, String kind) {
		try {
			int totalList = boardDAO.totalList(kind);
			MakePage p = new MakePage(curPage, totalList);
			p.setKind(kind);
			p.setCurPage(curPage);
			model.addAttribute("page",p);
			model.addAttribute("list",boardDAO.list(p));
			
			ArrayList<Integer> ar = new ArrayList<Integer>();
			
			
			for(int i=0;i<boardDAO.list(p).size();i++){
			int replyNumber = boardDAO.replyNum(boardDAO.list(p).get(i).getNum());
			ar.add(replyNumber);
			}
			
			model.addAttribute("replyNum",ar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void list(int curPage, Model model, String kind, MakePage mp) {
		// TODO Auto-generated method stub
		try {
			int totalList = boardDAO.totalList(kind);
			mp.setKind(kind);
			mp.setCurPage(curPage);
			mp.setTotalList(totalList);
			model.addAttribute("page",mp);
			model.addAttribute("list",boardDAO.list(mp));
			ArrayList<Integer> ar = new ArrayList<Integer>();
			
			for(int i=0;i<boardDAO.list(mp).size();i++){
			int replyNumber = boardDAO.replyNum(boardDAO.list(mp).get(i).getNum());
			ar.add(replyNumber);
			}
			
			model.addAttribute("replyNum",ar);
			/*System.out.println(ar.get(0));
			System.out.println(ar.get(1));*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
}
