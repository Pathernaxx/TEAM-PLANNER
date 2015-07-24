package com.teamplanner.service;


public interface MemberService {
	void changeName(int memberNo, String username, String fullname);
	void changePassword(int memberNo, String password);
	void changeNotification(int memberNo, boolean notification);
	void changeIconPath(int memberNo, String iconpath);
}
