package com.teamplanner.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teamplanner.commons.Util;
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
	public void changeName(int memberNo, String username, String fullname) {
		Member member = new Member();
		
		member.setNo(memberNo);
		member.setUserName(username);
		member.setFullName(fullname);
		
		memberRepository.updateMemberName(member);
		
	}

	@Override
	public void changePassword(int memberNo, String password) {
	
		password = Util.getHashedString(password, "SHA-1");
		memberRepository.updateMemberPassword(password, memberNo);
		
	}

	@Override
	public void changeNotification(int memberNo, boolean notification) {

		memberRepository.updateMemberNotification(memberNo, notification);
		
	}

	@Override
	public void changeIconPath(int memberNo, String iconpath) {

		memberRepository.updateMemberIconPath(iconpath, memberNo);
		
	}

}
