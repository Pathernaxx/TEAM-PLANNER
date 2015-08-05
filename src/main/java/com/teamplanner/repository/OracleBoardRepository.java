package com.teamplanner.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.Member;
import com.teamplanner.mapper.BoardMapper;

@Repository(value="boardRepository")
public class OracleBoardRepository implements BoardRepository{
	
	private BoardMapper boardMapper;
	@Autowired
	@Qualifier("boardMapper")
	public void setBoardMapper(BoardMapper boardMapper){
		this.boardMapper = boardMapper;
	}
	
	@Override
	public BoardList selectBoardListBylistNo(int listno) {
		
		return boardMapper.selectBoardListBylistNo(listno);
	}
	
  ////////////////////동윤////////////////
	@Override
	public void insertBoard(String boardName) {
		boardMapper.insertBoard(boardName);
	}
	public int getBoardNo(String boardName){
		int boardNo = boardMapper.getBoardNo(boardName);
		return boardNo;
	}
	public void insertTeamList(int boardNo, int memberNo){
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("boardNo", boardNo);
		params.put("memberNo", memberNo);
		
		boardMapper.insertTeamList(params);
	}	
	@Override
	public List<Board> selectBoardbyTeamList(int memberNo) {
		List<Board> boards = boardMapper.selectBoardbyTeamList(memberNo);
		return boards;
	}
	@Override
	public boolean checkBoardName(String title) {
		
		String check = boardMapper.checkBoardName(title);
		boolean checkName = false;
		if(check !=null){	
			checkName = true;	//중복될 때
		}else{
			checkName = false;
		}
			
		return checkName;
	}
	@Override
	public List<Board> selectClosedBoard(int memberNo){
		
		List<Board> boards = boardMapper.selectClosedBoard(memberNo);
		
		return boards;
	}
	@Override
	public List<Board> selectBoardbyBoardName(int memberNo , String text){
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("memberNo", memberNo);
		params.put("text", text);
		
		return boardMapper.selectBoardbyBoardName(params);
	}
	@Override
	public void addFriend(int memberNo, int friendNo) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("memberNo", memberNo);
		params.put("friendNo", friendNo);
		
		boardMapper.addFriend(params);
	}
	@Override
	public void openClosedBoardPage(int boardNo) {
		boardMapper.openClosedBoardPage(boardNo);
		
	}
	
	@Override
	public void addTagMember(int tagMemberNo, int boardNo) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("tagMemberNo", tagMemberNo);
		params.put("boardNo", boardNo);
		
		boardMapper.addTagMember(params);
		
	}
	@Override
	public void addTagFriend(int friendNo, int boardNo) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("friendNo", friendNo);
		params.put("boardNo", boardNo);
		
		boardMapper.addTagFriend(params);
	}
	
	@Override
	public List<Member> selectTeamlistByBoardNo(int boardNo, int memberNo) {
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("boardNo", boardNo);
		params.put("memberNo", memberNo);
		
		return boardMapper.selectTeamlistByBoardNo(params);
	}
	
	@Override
	public List<Member> selectTagFriend(int boardNo, int memberNo) {
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("boardNo", boardNo);
		params.put("memberNo", memberNo);
		
		return boardMapper.selectTagFriend(params);
	}
	
	@Override
	public int selectUserType(int memberNo, int boardNo) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("memberNo", memberNo);
		params.put("boardNo", boardNo);
		
		return boardMapper.selectUserType(params);
	}
	
	@Override
	public void closedBoard(int boardNo) {
		boardMapper.closedBoard(boardNo);
	}
	
	@Override
	public void exitBoard(int memberNo, int boardNo) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("memberNo", memberNo);
		params.put("boardNo", boardNo);
		
		boardMapper.exitBoard(params);
		
	}
	
	////////////////////유정////////////////
	@Override
	public Board selectBoardByList(int boardNo) {
		
		return boardMapper.selectBoardByList(boardNo);
	}
	@Override
	public List<Card> selectCard(int listNo) {
	
		return boardMapper.selectCard(listNo);
	}

	@Override
	public int insertCard(Card card) {
		
		boardMapper.insertCard(card);
		
		return card.getNo();
	}

	@Override
	public void insertBoardList(BoardList boardlist) {
		
		boardMapper.insertBoardList(boardlist);
	}

	@Override
	public String getBoardNameByNo(int boardno) {
		
		return boardMapper.getBoardNameByNo(boardno);
	}

	@Override
	public String selectCardInfo(int boardNo, int listNo, int cardNo) {
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("boardno", boardNo);
		params.put("listno", listNo);
		params.put("cardno", cardNo);
		
		return boardMapper.selectCardInfo(params);
	}

	@Override
	public String getBoardName(int boardNo) {
		return boardMapper.getBoardName(boardNo);
	}

	@Override
	public String getListName(int boardno, int listno) {
		
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("boardNo", boardno);
		params.put("listNo", listno);
		
		return boardMapper.getListName(params);
	}

	
	@Override
	public List<Attachment> selectAttachmentListByBoardno(int boardno) {
		return boardMapper.selectAttachmentListByBoardno(boardno);
	}


}
