package com.teamplanner.mapper;

import java.util.List;

import com.teamplanner.dto.Activity;
import com.teamplanner.dto.ActivityTarget;
import com.teamplanner.dto.Board;
import com.teamplanner.dto.Card;

public interface ActivityMapper {
	Card selectCard(int cardNo);
	void insertActivity(Activity activity);
	void insertActivityTarget(ActivityTarget activitytarget);
	List<Activity> selectActivityByBoard(int boardNo);
	List<Activity> selectActivityByMember(int memberNo);
}
