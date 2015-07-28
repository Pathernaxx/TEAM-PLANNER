package com.teamplanner.dto;

public class CheckItem {
	private int no;
	private String name;
	private boolean checked;
	private int checklistno;
	
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
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public int getChecklistno() {
		return checklistno;
	}
	public void setChecklistno(int checklistno) {
		this.checklistno = checklistno;
	}
	
}
