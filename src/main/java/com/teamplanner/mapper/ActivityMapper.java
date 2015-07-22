package com.teamplanner.mapper;

import java.util.List;

import com.teamplanner.dto.Activity;

public interface ActivityMapper {
	void insertActivity(Activity activity);
	List<Activity> selectActivityByBoard(int boardNo);
	List<Activity> selectActivityByUser(int userNo);
}
