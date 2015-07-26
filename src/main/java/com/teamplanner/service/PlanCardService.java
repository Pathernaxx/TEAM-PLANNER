package com.teamplanner.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.TagMember;

@Service(value="cardService")
public class PlanCardService implements CardService {

	@Override
	public List<Comment> selectComment(int cardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Attachment> selectAttachment(int cardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CheckList> selectCheckList(int cardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CheckItem> selectCheckItem(int checklistNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TagMember> selectTagMember(int cardNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
