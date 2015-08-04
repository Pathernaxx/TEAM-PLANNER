package com.teamplanner.repository;

import java.util.List;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.TagMember;

public interface CardRepository {

	int insertCheckList(CheckList checklist);
	int insertCheckItem(CheckItem checkitem);
	void deleteCheckList(int checklistno);
	void deleteCheckItem(int checkitemno);
	void deleteCheckItemByChecklist(int checklistno);
	void updateCheckListName(String name, int checklistno);
	void updateCheckItem(boolean checked, int checkitemno);
	void updateCheckItemName(String name, int checkitemno);
	int selectCheckItemCount(int checklistno);
	
	List<Comment> selectComment(int cardNo);
	List<CheckList> selectCheckList(int cardNo);
	//List<CheckItem> selectCheckItem(int checklistNo);
	List<TagMember> selectTagMember(int cardNo);
	
	int insertAttachment(Attachment attachment);
	void writeCardInfo(Card card);
	List<Attachment> selectAttachmentList(int cardno, int boardno);
	Attachment selectAttachment(int attachmentno);
	void deleteAttachment(int attachmentno);
	void insertComment(Comment comment);
}
