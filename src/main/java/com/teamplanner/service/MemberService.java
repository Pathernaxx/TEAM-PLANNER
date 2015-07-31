package com.teamplanner.service;

import java.util.List;

import com.teamplanner.dto.Member;


public interface MemberService {
	void changeName(int memberNo, String username, String fullname);
	void changePassword(int memberNo, String password);
	void changeNotification(int memberNo, boolean notification);
	void changeIconPath(int memberNo, String iconpath);
	Member updateMemberView(int memberNo);
	void updateMember(Member member);
	
}
