package com.teamplanner.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamplanner.dto.Member;
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

/////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="updatememberview.action", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView updateMemberView(HttpSession session) {
		int memberno = ((Member)session.getAttribute("loginuser")).getNo();
		Member member = memberService.updateMemberView(memberno);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/updatememberview");
		mav.addObject("member", member);
		
		return mav;
		
	}
	


	
	@RequestMapping(value="memberinfo.action", method = RequestMethod.GET)
	public String MemberInfo(HttpSession session)
	{
		return "member/settings";
	}
	
	@RequestMapping(value="changenameform.action", method = RequestMethod.GET)
	public ModelAndView MemberChangeNameForm(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		
		Member member = (Member)session.getAttribute("loginuser");
		mav.addObject("member", member);
		mav.setViewName("member/changenameform");
		return mav;
	}
	
	@RequestMapping(value="changepassform.action", method = RequestMethod.GET)
	public String MemberChangePasswordForm(HttpSession session)
	{
		return "member/changepasswordform";
	}
	
	@RequestMapping(value="activity.action", method = RequestMethod.GET)
	public String MemberActivity()
	{
		return "";
	}
	
	@RequestMapping(value="cards.action", method = RequestMethod.GET)
	public String MemberCards()
	{
		return "";
	}
	
	@RequestMapping(value="change.action", method = RequestMethod.POST)
	@ResponseBody
	public String MemberChange(@RequestParam("state") String state, 
			@RequestParam(value="password", defaultValue="unknown") String password, 
			@RequestParam(value="username", defaultValue="unknown") String username,
			@RequestParam(value="fullname", defaultValue="unknown") String fullname,
			@RequestParam(value="iconpath", defaultValue="unknown") String iconpath,
			@RequestParam(value="notification", defaultValue="false") boolean notification,
			HttpSession session
			)
	{
		String message = "fail";
		int memberno = ((Member)session.getAttribute("loginuser")).getNo();
		
		switch(state)
		{
		case "name":
			memberService.changeName(memberno, username, fullname);
			message = "complete";
			break;
		case "passwd":
			memberService.changePassword(memberno, password);
			message = "complete";
			break;
		case "icon":
			memberService.changeIconPath(memberno, iconpath);
			message = "complete";
			break;
		case "notifi":
			memberService.changeNotification(memberno, notification);
			message = "complete";
			break;
		}
		
		return message;
	}
}
