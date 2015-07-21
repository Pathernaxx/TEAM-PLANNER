package com.teamplanner.service;

import com.teamplanner.dto.Member;

public interface AccountService {

	Member AccountLogin(String id, String password);
	void AccountLogout();
}
