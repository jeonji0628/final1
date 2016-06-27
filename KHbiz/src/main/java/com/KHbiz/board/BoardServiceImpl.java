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
	public void boardOnePreview(int num, Model model) {
		try {
			model.addAttribute("boardOnePreview1",boardDAO.boardOnePreview(num));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@Override
	public void boardPreview(Model model) {
		String kind = "2";
		try {
			model.addAttribute("preview",boardDAO.boardPreview(kind));
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
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
		System.out.println("dddd");
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
			List<BoardDTO> ar = new ArrayList<BoardDTO>();
			mp.setKind(kind);
			String kind1 = kind;
			String searchType = mp.getSearchType();
			String searchWord = mp.getSearchWord();
			ar = boardDAO.search1(mp);	//kind , searchType, searchWord
			
			MakePage mp2 = new MakePage(curPage,ar.size());
			List<BoardDTO> ar2 = new ArrayList<BoardDTO>();
			mp2.setKind(kind1);
			mp2.setSearchType(searchType);
			mp2.setSearchWord(searchWord);
			
			ar2 = boardDAO.search(mp2);	//kind , searchType, searchWord, startRow, lastRow		
			
			model.addAttribute("list",ar2);
			model.addAttribute("page",mp2);
			
			ArrayList<Integer> ar3 = new ArrayList<Integer>();
			
			for(int i=0;i<ar2.size();i++){
			int replyNumber = boardDAO.replyNum(boardDAO.search(mp2).get(i).getNum());
			ar3.add(replyNumber);
			}		
			model.addAttribute("replyNum",ar3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
		
	@Override
	public void list(int curPage, String kind, Model model,MakePage mp) {
		try {
			if(mp.getSearchWord() == null){
				int totalList = boardDAO.totalList(kind);
				mp = new MakePage(curPage, totalList);
				mp.setKind(kind);
				mp.setCurPage(curPage);
				model.addAttribute("page",mp);
				model.addAttribute("list",boardDAO.list(mp));
			}else{
				List<BoardDTO> ar = new ArrayList<BoardDTO>();
				mp.setKind(kind);
				String kind1 = kind;
				String searchType = mp.getSearchType();
				String searchWord = mp.getSearchWord();
				ar = boardDAO.search1(mp);	//kind , searchType, searchWord
				
				mp.setMember(curPage, ar.size()); 
				List<BoardDTO> ar2 = new ArrayList<BoardDTO>();
				mp.setKind(kind1);
				mp.setSearchType(searchType);
				mp.setSearchWord(searchWord);
				
				ar2 = boardDAO.search(mp);	//kind , searchType, searchWord, startRow, lastRow		
				
				model.addAttribute("list",ar2);
				model.addAttribute("page",mp);
			}
			
			ArrayList<Integer> ar = new ArrayList<Integer>();	
			for(int i=0;i<boardDAO.list(mp).size();i++){
			int replyNumber = boardDAO.replyNum(boardDAO.list(mp).get(i).getNum());
			ar.add(replyNumber);
			}
			model.addAttribute("replyNum",ar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
