package com.teamplanner.repository;

import java.util.HashMap;
import java.util.List;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.Card;

public interface BoardRepository {
	
//////////////동윤///////////////////////
	void insertBoard(String boardName);
	int getBoardNo(String boardName);
	void insertTeamList(int boardNo, int memberNo);
	List<Board> selectBoardbyTeamList(int memberNo); //return boardNo
	boolean checkBoardName(String title);
	List<Board> selectClosedBoard(int memberNo);//memberNo로 뽑힌
	List<Board> selectBoardbyBoardName(int memberNo , String text);
	
//////////////유정///////////////////////
	Board selectBoardByList(int boardNo); //Board객체에 BoardList 있음
	List<Card> selectCard(int listNo);
	void insertCard(Card card);
}
