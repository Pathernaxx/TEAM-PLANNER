package com.teamplanner.service;

import java.util.List;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.Member;

public interface BoardService {
	void insertBoard(String boardName);
	int getBoardNo(String boardName);
	void insertTeamList(int boardNo, int memberNo);
	List<Board> selectBoardbyTeamList(int memberNo); //return boardNo
	boolean checkBoardName(String title);
	List<Board> selectClosedBoard(int memberNo);//memberNo로 뽑힌
	void addFriend(int memberNo , int friendNo);
	String getBoardNameByNo(int boardno);
	void openClosedBoardPage(int boardNo);
	BoardList selectBoardListBylistNo(int listno);
	
	List<BoardList> BoardView(int boardNo);
	List<Card> selectCard(int listNo);
	void insertCard(Card card);
	void insertBoardList(BoardList boardlist);
	
	String selectCardInfo(int boardNo, int listNo, int cardNo);
	String getBoardName(int boardNo);
	String getListName(int boardno, int listno);
	
	void addTagMember(int tagMemberNo, int boardNo);
	void addTagFriend(int friendNo, int boardNo);
	List<Member> selectTeamlistByBoardNo(int boardNo, int memberNo);
	List<Member> selectTagFriend(int boardNo, int memberNo);
	
	Member selectMemberByMemberNo(int memberNo);
	int selectUserType(int memberNo, int boardNo);
	void closedBoard(int boardNo);
	void exitBoard(int memberNo , int boardNo);
}
