package com.teamplanner.dto;

import java.util.Date;
import java.util.List;

public class Board {
	private int no;
	private String name;
	private String regdate;
	private boolean visibility;
	private boolean closed;
	
	private List<BoardList> boardlists;
	
	public Board() {
		
	}
	
	public Board(int no, String name) {
		this.no = no;
		this.name = name;
	}
	
	public List<BoardList> getBoardlists() {
		return boardlists;
	}
	public void setBoardlist(List<BoardList> boardlists) {
		this.boardlists = boardlists;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public boolean isVisibility() {
		return visibility;
	}
	public void setVisibility(boolean visibility) {
		this.visibility = visibility;
	}
	public boolean isClosed() {
		return closed;
	}
	public void setClosed(boolean closed) {
		this.closed = closed;
	}
}
