package com.teamplanner.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.Member;
import com.teamplanner.dto.TagMember;
import com.teamplanner.mapper.CardMapper;

@Repository(value="cardRepository")
public class OracleCardRepository implements CardRepository {
	
	private CardMapper cardMapper;
	@Autowired
	@Qualifier("cardMapper")
	public void setMainMapper(CardMapper cardMapper){
		this.cardMapper = cardMapper;
	}

	@Override
	public List<Comment> selectComment(int cardNo) {
		return cardMapper.selectComment(cardNo);
	}

	@Override
	public List<CheckList> selectCheckList(int cardNo) {
		return cardMapper.selectCheckList(cardNo);
	}

	@Override
	public List<TagMember> selectTagMember(int cardNo) {
		return cardMapper.selectTagMember(cardNo);
	}

	@Override
	public int insertAttachment(Attachment attachment) {
		cardMapper.insertAttachment(attachment);
		
		return attachment.getNo();
	}

	@Override
	public void writeCardInfo(Card card) {
		cardMapper.writeCardInfo(card);
	}

	@Override
	public List<Attachment> selectAttachmentList(int cardno, int boardno) {
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("cardno", cardno);
		params.put("boardno", boardno);
		
		return cardMapper.selectAttachmentList(params);
	}

	@Override
	public Attachment selectAttachment(int attachmentno) {
		return cardMapper.selectAttachment(attachmentno);
	}

	@Override
	public void deleteAttachment(int attachmentno) {
		cardMapper.deleteAttachment(attachmentno);
	}

	@Override
	public int insertCheckList(CheckList checklist) {
		cardMapper.insertCheckList(checklist);
		
		return checklist.getNo();
	}

	@Override
	public int insertCheckItem(CheckItem checkitem) {
		
		cardMapper.insertCheckItem(checkitem);
		
		return checkitem.getNo();
	}

	@Override
	public void deleteCheckList(int checklistno) {
		
		cardMapper.deleteCheckList(checklistno);
		
	}

	@Override
	public void deleteCheckItem(int checkitemno) {
		
		cardMapper.deleteCheckItem(checkitemno);
		
	}

	@Override
	public void deleteCheckItemByChecklist(int checklistno) {
		
		cardMapper.deleteCheckItemByChecklist(checklistno);
		
	}

	@Override
	public void updateCheckListName(String name, int checklistno) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("name", name);
		params.put("checklistno", checklistno);
		
		cardMapper.updateCheckListName(params);
		
	}

	@Override
	public void updateCheckItem(boolean checked, int checkitemno) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("checked", checked);
		params.put("checkitemno", checkitemno);
		
		cardMapper.updateCheckItem(params);
		
	}

	@Override
	public void updateCheckItemName(String name, int checkitemno) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("name", name);
		params.put("checkitemno", checkitemno);
		
		cardMapper.updateCheckItemName(params);
	}

	@Override
	public int selectCheckItemCount(int checklistno) {
		int count = cardMapper.selectCheckItemCount(checklistno);
		return count;
	}

	@Override
	public int insertComment(Comment comment) {
		cardMapper.insertComment(comment);
		return comment.getNo();
	}

	@Override
	public int selectCheckListPercent(int checklistno) {
		
		return cardMapper.selectCheckListPercent(checklistno);
	}

	@Override
	public void archiveCard(int cardno) {
		cardMapper.archiveCard(cardno);
	}

	@Override
	public void returnCard(int cardno) {
		cardMapper.returnCard(cardno);
	}
	
	@Override
	public List<Member> searchCardTagMember(String text, int memberNo, int boardNo, int cardNo) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("text", text);
		params.put("memberNo", memberNo);
		params.put("boardNo", boardNo);
		params.put("cardNo", cardNo);
		
		return cardMapper.searchCardTagMember(params);
	}
	
	
	@Override
	public void setTagMemberInCard(int teamlistNo, int cardNo) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("teamlistNo", teamlistNo);
		params.put("cardNo", cardNo);
		cardMapper.setTagMemberInCard(params);
		
	}
	
	@Override
	public List<Member> selectCardMemberInCard(int cardNo) {
		
		return cardMapper.selectCardMemberInCard(cardNo);
	}
	
	@Override
	public int selectTeamListNo(int tagNo, int boardNo) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("tagNo", tagNo);
		params.put("boardNo", boardNo);
		return cardMapper.selectTeamListNo(params);
	}
	@Override
	public List<Card> archivedCardList(int boardno) {
		return cardMapper.archivedCardList(boardno);
	}

	@Override
	public String isArchivedCard(int cardno) {
		return cardMapper.isArchivedCard(cardno);
	}

}
