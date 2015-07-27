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
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("boardNo", boardNo);
		params.put("memberNo", memberNo);
		
		boardMapper.insertTeamList(params);
	}	
	@Override
	public List<Board> selectBoardbyTeamList(int memberNo) {
		List<Board> boards = boardMapper.selectBoardbyTeamList(memberNo);
		return boards;
	}
	@Override
	public boolean checkBoardName(String title) {
		
		String check = boardMapper.checkBoardName(title);
		boolean checkName = false;
		if(check !=null){	
			checkName = true;	//중복될 때
		}else{
			checkName = false;
		}
			
		return checkName;
	}
	@Override
	public List<Board> selectClosedBoard(int memberNo){
		
		List<Board> boards = boardMapper.selectClosedBoard(memberNo);
		
		return boards;
	}
	public List<Board> selectBoardbyBoardName(int memberNo , String text){
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("memberNo", memberNo);
		params.put("text", text);
		
		return boardMapper.selectBoardbyBoardName(params);
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
