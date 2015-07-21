package com.teamplanner.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.TagMember;
import com.teamplanner.mapper.CardMapper;

public class OracleCardRepository implements CardRepository {
	
	private CardMapper cardMapper;
	@Autowired
	@Qualifier("cardMapper")
	public void setMainMapper(CardMapper cardMapper){
		this.cardMapper = cardMapper;
	}

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
