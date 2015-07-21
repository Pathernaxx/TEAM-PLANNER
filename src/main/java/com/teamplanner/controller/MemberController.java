package com.teamplanner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamplanner.repository.MemberRepository;

@Controller
@RequestMapping(value="member")
public class MemberController {
	

	
	@RequestMapping(value="member.action", method = RequestMethod.GET)
	public String MemberLink(){
		
		return "member/memberedit";
	}
	
}
