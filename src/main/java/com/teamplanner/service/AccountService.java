package com.teamplanner.service;

import com.teamplanner.dto.Member;

public interface AccountService {

	Member AccountLogin(String id, String password);
	void AccountLogout();
	void joinWithUs(Member member);
	boolean IdCheckForEmail(String email);
	boolean IdCheckForUserName(String userName);
}
