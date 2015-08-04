package com.teamplanner.mapper;

import java.util.HashMap;
import java.util.List;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.Member;

public interface BoardMapper {
	
	//////////////동윤///////////////////////
	void insertBoard(String boardName);
	int getBoardNo(String boardName);
	void insertTeamList(HashMap<Object, Object> params);
	List<Board> selectBoardbyTeamList(int memberNo); //return boardNo
	String checkBoardName(String title);
	List<Board> selectClosedBoard(int memberNo);//memberNo로 뽑힌
	List<Board> selectBoardbyBoardName(HashMap<Object, Object> params);
	BoardList selectBoardListBylistNo(int listno);
	void addFriend(HashMap<Object, Object> params);
	void openClosedBoardPage(int boardNo);
	void addTagMember(HashMap<Object, Object> params);
	void addTagFriend(HashMap<Object, Object> params);
	List<Member> selectTeamlistByBoardNo(HashMap<Object, Object> params);
	List<Member> selectTagFriend(HashMap<Object, Object> params);
	int selectUserType(HashMap<Object, Object> params);
	void closedBoard(int boardNo);
	void exitBoard(HashMap<Object, Object> params);
	//////////////유정///////////////////////
	Board selectBoardByList(int boardNo); //Board객체에 BoardList 있음
	List<Card> selectCard(int listNo);
	void insertCard(Card card);//boardno, listno 가지고 들어옴
	void insertBoardList(BoardList boardlist);
	String getBoardNameByNo(int boardno);
	String selectCardInfo(HashMap<Object, Object> params);
	String getBoardName(int boardNo);
	String getListName(HashMap<Object, Object> params);
	List<Attachment> selectAttachmentListByBoardno(int boardno);
}
