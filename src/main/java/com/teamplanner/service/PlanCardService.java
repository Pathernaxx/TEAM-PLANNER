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
import com.teamplanner.dto.Member;
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
	public int insertCheckList(String name, int cardNo) {
		CheckList checklist = new CheckList();
		
		checklist.setCardNo(cardNo);
		checklist.setName(name);
		
		int checklistno = cardRepository.insertCheckList(checklist);
		
		return checklistno;
	}


	@Override
	public int insertCheckItem(String name, int checkListNo) {
		
		CheckItem checkitem = new CheckItem();
		
		checkitem.setName(name);
		checkitem.setChecklistno(checkListNo);
		
		int checkitemno = cardRepository.insertCheckItem(checkitem);
		
		return checkitemno;
	}


	@Override
	public void deleteCheckList(int checklistno) {
		
		if( cardRepository.selectCheckItemCount(checklistno) > 0) {
			cardRepository.deleteCheckList(checklistno);
		} else {
			cardRepository.deleteCheckItemByChecklist(checklistno);
			cardRepository.deleteCheckList(checklistno);
		}
		
	}


	@Override
	public void deleteCheckItem(int checkitemno) {

		cardRepository.deleteCheckItem(checkitemno);
		
	}


	@Override
	public void updateCheckListName(String name, int checklistno) {
		
		cardRepository.updateCheckListName(name, checklistno);
		
	}

	@Override
	public void updateCheckItem(boolean checked, int checkitemno) {
		// TODO Auto-generated method stub
		cardRepository.updateCheckItem(checked, checkitemno);
	}


	@Override
	public void updateCheckItemName(String name, int checkitemno) {
		
		cardRepository.updateCheckItemName(name, checkitemno);
		
	}


	@Override
	public int selectCheckItemCount(int checklistno) {

		return cardRepository.selectCheckItemCount(checklistno);
	}


	@Override
	public List<Comment> selectComment(int cardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CheckList> selectCheckList(int cardNo) {
		
		
		return cardRepository.selectCheckList(cardNo);
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

	@Override
	public int insertComment(Comment comment) {
		int commentno = cardRepository.insertComment(comment);
		return commentno;
	}

	@Override
	public void archiveCard(int cardno) {
		cardRepository.archiveCard(cardno);
	}

	@Override
	public void returnCard(int cardno) {
		cardRepository.returnCard(cardno);
	}
	
	
	@Override
	public List<Member> searchCardTagMember(String text, int memberNo, int boardNo, int cardNo) {
		
		return cardRepository.searchCardTagMember(text, memberNo, boardNo ,cardNo);
	}
	
	@Override
	public void setTagMemberInCard(int teamlistNo, int cardNo) {
		cardRepository.setTagMemberInCard(teamlistNo, cardNo);
		
	}
	
	@Override
	public List<Member> selectCardMemberInCard(int cardNo) {
		
		return cardRepository.selectCardMemberInCard(cardNo);
	}
	
	@Override
	public int selectTeamListNo(int tagNo, int boardNo) {
		return cardRepository.selectTeamListNo(tagNo, boardNo);
	}
}
