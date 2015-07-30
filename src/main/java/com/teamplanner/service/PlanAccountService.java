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
		
		Member member = null;
		password = Util.getHashedString(password, "SHA-1");
		
		if(id.contains("@")) {
			member = memberRepository.selectMemberByIdAndPasswordByEmail(id, password);
		} else {
			member = memberRepository.selectMemberByIdAndPasswordByName(id, password);
		}		
		
		return member;
	}
	
	@Override
	public boolean PasswordCheck(int memberNo, String password) {
		
		boolean check = false;
		
		password = Util.getHashedString(password, "SHA-1");
		
		if( memberRepository.selectMemberByNoAndPassByPasswordCheck(memberNo, password) > 0 ) {
			check = true;
		}
		
		return check;
	}

	@Override
	public void AccountLogout() {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public boolean MeNotCheckName(int memberNo, String userName) {

		int count = memberRepository.selectMeNotUserNameCheck(memberNo, userName);
		boolean check = false;
		
		if( count > 0 ) {
			check = true;
		}
		
		return check;
	}
	
	@Override
	public void joinWithUs(Member member) {
		
		String user = member.getUserName();
		String email = member.getEmail();
		
		if(memberRepository.selectMemberByEmailCheck(email) != null)
		{
			//return "email";
		}
		//while()
		while(memberRepository.selectMemberByUserNameCheck(user) != null)
		{
			user = user + (int)(Math.random() * 1000) + 1;
			member.setUserName(user);
		}
		
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
