package com.teamplanner.mapper;

import java.util.HashMap;

import com.teamplanner.dto.Member;

public interface MemberMapper {
	void insertMember(Member member);
	boolean selectMemberByIdCheck(String id);
	Member selectMemberByMemberNo(int memberNo);
	void updateMember(Member member);
	Member selectMemberByIdAndPassword(HashMap<String, String> params);
}
