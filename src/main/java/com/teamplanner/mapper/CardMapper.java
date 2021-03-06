package com.teamplanner.mapper;

import java.util.HashMap;
import java.util.List;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.Member;
import com.teamplanner.dto.TagMember;

public interface CardMapper {
	
	void insertCheckList(CheckList checklist);
	void insertCheckItem(CheckItem checkitem);
	//int selectCheckListPercent(int no);
	void deleteCheckList(int checklistno);
	void deleteCheckItem(int checkitemno);
	void deleteCheckItemByChecklist(int checklistno);
	void updateCheckListName(HashMap<String, Object> params);
	void updateCheckItem(HashMap<String, Object> params);
	void updateCheckItemName(HashMap<String, Object> params);
	int selectCheckItemCount(int checklistno);
	int selectCheckListPercent(int no);
	
	List<Comment> selectComment(int cardNo);
	//List<Attachment> selectAttachment(HashMap<Object, Object> params);//int cardNo, int boardNo
	List<CheckList> selectCheckList(int cardNo);
	//List<CheckItem> selectCheckItem(int checklistNo);
	List<TagMember> selectTagMember(int cardNo);
	
	void insertAttachment(Attachment attachment);
	void writeCardInfo(Card card);
	List<Attachment> selectAttachmentList(HashMap<Object, Object> params);
	Attachment selectAttachment(int attachmentno);
	void deleteAttachment(int attachmentno);
	void insertComment(Comment comment);
	
	List<Member> searchCardTagMember(HashMap<Object, Object> params);
	void setTagMemberInCard(HashMap<Object, Object> params);
	List<Member> selectCardMemberInCard(int cardNo);
	int selectTeamListNo(HashMap<Object, Object> params);
	
	void archiveCard(int cardno);
	void returnCard(int cardno);


	List<Card> archivedCardList(int boardno);
	List<Member> cardMembers(int cardno);
	String isArchivedCard(int cardno);
}
