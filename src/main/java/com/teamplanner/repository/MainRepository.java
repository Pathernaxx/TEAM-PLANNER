package com.teamplanner.repository;

public interface MainRepository {
	void createBoard(String boardName);
	int getTeamList(int memberNo); //return boardNo
	String getBoardName(int boardNo);//memberNo로 뽑힌
	String getClosedBoardName(int boardNo, int closed);//memberNo로 뽑힌
}
