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
	public ModelAndView boardMain(HttpSession session){
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		List<Board> boards = boardService.selectBoardbyTeamList(memberNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		mav.addObject("boards", boards);
		
		return mav;
	}
	
	@RequestMapping(value="insertboard.action", method = RequestMethod.GET)
	@ResponseBody
	public String insertBoard(String title, HttpSession session){
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		boolean check = boardService.checkBoardName(title);
		String message;
		if(check == true){
			message = "check";
		}else{
			if(title ==null || Integer.toString(memberNo) == null){
				message = "fail";
			}else{
				message = "complete";
				boardService.insertBoard(title);
				int boardNo = boardService.getBoardNo(title);
				boardService.insertTeamList(boardNo, memberNo);
			}
		}
				
		
		return message;
	}
	
	@RequestMapping(value="closedboardview.action", method = RequestMethod.GET)
	@ResponseBody
	public List<Board> getClosedBoard(HttpSession session){
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		List<Board> boards = boardService.selectClosedBoard(memberNo);
		
		return boards;
	}
	
//////////////////////// 유정 /////////////////////////////////////////
	@RequestMapping(value="boardview.action", method = RequestMethod.GET)
	public String BoardView(@RequestParam("boardno") int boardNo){
		System.out.println(boardNo);
		return "board/boardview";
		
	}
	
	@RequestMapping(value="boardview.action", method = RequestMethod.POST)
	@ResponseBody
	public List<BoardList> BoardView2(@RequestParam("boardno") int boardNo) {
		List<BoardList> boardLists = boardService.BoardView(boardNo);
		
		return boardLists;
	}
	
}
