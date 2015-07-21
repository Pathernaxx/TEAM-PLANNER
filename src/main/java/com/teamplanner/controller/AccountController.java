package com.teamplanner.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="login.action", method= RequestMethod.POST)
	public ModelAndView accountLogin(String id, String password, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		Member loginuser = null;
		
		loginuser = accountService.AccountLogin(id, password);
		
		if(loginuser != null)
		{
			session.setAttribute("loginuser", loginuser);
		} else {
			mav.addObject("logindfail", id);
			mav.setViewName("");
		}
		return mav;
	}
	
	@RequestMapping(value="logout.action", method = RequestMethod.GET)
	public String accountLogout()
	{
		return "";
	}
}
