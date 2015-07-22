package com.teamplanner.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.Card;
import com.teamplanner.mapper.BoardMapper;

@Repository(value="boardRepository")
public class OracleBoardRepository implements BoardRepository{
	
	private BoardMapper boardMapper;
	@Autowired
	@Qualifier("boardMapper")
	public void setBoardMapper(BoardMapper boardMapper){
		this.boardMapper = boardMapper;
	}
	
  ////////////////////동윤////////////////
	@Override
	public void insertBoard(String boardName) {
		boardMapper.insertBoard(boardName);
	}
	public int getBoardNo(String boardName){
		int boardNo = boardMapper.getBoardNo(boardName);
		return boardNo;
	}
	public void insertTeamList(int boardNo, int memberNo){
		
	}
	
	
	@Override
	public int selectTeamList(int memberNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public String selectBoardName(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String selectClosedBoardName(int boardNo, int closed) {
		// TODO Auto-generated method stub
		return null;
	}
	
	////////////////////유정////////////////
	@Override
	public Board selectBoardByList(int boardNo) {
		
		return boardMapper.selectBoardByList(boardNo);
	}
	@Override
	public List<Card> selectCard(int listNo) {
	
		return boardMapper.selectCard(listNo);
	}

	@Override
	public void insertCard(Card card) {
		
		boardMapper.insertCard(card);
	}
}
