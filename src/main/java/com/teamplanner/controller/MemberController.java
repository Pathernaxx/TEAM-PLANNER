package com.teamplanner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamplanner.service.MemberService;

@Controller
@RequestMapping(value="member")
public class MemberController {
	
	private MemberService memberService;

	@Autowired
	@Qualifier(value="memberService")
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value="member.action", method = RequestMethod.GET)
	public String MemberLink(){
		
		return "member/memberedit";
	}
	
	@RequestMapping(value="memberinfo.action", method = RequestMethod.GET)
	public String MemberInfo()
	{
		return "member/settings";
	}
}
