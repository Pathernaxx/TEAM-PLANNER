package com.teamplanner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="board")
public class BoardController {
////////////////////////// 동윤 /////////////////////////////////////////	
	@RequestMapping(value="link.action", method = RequestMethod.GET)
	public String BoardLink(){
		
		return "main/main";
	}
	
	@RequestMapping(value="insert.action", method = RequestMethod.GET)
	public String insertBoard(String title){
		
		
		
		
		return "redirect:/board/link.action";
	}
//////////////////////// 유정 /////////////////////////////////////////
	@RequestMapping(value="boardview.action", method = RequestMethod.GET)
	public String BoardView(){
		
		return "board/boardview";
	}
	
}
