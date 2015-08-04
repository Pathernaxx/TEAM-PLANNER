package com.teamplanner.repository;

import java.util.List;

import com.teamplanner.dto.Activity;
import com.teamplanner.dto.ActivityTarget;
import com.teamplanner.dto.Card;

public interface ActivityRepository {
	Card selectCard(int cardno);
	int insertActivity(Activity activity);
	void insertActivityTarget(ActivityTarget activityTarget);
	List<Activity> selectActivityByBoard(int boardNo);
	List<Activity> selectActivityByMember(int memberNo);
}
