package com.teamplanner.mapper;

import java.util.List;

import com.teamplanner.dto.Activity;
import com.teamplanner.dto.ActivityTarget;

public interface ActivityMapper {
	void insertActivity(Activity activity);
	void insertActivityTarget(ActivityTarget activitytarget);
	List<Activity> selectActivityByBoard(int boardNo);
	List<Activity> selectActivityByMember(int memberNo);
}
