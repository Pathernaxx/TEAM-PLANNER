package com.teamplanner.commons;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import com.teamplanner.dto.Member;

@Component("authFilter")
public class AuthFilter implements Filter{
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		
		String url = request.getRequestURI();
		String queryString = "";

		if(url.contains("?")) {
			queryString = url.substring(url.indexOf("?") + 1);
			url = url.substring(0, url.indexOf("?"));
			url = url.replace("/finalProject ", "");
		}
		
		// 로그인한 사용자 정보 읽기(로그인하지 않았다면 null 반환)
		Member member = null;
		
		if( request.getSession().getAttribute("loginuser") != null ) {
			member = (Member)request.getSession().getAttribute("loginuser");
		}
		
		if(!url.contains("/account/") && !url.equals("/finalProject/")){
			if( member == null ) {
				response.sendRedirect("/finalProject/account/login.action?returnurl=" + url);
				return;
			}
		}
		
		chain.doFilter(req, resp);
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
