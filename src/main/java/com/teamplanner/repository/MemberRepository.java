package com.teamplanner.repository;

import com.teamplanner.dto.Member;

public interface MemberRepository {
	void insertMember(Member member);
	boolean selectMemberByIdCheck(String id);
	Member selectMemberByMemberNo(int memberNo);
	void updateMember(Member member);
	Member selectMemberByIdAndPassword(String id, String password);
}
