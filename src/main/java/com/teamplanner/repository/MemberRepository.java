package com.teamplanner.repository;

import java.util.List;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.Member;

public interface MemberRepository {
	void insertMember(Member member);
	String selectMemberByUserNameCheck(String userName);
	String selectMemberByEmailCheck(String email);
	Member selectMemberByMemberNo(int memberNo);
	void updateMemberName(Member member);
	void updateMemberNotification(int memberNo, boolean notification);
	void updateMemberIconPath(String iconpath, int memberNo);
	void updateMemberPassword(String password, int memberNo);
	Member selectMemberByIdAndPasswordByEmail(String email, String password);
	Member selectMemberByIdAndPasswordByName(String name, String password);
	List<Member> selectMemberbyMemberName(String text);
}
