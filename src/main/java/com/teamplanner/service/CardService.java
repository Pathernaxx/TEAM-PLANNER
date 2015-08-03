package com.teamplanner.service;

import java.util.HashMap;
import java.util.List;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.TagMember;

public interface CardService {
	List<Comment> selectComment(int cardNo);
	List<CheckList> selectCheckList(int cardNo);
	List<CheckItem> selectCheckItem(int checklistNo);
	List<TagMember> selectTagMember(int cardNo);
	
	int insertAttachment(Attachment attachment);
	void writeCardInfo(Card card);
	List<Attachment> selectAttachmentList(int cardno, int boardno);
	Attachment selectAttachment(int attachmentno);
	void deleteAttachment(int attachmentno);
}
