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
	List<Board> selectClosedBoard(int memberNo);//memberNo로 뽑힌
	
	List<BoardList> BoardView(int boardNo);
	List<Card> selectCard(int listNo);
	void insertCard(Card card);
	void insertBoardList(BoardList boardlist);
	String getBoardNameByNo(int boardno);
	String selectCardInfo(int boardNo, int listNo, int cardNo);
}
