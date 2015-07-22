package com.teamplanner.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamplanner.dto.Member;
import com.teamplanner.service.BoardService;

@Controller
@RequestMapping(value="board")
public class BoardController {
	
	
	private BoardService boardService;
	
	@Autowired
	@Qualifier("boardService")
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
////////////////////////// 동윤 /////////////////////////////////////////	
	@RequestMapping(value="boardmain.action", method = RequestMethod.GET)
	public String boardMain(){
		
		
		
		return "main/main";
	}
	
	@RequestMapping(value="insert.action", method = RequestMethod.GET)
	public String insertBoard(String title, HttpSession session){
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		
		if(title ==null || Integer.toString(memberNo) == null){
			return "redirect:/board/boardmain.action";
		}else{
			boardService.insertBoard(title);
		}
		int boardNo = boardService.getBoardNo(title);
		boardService.insertTeamList(boardNo, memberNo);
		
		
		return "redirect:/board/boardmain.action";
	}
//////////////////////// 유정 /////////////////////////////////////////
	@RequestMapping(value="boardview.action", method = RequestMethod.GET)
	public String BoardView(){
		
		return "board/boardview";
	}
	
}
