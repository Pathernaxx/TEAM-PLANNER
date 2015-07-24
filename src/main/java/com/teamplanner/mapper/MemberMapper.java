package com.teamplanner.mapper;

import java.util.HashMap;

import com.teamplanner.dto.Member;

public interface MemberMapper {
	void insertMember(Member member);
	String selectMemberByUserNameCheck(String userName);
	String selectMemberByEmailCheck(String email);
	Member selectMemberByMemberNo(int memberNo);
	void updateMemberName(Member member);
	void updateMemberNotification(HashMap<String, Object> params);
	void updateMemberIconPath(HashMap<String, Object> params);
	void updateMemberPassword(HashMap<String, Object> params);
	Member selectMemberByIdAndPasswordByEmail(HashMap<String, String> params);
	Member selectMemberByIdAndPasswordByName(HashMap<String, String> params);
	Member updateMemberView(int memberNo);
}
