package com.teamplanner.repository;

import java.util.List;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.TagMember;

public interface CardRepository {

	List<Comment> selectComment(int cardNo);
	List<Attachment> selectAttachment(int cardNo);
	List<CheckList> selectCheckList(int cardNo);
	List<CheckItem> selectCheckItem(int checklistNo);
	List<TagMember> selectTagMember(int cardNo);
}
