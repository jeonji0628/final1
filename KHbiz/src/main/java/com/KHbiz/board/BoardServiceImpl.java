package com.KHbiz.board;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public void boardUpdate1(BoardDTO boardDTO) {
		try {
			System.out.println("서비스");
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
	public void list(int curPage, Model model, String kind) {
		try {
			int totalList = boardDAO.totalList();
			MakePage p = new MakePage(curPage, totalList);
			p.setKind(kind);
			model.addAttribute("page",p);
			model.addAttribute("list",boardDAO.list(p));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
