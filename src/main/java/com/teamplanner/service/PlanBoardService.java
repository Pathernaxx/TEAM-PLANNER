package com.teamplanner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.Member;
import com.teamplanner.repository.ActivityRepository;
import com.teamplanner.repository.BoardRepository;
import com.teamplanner.repository.MemberRepository;

@Service(value="boardService")
public class PlanBoardService implements BoardService{
	
	private BoardRepository boardRepository;
	private MemberRepository memberRepository;
	
	
	@Autowired
	@Qualifier("boardRepository")
	public void setBoardRepository(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}
	
	@Autowired
	@Qualifier("memberRepository")
	public void setMemberRepository(MemberRepository memberRepository) {
		this.memberRepository=memberRepository;
	}
	
	@Override
	public BoardList selectBoardListBylistNo(int listno) {
		
		return boardRepository.selectBoardListBylistNo(listno);
	}

	@Override
	public void insertBoard(String boardName) {
		boardRepository.insertBoard(boardName);
	}
	@Override
	public int getBoardNo(String boardName) {
		int boardNo = boardRepository.getBoardNo(boardName);
		return boardNo;
	}
	@Override
	public void insertTeamList(int boardNo, int memberNo) {
		boardRepository.insertTeamList(boardNo, memberNo);
	}
	@Override
	public List<Board> selectBoardbyTeamList(int memberNo) {
		List<Board> boards = boardRepository.selectBoardbyTeamList(memberNo);
		return boards;
	}
	@Override
	public boolean checkBoardName(String title) {
		boolean check = boardRepository.checkBoardName(title);
		
		return check;
	}
	@Override
	public List<Board> selectClosedBoard(int memberNo) {
		List<Board> boards = boardRepository.selectClosedBoard(memberNo);
		return boards;
	}
	
	


	@Override
	public List<BoardList> BoardView(int boardNo) {
		
		List<BoardList> boardLists = boardRepository.selectBoardByList(boardNo).getBoardlists();
		return boardLists;
	}
	@Override
	public List<Card> selectCard(int listNo) {
		
		List<Card> cards = boardRepository.selectCard(listNo);
		return cards;
	}
	@Override
	public void insertBoardList(BoardList boardlist) {

		boardRepository.insertBoardList(boardlist);
	}
	@Override
	public String getBoardNameByNo(int boardno) {
		String boardName = boardRepository.getBoardNameByNo(boardno);
		return boardName;
	}
	@Override
	public int insertCard(Card card) {
		int cardno = boardRepository.insertCard(card);
		
		return cardno;
	}

	@Override
	public String selectCardInfo(int boardNo, int listNo, int cardNo) {
		return boardRepository.selectCardInfo(boardNo, listNo, cardNo);
	}
	@Override
	public void addFriend(int memberNo, int friendNo) {
		boardRepository.addFriend(memberNo, friendNo);
	}
	@Override
	public void openClosedBoardPage(int boardNo) {
		boardRepository.openClosedBoardPage(boardNo);
		
	}

	@Override
	public String getBoardName(int boardNo) {
		return boardRepository.getBoardName(boardNo);
	}

	@Override
	public String getListName(int boardno, int listno) {
		return boardRepository.getListName(boardno, listno);
	}

	@Override
	public List<Attachment> selectAttachmentListByBoardno(int boardno) {
		return boardRepository.selectAttachmentListByBoardno(boardno);
	}
	
	@Override
	public void addTagMember(int tagMemberNo, int boardNo) {
		boardRepository.addTagMember(tagMemberNo, boardNo);
	}
	
	@Override
	public void addTagFriend(int friendNo, int boardNo) {
		boardRepository.addTagFriend(friendNo, boardNo);
	}
	
	@Override
	public List<Member> selectTeamlistByBoardNo(int boardNo, int memberNo) {
		
		return boardRepository.selectTeamlistByBoardNo(boardNo, memberNo);
	}
	@Override
	public List<Member> selectTagFriend(int boardNo, int memberNo) {
		return boardRepository.selectTagFriend(boardNo, memberNo);
	}
	
	@Override
	public Member selectMemberByMemberNo(int memberNo) {
		
		return memberRepository.selectMemberByMemberNo(memberNo);
	}
	
	@Override
	public int selectUserType(int memberNo, int boardNo) {
		
		return boardRepository.selectUserType(memberNo, boardNo);
	}
	
	@Override
	public void closedBoard(int boardNo) {
		boardRepository.closedBoard(boardNo);
		
	}
	
	@Override
	public void exitBoard(int memberNo, int boardNo) {
		boardRepository.exitBoard(memberNo, boardNo);
		
	}
}
