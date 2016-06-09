package com.KHbiz.board;

import java.util.ArrayList;
import java.util.List;

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
	
/*	@Override
	public void search(MakePage mp, Model model,String kind,int curPage) {
		try {		
			List<BoardDTO> ar = new ArrayList<BoardDTO>();
			ar = boardDAO.search(mp);
			model.addAttribute("list",ar);
			mp = new MakePage(1,ar.size());
			model.addAttribute("page",mp);
			
			ArrayList<Integer> ar2 = new ArrayList<Integer>();
			
			for(int i=0;i<ar.size();i++){
			int replyNumber = boardDAO.replyNum(boardDAO.search(mp).get(i).getNum());
			ar2.add(replyNumber);
			}		
			model.addAttribute("replyNum",ar2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}*/
		
	/*@Override
	public void list(int curPage, String kind, Model model) {
		try {
			int totalList = boardDAO.totalList(kind);
			MakePage mp = new MakePage(curPage, totalList);
			mp.setKind(kind);
			mp.setCurPage(curPage);
			model.addAttribute("page",mp);
			model.addAttribute("list",boardDAO.list(mp));
			
			ArrayList<Integer> ar = new ArrayList<Integer>();	
			for(int i=0;i<boardDAO.list(mp).size();i++){
			int replyNumber = boardDAO.replyNum(boardDAO.list(mp).get(i).getNum());
			ar.add(replyNumber);
			}
			model.addAttribute("replyNum",ar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}*/

	@Override
	public void list(int curPage, Model model, String kind, MakePage mp) {
		// TODO Auto-generated method stub
		try {
			
			int  totalList = boardDAO.totalList(kind);
			mp.setTotalList(totalList);
			model.addAttribute("page",mp);
			model.addAttribute("list",boardDAO.list(mp));
			
		/*	int totalList = boardDAO.totalList(kind);
			mp.setKind(kind);
			mp = new MakePage(curPage,totalList);
			model.addAttribute("page",mp);
			ArrayList<BoardDTO> ar2 = new ArrayList<BoardDTO>();
			ar2 = (ArrayList<BoardDTO>)boardDAO.list(mp);
			model.addAttribute("list",boardDAO.list(mp));*/
			
			/*ArrayList<Integer> ar = new ArrayList<Integer>();	
			for(int i=0;i<boardDAO.search(mp).size();i++){
			int replyNumber = boardDAO.replyNum(boardDAO.search(mp).get(i).getNum());
			ar.add(replyNumber);
			}
			model.addAttribute("replyNum",ar);*/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
}
