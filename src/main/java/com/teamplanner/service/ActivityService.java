package com.teamplanner.service;

import java.util.List;

import com.teamplanner.dto.ActionPrint;
import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.Member;

public interface ActivityService {
	void createBoard(Board board, Member member);
	void addActivity(Member member, BoardList list, Board board);
	void addActivity(Member member, Card card, BoardList list, Board board);
	void addActivity(Member member, CheckList checklist, int cardno);
	void addActivity(Member member, Member addMember, Board board);
	void attachmentActivity(Member member, Attachment attachment, int cardno);
	void commentActivity(Member member, int cardno, Comment comment); //on 코멘트 등록
	void moveActivity(Member member, Card card, String message, Board board);
	void madeMemberActivity(Member member, Member teamMember, Board board);
	void completeCheckActivity(Member member, CheckItem item, Card card, Board board);
	void markCheckActivity(Member member, CheckItem item, Board board);
	void deletedActivity(Member member, Attachment attachment, Card card, Board board);
	void deletedActivity(Member member, Card card, BoardList list, Board board);
	void renameActivity(Member member, Card card, String beforName, Board board);
	void renameActivity(Member member, BoardList list, String beforName, Board board);
	void renameActivity(Member member, String beforName, Board board);
	void removeActivity(Member member, CheckList checklist, Card card, Board board);
	void removeActivity(Member member, Member teamMember, Card card, Board board);	// 태그 멤버 삭제
	void archiveActivity(Member member, BoardList list, Board board);	// 리스트 저장소
	void archiveActivity(Member member, Card card, Board board);	// 카드 저장소
	void copyActivity(Member member, Card card, String message, Board board);
	void sentActivity(Member member, Card card, Board board);	// 카드 복귀
	void sentActivity(Member member, BoardList list, Board board);	//리스트 복귀
	List<ActionPrint> activityListByMember(int memberNo);
	List<ActionPrint> activityListByBoard(int boardNo);
}
