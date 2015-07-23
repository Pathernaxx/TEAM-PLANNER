package com.teamplanner.service;

import java.util.List;

import com.teamplanner.dto.Board;

public interface BoardService {
	void insertBoard(String boardName);
	int getBoardNo(String boardName);
	void insertTeamList(int boardNo, int memberNo);
	List<Board> selectBoardbyTeamList(int memberNo); //return boardNo
	boolean checkBoardName(String title);
	String selectClosedBoardName(int boardNo, int closed);//memberNo로 뽑힌
}
