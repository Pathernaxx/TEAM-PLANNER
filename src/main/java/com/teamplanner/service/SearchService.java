package com.teamplanner.service;

import java.util.List;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.Member;

public interface SearchService {
	List<Board> searchBoard(int memberNo , String text);
	List<Member> searchMember(int memberNo , String text);
	List<Member> searchTagAllMember(String key , int memberNo, int boardno);
	List<Member> selectTagFriend(int boardNo , int memberNo);
}
