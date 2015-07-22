package com.teamplanner.mapper;

import java.util.HashMap;
import java.util.List;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.Card;

public interface BoardMapper {
	
	//////////////동윤///////////////////////
	void insertBoard(String boardName);
	int getBoardNo(String boardName);
	void insertTeamList(int boardNo, int memberNo);
	int selectTeamList(int memberNo); //return boardNo
	String selectBoardName(int boardNo);//memberNo로 뽑힌
	String selectClosedBoardName(int boardNo, int closed);//memberNo로 뽑힌
	
	//////////////유정///////////////////////
	Board selectBoardByList(int boardNo); //Board객체에 BoardList 있음
	List<Card> selectCard(int listNo);
	void insertCard(Card card);//boardno, listno 가지고 들어옴
}
