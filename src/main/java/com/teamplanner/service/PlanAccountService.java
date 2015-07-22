package com.teamplanner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teamplanner.commons.Util;
import com.teamplanner.dto.Member;
import com.teamplanner.repository.MemberRepository;

@Service(value="accountService")
public class PlanAccountService implements AccountService {

private MemberRepository memberRepository;
	
	@Autowired
	@Qualifier("memberRepository")
	public void setMemberRepository(MemberRepository memberRepository)
	{
		this.memberRepository = memberRepository;
	}
	
	@Override
	public Member AccountLogin(String id, String password) {
		
		password = Util.getHashedString(password, "SHA-1");
		
		return memberRepository.selectMemberByIdAndPassword(id, password);
	}

	@Override
	public void AccountLogout() {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void joinWithUs(Member member) {
		
		memberRepository.insertMember(member);
	}

	@Override
	public boolean IdCheckForEmail(String email) {
		
		if(memberRepository.selectMemberByEmailCheck(email) == null)
		{
			return true;
		}
		return false;
	}

	@Override
	public boolean IdCheckForUserName(String userName) {
		
		if(memberRepository.selectMemberByUserNameCheck(userName) == null)
		{
			return true;
		}
		return false;
	}
}
