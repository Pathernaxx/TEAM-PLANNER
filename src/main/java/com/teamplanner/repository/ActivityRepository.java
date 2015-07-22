package com.teamplanner.repository;

import java.util.List;

import com.teamplanner.dto.Activity;

public interface ActivityRepository {
	void insertActivity(Activity activity);
	List<Activity> selectActivityByBoard(int boardNo);
	List<Activity> selectActivityByUser(int userNo);
}
