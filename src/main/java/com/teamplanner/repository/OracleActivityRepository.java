package com.teamplanner.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teamplanner.dto.Activity;
import com.teamplanner.dto.ActivityTarget;
import com.teamplanner.mapper.ActivityMapper;

@Repository(value="activityRepository")
public class OracleActivityRepository implements ActivityRepository
{
	private ActivityMapper activityMapper;
	
	@Autowired
	@Qualifier(value="activityMapper")
	public void setActivityMapper(ActivityMapper activityMapper) {
		this.activityMapper = activityMapper;
	}

	@Override
	public void insertActivityTarget(ActivityTarget activityTarget) {
		activityMapper.insertActivityTarget(activityTarget);
		
	}

	@Override
	public int insertActivity(Activity activity) {
		// TODO Auto-generated method stub
		activityMapper.insertActivity(activity);
		
		return activity.getNo();
	}

	@Override
	public List<Activity> selectActivityByBoard(int boardNo) {
		// TODO Auto-generated method stub
		return activityMapper.selectActivityByBoard(boardNo);
	}

	@Override
	public List<Activity> selectActivityByMember(int memberNo) {
		// TODO Auto-generated method stub
		return activityMapper.selectActivityByMember(memberNo);
	}
	
}
