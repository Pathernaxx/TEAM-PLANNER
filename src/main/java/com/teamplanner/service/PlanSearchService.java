package com.teamplanner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.Member;
import com.teamplanner.repository.BoardRepository;
import com.teamplanner.repository.MemberRepository;

@Service(value="searchService")
public class PlanSearchService implements SearchService{
	
	private BoardRepository boardRepository; 
	@Autowired
	@Qualifier("boardRepository")
	public void setBoardRepository(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}
	private MemberRepository memberRepository; 
	@Autowired
	@Qualifier("memberRepository")
	public void setMemberRepository(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	@Override
	public List<Board> searchBoard(int memberNo , String text) {
		
		return boardRepository.selectBoardbyBoardName(memberNo, text);
	}

	@Override
	public List<Member> searchMember(String text) {
		
		return memberRepository.selectMemberbyMemberName(text);
	}
	
}
