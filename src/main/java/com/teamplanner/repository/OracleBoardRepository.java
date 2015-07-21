package com.teamplanner.repository;

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
	public void setMainMapper(BoardMapper boardMapper){
		this.boardMapper = boardMapper;
	}
	
  ////////////////////동윤////////////////
	@Override
	public void createBoard(String boardName) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int getTeamList(int memberNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public String getBoardName(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getClosedBoardName(int boardNo, int closed) {
		// TODO Auto-generated method stub
		return null;
	}
	
	////////////////////유정////////////////
	@Override
	public Board selectBoardByList(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Card> selectCard(int listNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
