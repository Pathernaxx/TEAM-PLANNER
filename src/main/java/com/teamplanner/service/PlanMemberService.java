package com.teamplanner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teamplanner.dto.Member;
import com.teamplanner.repository.MemberRepository;

@Service(value="memberService")
public class PlanMemberService implements MemberService{

	private MemberRepository memberRepository;
	
	@Autowired
	@Qualifier(value="memberRepository")
	public void setMemberRepository(MemberRepository memberRepository)
	{
		this.memberRepository = memberRepository;
	}
	
	@Override
	public void joinWithUs(Member member) {
		
		memberRepository.insertMember(member);
	}

}
