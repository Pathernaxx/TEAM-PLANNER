package com.teamplanner.repository;

import java.util.HashMap;
import java.util.List;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.Member;

public interface BoardRepository {
	
//////////////동윤///////////////////////
	void insertBoard(String boardName);
	int getBoardNo(String boardName);
	void insertTeamList(int boardNo, int memberNo);
	List<Board> selectBoardbyTeamList(int memberNo); //return boardNo
	boolean checkBoardName(String title);
	List<Board> selectClosedBoard(int memberNo);//memberNo로 뽑힌
	List<Board> selectBoardbyBoardName(int memberNo , String text);
	void addFriend(int memberNo , int friendNo);
	void openClosedBoardPage(int boardNo);
	BoardList selectBoardListBylistNo(int listno);
	
	void addTagMember(int tagMemberNo, int boardNo);
	void addTagFriend(int friendNo, int boardNo);
	List<Member> selectTeamlistByBoardNo(int boardNo, int memberNo);
	List<Member> selectTagFriend(int boardNo, int memberNo);
	int selectUserType(int memberNo, int boardNo);
	void closedBoard(int boardNo);
	void exitBoard(int memberNo , int boardNo);
//////////////유정///////////////////////
	Board selectBoardByList(int boardNo); //Board객체에 BoardList 있음
	List<Card> selectCard(int listNo);
	int insertCard(Card card);
	void insertBoardList(BoardList boardlist);
	String getBoardNameByNo(int boardno);
	String selectCardInfo(int boardNo, int listNo, int cardNo);
	String getBoardName(int boardNo);
	String getListName(int boardno, int listno);
	List<Attachment> selectAttachmentListByBoardno(int boardno);
}
