package com.teamplanner.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamplanner.dto.ActionPrint;
import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.Member;
import com.teamplanner.service.ActivityService;
import com.teamplanner.service.BoardService;
import com.teamplanner.service.CardService;
import com.teamplanner.service.MemberService;
import com.teamplanner.service.SearchService;

@Controller
@RequestMapping(value="board")
public class BoardController {
	
	
	private BoardService boardService;
	private ActivityService activityService;
	private MemberService memberService;
	private CardService cardService;
	
	@Autowired
	@Qualifier("boardService")
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	private SearchService searchService;	
	@Autowired
	@Qualifier("searchService")
	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	
	@Autowired
	@Qualifier("activityService")
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	
	@Autowired
	@Qualifier("memberService")
	public void setMemberService(MemberService memberService) {
		this.memberService=memberService;
	}
	
	@Autowired
	@Qualifier("cardService")
	public void setCardService(CardService cardService) {
		this.cardService=cardService;
	}



	////////////////////////// 동윤 /////////////////////////////////////////	
	@RequestMapping(value="boardmain.action", method = RequestMethod.GET)
	public ModelAndView boardMain(HttpSession session){
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		List<Board> boards = boardService.selectBoardbyTeamList(memberNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		mav.addObject("boards", boards);
		
		return mav;
	}
	
	@RequestMapping(value="insertboard.action", method = RequestMethod.GET)
	@ResponseBody
	public String insertBoard(String title, HttpSession session){
		
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		boolean check = boardService.checkBoardName(title);
		String message;
		if(check == true){
			message = "check";
		}else{
			if(title ==null || Integer.toString(memberNo) == null){
				message = "fail";
			}else{
				message = "complete";
				boardService.insertBoard(title);
				 
				int boardNo = boardService.getBoardNo(title);
				boardService.insertTeamList(boardNo, memberNo);
				
				Board board = new Board();
				board.setNo(boardNo);
				board.setName(title);
				
				Member member = (Member)session.getAttribute("loginuser");
				activityService.createBoard(board, member);
			}
		}
				
		
		return message;
	}
	
	@RequestMapping(value="closedboardview.action", method = RequestMethod.GET)
	@ResponseBody
	public List<Board> getClosedBoard(HttpSession session){
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		List<Board> boards = boardService.selectClosedBoard(memberNo);
		
		return boards;
	}
	
	@RequestMapping(value="searchmember.action", method = RequestMethod.GET)
	@ResponseBody
	public List<Member> searchMember(HttpSession session, String key){
		List<Member> searchs = null;
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
//		String[] list = null;
		if(key.startsWith("@")){	//member 검색
			String[] a = key.split("@");
			searchs = searchService.searchMember(memberNo, a[1]);		
//			list = new String[searchs.size()];
//			for(int i=0; i<searchs.size();i++){
//				list[i]=searchs.get(i).getUserName();
//			}
			
		}
		
		return searchs;
		
	}
	@RequestMapping(value="searchboard.action", method = RequestMethod.GET)
	@ResponseBody
	public List<Board> searchBoard(HttpSession session, String key){
		List<Board> searchs = null;
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		if(key.startsWith("#")){
			String[] a = key.split("#");
			searchs = searchService.searchBoard(memberNo, a[1]);
		}
		
		return searchs;
		
	}
	@RequestMapping(value="addFriend.action", method = RequestMethod.GET)
	public String addFriend(HttpSession session, int friendNo){
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		boardService.addFriend(memberNo, friendNo);
		
		return "redirect:/board/boardmain.action";
	}
	
	@RequestMapping(value="closedBoardPage.action", method = RequestMethod.GET)
	public ModelAndView closedBoardPage(int boardNo){
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardNo",boardNo);
		mav.setViewName("board/closedboardpage");
		return mav;
	}
	@RequestMapping(value="openClosedBoardPage.action", method = RequestMethod.GET)
	public String openClosedBoardPage(int boardNo){
		boardService.openClosedBoardPage(boardNo);		
		
		return "redirect:/board/boardmain.action";
	}
	
//////////////////////// 유정 /////////////////////////////////////////
	@RequestMapping(value="boardview.action", method = RequestMethod.GET)
	public ModelAndView BoardView(@RequestParam("boardno") int boardNo, HttpSession session){
	
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		List<Member> members = boardService.selectTeamlistByBoardNo(boardNo, memberNo);
		int userType = boardService.selectUserType(memberNo, boardNo);
		
		String boardname = boardService.getBoardName(boardNo);
		List<BoardList> boardLists = boardService.BoardView(boardNo);
		List<Attachment> attachments = boardService.selectAttachmentListByBoardno(boardNo);
		
		String ext="";
		String filename="";
		
		for(int i=0;i<attachments.size();i++) {
			int pos = attachments.get(i).getUserFileName().lastIndexOf(".");
			if(pos != 0) {
				ext = attachments.get(i).getUserFileName().substring(pos+1);
				filename = attachments.get(i).getUserFileName().substring(0, pos);
			} else {
				filename = attachments.get(i).getUserFileName();
			}
			attachments.get(i).setFileType(ext);
			attachments.get(i).setFileName(filename);
		}
		
		List<ActionPrint> prints = activityService.activityListByBoard(boardNo);
		
		List<Card> archivedCards = cardService.archivedCardList(boardNo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		List<String> redate = null;
		
		for(int i=0; i<archivedCards.size(); i++) {
			redate = new ArrayList<>();
			redate.add(sdf.format(archivedCards.get(i).getRegDate()));
		}
		
		//System.out.println(attchments.get(0).getUserFileName());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardLists", boardLists);
		mav.addObject("boardNo", boardNo);
		mav.addObject("boardname", boardname);
		mav.addObject("members", members);
		mav.addObject("userType", userType);
		mav.addObject("attachments", attachments);
		mav.addObject("prints", prints);
		mav.addObject("archivedCards", archivedCards);
		mav.addObject("redate", redate);
		mav.setViewName("board/boardview");
		
		return mav;
		
	}
	
	/*@RequestMapping(value="boardview.action", method = RequestMethod.POST)
	@ResponseBody
	public List<BoardList> BoardView2(@RequestParam("boardno") int boardNo) {
		List<BoardList> boardLists = boardService.BoardView(boardNo);
		
		return boardLists;
	}
	*/
	@RequestMapping(value="insertlist.action", method=RequestMethod.GET)
	@ResponseBody
	public String insertBoardList(String listname, @RequestParam("boardno") int boardno, HttpSession session) {//@RequestParam("boardno") int boardNo
		
//		String listname = name;
//		int boardno = boardNo;
		int position = 1;
		
		String message = "";
		
		Member member = (Member)session.getAttribute("loginuser");
		
		BoardList boardlist = new BoardList();
		boardlist.setBoardNo(boardno);
		boardlist.setName(listname);
		boardlist.setPosition(position);
		
		String boardname = boardService.getBoardNameByNo(boardno);
		
		try {
			boardService.insertBoardList(boardlist);
			activityService.addActivity(member, boardlist, new Board(boardno, boardname));
			message = "complete";
		} catch (Exception e) {
			message = "error";
		}
		
		return message;
	}
	
	@RequestMapping(value="insertcard.action", method=RequestMethod.GET)
	@ResponseBody
	public String insertCard(String cardname, int boardno, int listno, HttpSession session) {
		String boardName = boardService.getBoardNameByNo(boardno);
		Member member = (Member)session.getAttribute("loginuser");
		
		String listname = boardService.getListName(boardno, listno);
		
		Card card = new Card();
		card.setName(cardname);
		card.setListNo(listno);
		card.setBoardNo(boardno);
		card.setBoardName(boardName);
		card.setPosition(1);
		card.setListName(listname);
		
		String message = "";
		
		try {
			BoardList list = boardService.selectBoardListBylistNo(listno);
			int cardno = boardService.insertCard(card);
			activityService.addActivity(member, cardno, list, new Board(boardno, boardName));
			message = "complete";
		} catch (Exception e) {
			message = "error";
		}
		
		return message;
		
	}
	
	/////동윤 tagmember전용//////////////////
	@RequestMapping(value="searchTagMember.action", method=RequestMethod.GET)
	@ResponseBody
	public List<Member> searchTagMember(HttpSession session, String key, int boardno) {
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		List<Member> members = searchService.searchTagAllMember(key, memberNo, boardno);
		if(members.size() <=0 || members== null){
			members = null;
		}
		
		
		return members;
	}
	
	
	@RequestMapping(value="selectTagFriend.action", method=RequestMethod.GET)
	@ResponseBody
	public List<Member> selectTagFriend(HttpSession session, int boardNo) {

		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		
		List<Member> members = searchService.selectTagFriend(boardNo, memberNo);
		if(members.size() <=0 || members== null){
			members = null;
		}
		
		
		return members;
	}
	
	@RequestMapping(value="addTagFriend.action", method=RequestMethod.GET)
	@ResponseBody
	public Member addTagFriend(HttpSession session, int boardNo , int friendNo) {
		
		boardService.addTagFriend(friendNo, boardNo);
		Member member = boardService.selectMemberByMemberNo(friendNo);
		if(member== null){
			member = null;
		}
		
		return member;
	}
	
	@RequestMapping(value="addTagMember.action", method=RequestMethod.GET)
	@ResponseBody
	public Member addTagMember(int tagMemberNo, int boardNo) {

		boardService.addTagMember(tagMemberNo, boardNo);
		Member member = boardService.selectMemberByMemberNo(tagMemberNo);
		if(member== null){
			member = null;
		}
		
		
		return member;
	}
	
	@RequestMapping(value="closedBoard.action", method=RequestMethod.GET)
	public String closedBoard(int boardNo){
		
		boardService.closedBoard(boardNo);
		
		return "redirect:/board/boardmain.action";
	}
	
	@RequestMapping(value="exitBoard.action", method=RequestMethod.GET)
	public String exitBoard(int boardNo , HttpSession session){
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		boardService.exitBoard(memberNo, boardNo);
		
		return "redirect:/board/boardmain.action";
	}
	

}








