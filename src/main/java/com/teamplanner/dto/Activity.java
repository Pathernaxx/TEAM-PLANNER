package com.teamplanner.dto;

public class Activity {
	private int no;
	private int typeNo;
	private ActivityTarget target;
	private int userNo;
	private String userName;
	private String regDate;
	private int backNo; 
	private String backTitle;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getBackNo() {
		return backNo;
	}
	public void setBackNo(int backNo) {
		this.backNo = backNo;
	}
	public String getBackTitle() {
		return backTitle;
	}
	public void setBackTitle(String backTitle) {
		this.backTitle = backTitle;
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
