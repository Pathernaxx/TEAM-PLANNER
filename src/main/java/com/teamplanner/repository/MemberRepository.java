package com.teamplanner.repository;

import java.util.HashMap;
import java.util.List;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.Member;

public interface MemberRepository {
	void insertMember(Member member);
	int selectMeNotUserNameCheck(int memberNo, String userName);
	int selectMemberByNoAndPassByPasswordCheck(int memberNo, String password);
	String selectMemberByUserNameCheck(String userName);
	String selectMemberByEmailCheck(String email);
	Member selectMemberByMemberNo(int memberNo);
	void updateMemberName(Member member);
	void updateMemberNotification(int memberNo, boolean notification);
	void updateMemberIconPath(String iconpath, int memberNo);
	void updateMemberPassword(String password, int memberNo);
	Member selectMemberByIdAndPasswordByEmail(String email, String password);
	Member selectMemberByIdAndPasswordByName(String name, String password);
	
	////////////////////////////////////////////////
	Member updateMemberView(int memberNo);
	void updateMember(Member member);
	List<Member> selectMemberbyMemberName(int memberNo , String text);
	List<Member> searchTagAllMember(String key , int memberNo, int boardno);
	List<Member> selectTagFriend(int boardNo, int memberNo);
}
