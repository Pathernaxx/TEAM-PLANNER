package com.teamplanner.mapper;

import java.util.HashMap;
import java.util.List;

import com.teamplanner.dto.Member;

public interface MemberMapper {
	void insertMember(Member member);
	int selectMeNotUserNameCheck(HashMap<String, Object> params);
	int selectMemberByNoAndPassByPasswordCheck(HashMap<String, Object> params);
	String selectMemberByUserNameCheck(String userName);
	String selectMemberByEmailCheck(String email);
	Member selectMemberByMemberNo(int memberNo);
	void updateMemberName(Member member);
	void updateMemberNotification(HashMap<String, Object> params);
	void updateMemberIconPath(HashMap<String, Object> params);
	void updateMemberPassword(HashMap<String, Object> params);
	Member selectMemberByIdAndPasswordByEmail(HashMap<String, String> params);
	Member selectMemberByIdAndPasswordByName(HashMap<String, String> params);
	///////////////////////////////////////////////
	Member updateMemberView(int memberNo);
	void updateMember(Member member);
	List<Member> selectMemberbyMemberName(HashMap<Object, Object> params);
	List<Member> searchTagAllMember(HashMap<Object, Object> params);
	List<Member> selectTagFriend(HashMap<Object, Object> params);
}
