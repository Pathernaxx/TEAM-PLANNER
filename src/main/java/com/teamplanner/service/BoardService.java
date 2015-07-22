package com.teamplanner.service;

public interface BoardService {
	void insertBoard(String boardName);
	int getBoardNo(String boardName);
	void insertTeamList(int boardNo, int memberNo);
	int selectTeamList(int memberNo); //return boardNo
	String selectBoardName(int boardNo);//memberNo로 뽑힌
	String selectClosedBoardName(int boardNo, int closed);//memberNo로 뽑힌
}
