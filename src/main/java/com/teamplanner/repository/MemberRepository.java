package com.teamplanner.repository;

import com.teamplanner.dto.Member;

public interface MemberRepository {
	void insertMember(Member member);

	String selectMemberByUserNameCheck(String userName);

	String selectMemberByEmailCheck(String email);

	Member selectMemberByMemberNo(int memberNo);

	void updateMember(Member member);

	Member selectMemberByIdAndPassword(String email, String password);
}
