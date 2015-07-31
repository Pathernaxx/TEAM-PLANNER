package com.teamplanner.dto;

import java.util.Date;
import java.util.List;

public class CheckList {
	private int no;
	private int cardNo;
	private Date regDate;
	private String name;
	
	private List<CheckItem> checkItems;
	
	public List<CheckItem> getCheckItems() {
		return checkItems;
	}
	
	public void setCheckItems(List<CheckItem> checkItems) {
		this.checkItems = checkItems;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
