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
	public List<CheckItem> selectCheckItem(int checklistNo) {
		return cardMapper.selectCheckItem(checklistNo);
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

}
