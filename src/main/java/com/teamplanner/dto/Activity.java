package com.teamplanner.dto;

import java.util.Date;

public class Activity {
	private int no;
	private int typeNo;
	//private int targetNo;
	private ActivityTarget target;
	private int userNo;
	private String userName;
	private Date regDate;
	private int backNo; 
	private String backaTitle;
	private int boardNo;
	private String boardName;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}
	public ActivityTarget getTarget() {
		return target;
	}
	public void setTarget(ActivityTarget target) {
		this.target = target;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getBackNo() {
		return backNo;
	}
	public void setBackNo(int backNo) {
		this.backNo = backNo;
	}
	public String getBackaTitle() {
		return backaTitle;
	}
	public void setBackaTitle(String backaTitle) {
		this.backaTitle = backaTitle;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
}
