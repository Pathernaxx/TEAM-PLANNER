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

import com.teamplanner.commons.Util;
import com.teamplanner.dto.Member;
import com.teamplanner.service.AccountService;

@Controller
@RequestMapping(value="account")
public class AccountController {

	private AccountService accountService;
	
	@Autowired
	@Qualifier("accountService")
	public void setAccountService(AccountService accountService)
	{
		this.accountService = accountService;
	}
	
	@RequestMapping(value="signup.action", method=RequestMethod.GET)
	public String createAccount()
	{
		return "account/signup";
	}
	
	@RequestMapping(value="signup.action", method=RequestMethod.POST)
	@ResponseBody
	public String createTeamPlanner(String name, String email, String password)
	{
		
		password = Util.getHashedString(password, "SHA-1");
		
		Member member = new Member();
		member.setUserName(name);
		member.setFullName(name);
		
		if( accountService.IdCheckForEmail(email)) {
			member.setEmail(email);
		} else {
			return "가입된 Email 입니다.";
		}
		
		member.setPassword(password);

		accountService.joinWithUs(member);
		// 차후 수정
		return "success";
	}
	
	@RequestMapping(value="login.action", method= RequestMethod.GET)
	public ModelAndView locationlogin(@RequestParam(value="returnurl", defaultValue = "") String returnurl)
	{
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("returnurl", returnurl);
		mav.setViewName("account/loginform");
		
		return mav;
	}
	
	@RequestMapping(value="login.action", method= RequestMethod.POST)
	@ResponseBody
	public String accountLogin(String user, String password, HttpSession session)
	{
		Member loginuser = null;
		String message;
		loginuser = accountService.AccountLogin(user, password);
		
		if(loginuser != null)
		{
			session.setAttribute("loginuser", loginuser);
			message = "complete";
			
		} else {
			message = "fail";
		}
		
		return message;
	}
	
	@RequestMapping(value="logout.action", method = RequestMethod.GET)
	public String accountLogout(HttpSession session)
	{
		session.removeAttribute("loginuser");
		return "account/loginform";
	}
}
