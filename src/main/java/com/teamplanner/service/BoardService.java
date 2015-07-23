package com.teamplanner.service;

import java.util.List;

import com.teamplanner.dto.Board;

import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;

public interface BoardService {
	void insertBoard(String boardName);
	int getBoardNo(String boardName);
	void insertTeamList(int boardNo, int memberNo);
	List<Board> selectBoardbyTeamList(int memberNo); //return boardNo
	boolean checkBoardName(String title);
	String selectClosedBoardName(int boardNo, int closed);//memberNo로 뽑힌
	
	List<BoardList> BoardView(int boardNo);
	List<Card> selectCard(int listNo);
}