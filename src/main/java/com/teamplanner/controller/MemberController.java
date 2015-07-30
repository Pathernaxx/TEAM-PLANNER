package com.teamplanner.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.teamplanner.service.AccountService;
import com.teamplanner.service.ActivityService;
import com.teamplanner.service.MemberService;

@Controller
@RequestMapping(value="member")
public class MemberController {
	
	private MemberService memberService;
	private ActivityService activityService;
	private AccountService accountService;

	@Autowired
	@Qualifier(value="memberService")
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	@Qualifier(value="accountService")
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
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
		
		mav.setViewName("include/activity");
		
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
	
	@RequestMapping(value="change.action", produces="text/plain;charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String MemberChange(HttpServletRequest request, HttpServletResponse resp,HttpSession session)
	{
		
		String message = "한글";
		int memberno = ((Member)session.getAttribute("loginuser")).getNo();
		String state = request.getParameter("state");
		
		if( state.equals("name") ) {
			// Parameter를 받는다.
			String userName = request.getParameter("username");
			String fullName = request.getParameter("fullname");
			
			// userName은 Unique값이기 때문에 자신을 제외한 멤버 중 같은 이름이 있는지 검색
			// return 값은 있으면 true, 없으면 false이다.
			if( accountService.MeNotCheckName(memberno, userName) ) {
				message = "중복되는 UserName입니다.";
				return message;
			} else {
				//memberService.changeName(memberno, userName, fullName);
			}
			
		} else if( state.equals("password") ) {
			// Parameter를 받는다
			String oldpassword = request.getParameter("oldpassword");
			String password1 = request.getParameter("password1");
			String password2 = request.getParameter("password2");
			
			// password1과 password2의 일치 유무
			if( !password1.equals(password2) ) {
				message = "password가 일치하지 않습니다.";
				return message;
			}
			
			// OldPassword가 현재 Password와 일치하는지 검색
			if( accountService.PasswordCheck(memberno, oldpassword) ) {
				message = "password가 틀렸습니다.";
				return message;
			}
			
			// 패스워드를 수정한다.
			//memberService.changePassword(memberno, password1);
		}
		
		return message;
	}
	
//	@RequestMapping(value="member.action", method=RequestMethod.GET)
//	public String profile() {
//		return "member/profile";
//	}
	
	@RequestMapping(value="settings.action", method=RequestMethod.POST)
	public String settings() {
		return "member/setting";
	}
	
	@RequestMapping(value="settings.action", method=RequestMethod.GET)
	public String settingsGet() {
		return "member/settings";
	}
	
	@RequestMapping(value="cards.action", method=RequestMethod.POST)
	public String cards() {
		//Attribute Card 조회
		return "member/cards";
	}
	
	@RequestMapping(value="cards.action", method=RequestMethod.GET)
	public String cardsGet() {
		//Attribute Card 조회
		return "member/settings";
	}
	
	@RequestMapping(value="list.action", method=RequestMethod.POST)
	public String memberlist() {
		return "member/memberlist";
	}
	
	@RequestMapping(value="list.action", method=RequestMethod.GET)
	public String memberlistGet() {
		return "member/settings";
	}
}
