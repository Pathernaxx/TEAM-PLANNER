package com.teamplanner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.repository.ActivityRepository;
import com.teamplanner.repository.BoardRepository;

@Service(value="boardService")
public class PlanBoardService implements BoardService{
	
	private BoardRepository boardRepository;
	
	@Autowired
	@Qualifier("boardRepository")
	public void setBoardRepository(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
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
	public void insertCard(Card card) {
		boardRepository.insertCard(card);
		
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
}
