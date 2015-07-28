package com.teamplanner.dto;

import java.util.Date;

public class ActionPrint {
	private int userNo;
	private String userName;
	private String type;
	private String frontLink;
	private String frontText;
	private String backLink;
	private String backText;
	private Date curDate;
	private String boardLink;
	private String boardName;
	
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFrontLink() {
		return frontLink;
	}
	public void setFrontLink(String frontLink) {
		this.frontLink = frontLink;
	}
	public String getFrontText() {
		return frontText;
	}
	public void setFrontText(String frontText) {
		this.frontText = frontText;
	}
	public String getBackLink() {
		return backLink;
	}
	public void setBackLink(String backLink) {
		this.backLink = backLink;
	}
	public String getBackText() {
		return backText;
	}
	public void setBackText(String backText) {
		this.backText = backText;
	}
	public Date getCurDate() {
		return curDate;
	}
	public void setCurDate(Date curDate) {
		this.curDate = curDate;
	}
	public String getBoardLink() {
		return boardLink;
	}
	public void setBoardLink(String boardLink) {
		this.boardLink = boardLink;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
}
