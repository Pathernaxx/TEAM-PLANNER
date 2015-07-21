package com.teamplanner.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teamplanner.mapper.BoardMapper;

@Repository(value="boardRepository")
public class OracleBoardRepository implements BoardRepository{
	
	private BoardMapper boardMapper;
	@Autowired
	@Qualifier("boardMapper")
	public void setMainMapper(BoardMapper boardMapper){
		this.boardMapper = boardMapper;
	}
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
}
