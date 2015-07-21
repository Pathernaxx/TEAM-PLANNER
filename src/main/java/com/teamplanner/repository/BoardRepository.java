package com.teamplanner.repository;

import java.util.List;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.Card;

public interface BoardRepository {
	
//////////////동윤///////////////////////
	void createBoard(String boardName);
	int getTeamList(int memberNo); //return boardNo
	String getBoardName(int boardNo);//memberNo로 뽑힌
	String getClosedBoardName(int boardNo, int closed);//memberNo로 뽑힌
	
//////////////유정///////////////////////
	Board selectBoardByList(int boardNo); //Board객체에 BoardList 있음
	List<Card> selectCard(int listNo);
	
}
