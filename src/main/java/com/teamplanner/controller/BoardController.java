package com.teamplanner.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
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
	@ResponseBody
	public String insertBoard(String title, HttpSession session){
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		String message;
		if(title ==null || Integer.toString(memberNo) == null){
			message = "fail";
		}else{
			message = "complete";
			boardService.insertBoard(title);
			int boardNo = boardService.getBoardNo(title);
			boardService.insertTeamList(boardNo, memberNo);
		}		
		
		return message;
	}
//////////////////////// 유정 /////////////////////////////////////////
	@RequestMapping(value="boardview.action", method = RequestMethod.GET)
	public ModelAndView BoardView(@RequestParam("boardno") int boardNo){
		
		
		List<BoardList> boardLists = boardService.BoardView(boardNo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(boardLists);
		mav.setViewName("board/boardview");
		
		return mav;
		
	}
	
}
