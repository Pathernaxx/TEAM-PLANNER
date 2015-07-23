package com.teamplanner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
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
	public String selectClosedBoardName(int boardNo, int closed) {
		// TODO Auto-generated method stub
		return null;
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
	
}
