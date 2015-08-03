package com.teamplanner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.CheckItem;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Comment;
import com.teamplanner.dto.TagMember;
import com.teamplanner.repository.CardRepository;

@Service(value="cardService")
public class PlanCardService implements CardService {
	
	private CardRepository cardRepository;
	@Autowired
	@Qualifier("cardRepository")
	public void setCardRepository(CardRepository cardRepository){
		this.cardRepository = cardRepository;
	}

	@Override
	public List<Comment> selectComment(int cardNo) {
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

	@Override
	public int insertAttachment(Attachment attachment) {
		int originNo = cardRepository.insertAttachment(attachment);
		return originNo;
	}

	@Override
	public void writeCardInfo(Card card) {
		cardRepository.writeCardInfo(card);
	}

	@Override
	public List<Attachment> selectAttachmentList(int cardno, int boardno) {
		return cardRepository.selectAttachmentList(cardno, boardno);
	}

	@Override
	public Attachment selectAttachment(int attachmentno) {
		return cardRepository.selectAttachment(attachmentno);
	}

	@Override
	public void deleteAttachment(int attachmentno) {
		cardRepository.deleteAttachment(attachmentno);
	}

}
