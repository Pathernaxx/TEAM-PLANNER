package com.teamplanner.repository;

import java.util.List;

import com.teamplanner.dto.Activity;
import com.teamplanner.dto.ActivityTarget;

public interface ActivityRepository {
	int insertActivity(Activity activity);
	void insertActivityTarget(ActivityTarget activityTarget);
	List<Activity> selectActivityByBoard(int boardNo);
	List<Activity> selectActivityByMember(int memberNo);
}
