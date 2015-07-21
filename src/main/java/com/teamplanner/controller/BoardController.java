package com.teamplanner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamplanner.repository.MemberRepository;

@Controller
@RequestMapping(value="board")
public class BoardController {
////////////////////////// 동윤 /////////////////////////////////////////	
	@RequestMapping(value="link.action", method = RequestMethod.GET)
	public String BoardLink(){
		
		return "main/main";
	}
	
	
//////////////////////// 유정 /////////////////////////////////////////
	@RequestMapping(value="boardview.action", method = RequestMethod.GET)
	public String BoardView(){
		
		return "board/boardview";
	}
	
}
