package com.teamplanner.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamplanner.dto.ActionPrint;
import com.teamplanner.dto.Member;
import com.teamplanner.service.ActivityService;
import com.teamplanner.service.MemberService;

@Controller
@RequestMapping(value="member")
public class MemberController {
	
	private MemberService memberService;
	private ActivityService activityService;

	@Autowired
	@Qualifier(value="memberService")
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	@Qualifier(value="activityService")
	public void setActivityService(ActivityService activityService){
		this.activityService = activityService;
	}


//	@RequestMapping(value="memberUpdate", method = RequestMethod.POST)
//	public String memberUpdate(Member member, HttpSession session){
//		
//		String pw = member.getPassword();
////		pw=Util.getHashedString(pw, "SHA-1");
////		
////		memberRepository.updateMember(member);
////		
////		int no = member.getNo();
////		memberRepository.updateMember(member);
//		session.setAttribute("loginuser", member);
//		
//		return "redirect:/member/memberView.action?memberNo="+no;
//	}
	@RequestMapping(value={ "", "/" }, method=RequestMethod.GET)
	public ModelAndView defaultPage(HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginuser");
		
		ModelAndView mav = new ModelAndView();
		List<ActionPrint> prints = activityService.activityListByMember(member.getNo());
		mav.addObject("prints", prints);
		
		mav.setViewName("member/settings");
		
		return mav;
	}
	
	@RequestMapping(value={ "", ".action" }, method=RequestMethod.POST)
	public ModelAndView defaultPagePost(HttpSession session) {
		
		Member member = (Member)session.getAttribute("loginuser");
		
		ModelAndView mav = new ModelAndView();
		List<ActionPrint> prints = activityService.activityListByMember(member.getNo());
		mav.addObject("prints", prints);
		
		mav.setViewName("member/profile");
		
		return mav;
	}
	
	@RequestMapping(value="memberinfo.action", method = RequestMethod.GET)
	public ModelAndView MemberInfo()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/settings");
		
		return mav;
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
	
	@RequestMapping(value="change.action", method = RequestMethod.POST)
	@ResponseBody
	public String MemberChange(HttpServletRequest request, HttpSession session)
	{
		String message = "false";
		//int memberno = ((Member)session.getAttribute("loginuser")).getNo();
		
		if( request.getParameter("fullname") != null ) {
			message ="false";
		}
		
		return message;
	}
	
	@RequestMapping(value="member.action", method=RequestMethod.GET)
	public String profile() {
		return "member/profile";
	}
	
	@RequestMapping(value="settings.action", method=RequestMethod.POST)
	public String settings() {
		return "member/setting";
	}
	
	@RequestMapping(value="cards.action", method=RequestMethod.POST)
	public String cards() {
		//Attribute Card 조회
		return "member/cards";
	}
	
	@RequestMapping(value="list.action", method=RequestMethod.POST)
	public String memberlist() {
		return "member/memberlist";
	}
}
