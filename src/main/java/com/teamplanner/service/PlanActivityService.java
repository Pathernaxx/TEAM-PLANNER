package com.teamplanner.service;

import java.util.List;

import com.teamplanner.dto.Activity;
import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.Member;

public class PlanActivityService implements ActivityService {

	@Override
	public void createBoard(Board board, Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addActivity(Member member, BoardList list, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addActivity(Member member, Card card, BoardList list,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addActivity(Member member, CheckList checklist, Card card,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addActivity(Member member, Member addMember, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void attachmentActivity(Member member, Attachment attachment,
			Card card, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void commentActivity(Member member, Card card, Comment comment,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void moveActivity(Member member, Card card, String message,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void madeMemberActivity(Member member, Member teamMember, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void completeCheckActivity(Member member, CheckItem item, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void markCheckActivity(Member member, CheckItem item, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletedActivity(Member member, Attachment attachment,
			Card card, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletedActivity(Member member, Card card, BoardList list,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void renameActivity(Member member, Card card, String beforName,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void renameActivity(Member member, BoardList list, String beforName,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void renameActivity(Member member, String beforName, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeActivity(Member member, CheckList checklist, Card card,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeActivity(Member member, Member teamMember, Card card,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void archiveActivity(Member member, BoardList list, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void archiveActivity(Member member, Card card, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void copyActivity(Member member, Card card, String message,
			Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sentActivity(Member member, Card card, Board board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sentActivity(Member member, BoardList list, Board board) {
		// TODO Auto-generated method stub
		
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
