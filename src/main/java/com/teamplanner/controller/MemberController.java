package com.teamplanner.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamplanner.commons.Util;
import com.teamplanner.dto.Member;
import com.teamplanner.repository.MemberRepository;

@Controller
@RequestMapping(value="member")
public class MemberController {
	
	private MemberRepository memberRepository;
	@Autowired
	@Qualifier("memberRepository")
	public void setMemberDao(MemberRepository memberRepository){
		this.memberRepository=memberRepository;
	}

	//member 회원정보 수정 DB적용
		@RequestMapping(value="memberUpdate", method = RequestMethod.POST)
		public String memberUpdate(Member member, HttpSession session){
			
			String pw = member.getPassword();
			pw=Util.getHashedString(pw, "SHA-1");
			
			memberRepository.updateMember(member);
			
			int no = member.getNo();
			memberRepository.updateMember(member);
			session.setAttribute("loginuser", member);
			
			return "redirect:/member/memberView.action?memberNo="+no;
		}
		
	}
	

