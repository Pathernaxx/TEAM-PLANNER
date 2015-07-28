package com.teamplanner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.teamplanner.dto.Activity;
import com.teamplanner.dto.ActivityTarget;
import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.Member;
import com.teamplanner.repository.ActivityRepository;

interface TARGET {
	int NONE = 0;
	int BOARD = 1;
	int LIST = 2;
	int CARD = 3;
	int CHECKLIST = 4;
	int ATTACHMENT = 5;
	int COMMENT = 6;
	int MEMBER = 7;
}

interface TYPE {
	int NONE = 0;
	int ADDED = 1;
	int ON = 2;
	int CREATED = 3;
	int ATTACHED = 4;
	int MOVED = 5;
	int MADE = 6;
	int COMPLETED = 7;
	int RENAMED = 8;
	int REMOVED = 9;
	int MARKED = 10;
	int DELETED = 11;
	int ARCHIVED = 12;
	int COPIED = 13;
	int SENT = 14;
}

/**
 * @author Kre
 *
 */
public class PlanActivityService implements ActivityService {
	//private enum TYPE {NONE, ADDED, ON, CREATED, ATTACHED, MOVED, MADE, COMPLETED, RENAMED, REMOVED, MARKED, DELETED, ARCHIVED, COPIED, SENT};

	private ActivityRepository activityRepository;
	
	@Autowired
	@Qualifier(value="activityRepository")
	public void setActivityRepository(ActivityRepository activityRepository)
	{
		this.activityRepository = activityRepository;
	}
	
	@Override
	public void createBoard(Board board, Member member) {
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.CREATED);
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.BOARD);
		actTarget.setTargetNo(board.getNo());
		actTarget.setTargetName(board.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void addActivity(Member member, BoardList list, Board board) {
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.ADDED);
		activity.setBackNo(board.getNo());
		activity.setBackTitle(board.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.LIST);
		actTarget.setTargetNo(list.getNo());
		actTarget.setTargetName(list.getName());
		
		activityRepository.insertActivityTarget(actTarget);
	}

	/**
	 * Card 추가
	 * @author Nyung
	 * @see None
	 */
	@Override
	public void addActivity(Member member, Card card, BoardList list,
			Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.ADDED);
		activity.setBackNo(list.getNo());
		activity.setBackTitle(list.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CARD);
		actTarget.setTargetNo(card.getNo());
		actTarget.setTargetName(card.getName());
		
		activityRepository.insertActivityTarget(actTarget);
	}

	/**
	 * CheckList 추가
	 */
	@Override
	public void addActivity(Member member, CheckList checklist, Card card,
			Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.ADDED);
		activity.setBackNo(card.getNo());
		activity.setBackTitle(card.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CHECKLIST);
//		actTarget.setTargetNo();
//		actTarget.setTargetName();
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void addActivity(Member member, Member addMember, Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.ADDED);
		activity.setBackNo(board.getNo());
		activity.setBackTitle(board.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.MEMBER);
		actTarget.setTargetNo(addMember.getNo());
		actTarget.setTargetName(addMember.getUserName());
		
		activityRepository.insertActivityTarget(actTarget);
	}

	@Override
	public void attachmentActivity(Member member, Attachment attachment,
			Card card, Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.ATTACHED);
		activity.setBackNo(card.getNo());
		activity.setBackTitle(card.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.ATTACHMENT);
		actTarget.setTargetNo(attachment.getNo());
		actTarget.setTargetName(attachment.getUserFileName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void commentActivity(Member member, Card card, Comment comment,
			Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.ON);
		activity.setBackNo(card.getNo());
		activity.setBackTitle(card.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.COMMENT);
//		actTarget.setTargetNo();
//		actTarget.setTargetName();
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void moveActivity(Member member, Card card, String message,
			Board board) {
		// 혹은 list 두개 받기.
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.MOVED);
		//activity.setBackNo(card.getNo());
		activity.setBackTitle(message);
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CARD);
		actTarget.setTargetNo(card.getNo());
		actTarget.setTargetName(card.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void madeMemberActivity(Member member, Member teamMember, Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.MADE);
		activity.setBackNo(board.getNo());
		activity.setBackTitle(board.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.MEMBER);
		actTarget.setTargetNo(teamMember.getNo());
		actTarget.setTargetName(teamMember.getUserName());
		
		activityRepository.insertActivityTarget(actTarget);
	}

	// 수정 요망 후위 Card 필요
	@Override
	public void completeCheckActivity(Member member, CheckItem item, Board board) {
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.COMPLETED);
//		activity.setBackNo(card.getNo());
//		activity.setBackTitle(card.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
//		actTarget.setTypeNo(TARGET.CHECKITEM);
//		actTarget.setTargetNo();
//		actTarget.setTargetName();
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void markCheckActivity(Member member, CheckItem item, Board board) {

		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.ADDED);
//		activity.setBackNo(card.getNo());
//		activity.setBackTitle(card.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CHECKLIST);
//		actTarget.setTargetNo(0);
//		actTarget.setTargetName();
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void deletedActivity(Member member, Attachment attachment,
			Card card, Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.DELETED);
		activity.setBackNo(card.getNo());
		activity.setBackTitle(card.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.ATTACHMENT);
		actTarget.setTargetNo(attachment.getNo());
		actTarget.setTargetName(attachment.getUserFileName());
		
		activityRepository.insertActivityTarget(actTarget);	
	}

	@Override
	public void deletedActivity(Member member, Card card, BoardList list,
			Board board) {

		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.DELETED);
		activity.setBackNo(list.getNo());
		activity.setBackTitle(list.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CARD);
		actTarget.setTargetNo(card.getNo());
		actTarget.setTargetName(card.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void renameActivity(Member member, Card card, String beforName,
			Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.RENAMED);
		activity.setBackNo(0);
		activity.setBackTitle(beforName);
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CARD);
		actTarget.setTargetNo(card.getNo());
		actTarget.setTargetName(card.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void renameActivity(Member member, BoardList list, String beforName,
			Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.RENAMED);
		activity.setBackNo(0);
		activity.setBackTitle(beforName);
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.LIST);
		actTarget.setTargetNo(list.getNo());
		actTarget.setTargetName(list.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void renameActivity(Member member, String beforName, Board board) {

		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.RENAMED);
		activity.setBackNo(0);
		activity.setBackTitle(beforName);
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.BOARD);
		actTarget.setTargetNo(board.getNo());
		actTarget.setTargetName(board.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void removeActivity(Member member, CheckList checklist, Card card,
			Board board) {

		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.REMOVED);
		activity.setBackNo(card.getNo());
		activity.setBackTitle(card.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CHECKLIST);
//		actTarget.setTargetNo();
//		actTarget.setTargetName();
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void removeActivity(Member member, Member teamMember, Card card,
			Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.REMOVED);
		activity.setBackNo(card.getNo());
		activity.setBackTitle(card.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.MEMBER);
		actTarget.setTargetNo(teamMember.getNo());
		actTarget.setTargetName(teamMember.getUserName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void archiveActivity(Member member, BoardList list, Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.ARCHIVED);
		activity.setBackNo(0);
		activity.setBackTitle(board.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.LIST);
		actTarget.setTargetNo(list.getNo());
		actTarget.setTargetName(list.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void archiveActivity(Member member, Card card, Board board) {
		
		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.ARCHIVED);
		activity.setBackNo(0);
		activity.setBackTitle(board.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CARD);
		actTarget.setTargetNo(card.getNo());
		actTarget.setTargetName(card.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public void copyActivity(Member member, Card card, String message,
			Board board) {

		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.COPIED);
		activity.setBackNo(0);
		activity.setBackTitle(message);
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CARD);
		actTarget.setTargetNo(card.getNo());
		actTarget.setTargetName(card.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	/**
	 * Archived에서 카드, 보드로 복귀
	 */
	@Override
	public void sentActivity(Member member, Card card, Board board) {

		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.SENT);
		activity.setBackNo(card.getNo());
		activity.setBackTitle(card.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.CARD);
		actTarget.setTargetNo(card.getNo());
		actTarget.setTargetName(card.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	/**
	 * Archived에서 리스트, 보드로 복귀
	 */
	@Override
	public void sentActivity(Member member, BoardList list, Board board) {

		Activity activity = new Activity();
		ActivityTarget actTarget = new ActivityTarget();
		
		activity.setUserNo(member.getNo());
		activity.setUserName(member.getUserName());
		activity.setTypeNo(TYPE.SENT);
		activity.setBackNo(board.getNo());
		activity.setBackTitle(board.getName());
		activity.setBoardNo(board.getNo());
		activity.setBoardName(board.getName());
		
		int activityno = activityRepository.insertActivity(activity);
		
		actTarget.setActivityNo(activityno);
		actTarget.setTypeNo(TARGET.LIST);
		actTarget.setTargetNo(list.getNo());
		actTarget.setTargetName(list.getName());
		
		activityRepository.insertActivityTarget(actTarget);
		
	}

	@Override
	public List<Activity> activityListByMember(int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Activity> activityListByBoard(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
