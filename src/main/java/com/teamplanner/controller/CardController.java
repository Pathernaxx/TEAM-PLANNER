package com.teamplanner.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.teamplanner.view.DownloadView;
import com.teamplanner.commons.Util;
import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.CheckList;
import com.teamplanner.dto.Member;
import com.teamplanner.service.ActivityService;
import com.teamplanner.dto.Comment;
import com.teamplanner.service.BoardService;
import com.teamplanner.service.CardService;
import com.teamplanner.service.MemberService;
import com.teamplanner.view.DownloadView;

@Controller
@RequestMapping(value="card")
public class CardController {

	private CardService cardService;
	private BoardService boardService;
	private ActivityService activityService;
	private MemberService memberService;
	
	@Autowired
	@Qualifier("memberService")
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	@Qualifier("cardService")
	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}
	
	@Autowired
	@Qualifier("boardService")
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@Autowired
	@Qualifier("activityService")
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	
	@RequestMapping(value="cardview.action", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView CardView(String listname, String cardname, 
									@RequestParam("cardno") int cardno,
									@RequestParam("listno") int listno,
									@RequestParam("boardno") int boardno) {
									//String cardinfo) {
		
		String cardinfo = boardService.selectCardInfo(boardno, listno, cardno);
		
		List<Attachment> attachments = cardService.selectAttachmentList(cardno, boardno);
		List<CheckList> checklists = cardService.selectCheckList(cardno);
		ArrayList<String> uploadDate = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		for(int i=0;i<attachments.size();i++) {
			int pos = attachments.get(i).getUserFileName().lastIndexOf(".");
			String ext = attachments.get(i).getUserFileName().substring(pos+1);
			String filename = attachments.get(i).getUserFileName().substring(0, pos);
			attachments.get(i).setFileType(ext);
			attachments.get(i).setFileName(filename);
			
			uploadDate = new ArrayList<>();
			uploadDate.add(sdf.format(attachments.get(i).getRegDate()));
			
		}
		
		List<Member> cardMembers = cardService.cardMembers(cardno);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("uploadDate", uploadDate);
		mav.addObject("listname", listname);
		mav.addObject("listno", listno);
		mav.addObject("cardname", cardname);
		mav.addObject("cardno", cardno);
		mav.addObject("boardno", boardno);
		mav.addObject("cardinfo", cardinfo);
		mav.addObject("attachments", attachments);
		mav.addObject("checklists", checklists);
		mav.addObject("cardMembers", cardMembers);
		
		mav.setViewName("card/cardview");
		
		return mav;
	}
	
	@RequestMapping(value="insertchecklist.action", method=RequestMethod.POST)
	@ResponseBody
	public int insertchecklist(String name, int cardno, HttpSession session) {
		Member member = (Member)session.getAttribute("loginuser");
		
		int cardlistno = cardService.insertCheckList(name, cardno);
		
		CheckList checklist = new CheckList();
		checklist.setCardNo(cardno);
		checklist.setName(name);
		checklist.setNo(cardlistno);
		
		activityService.addActivity(member, checklist, cardno);
		return cardlistno;
	}
	
	@RequestMapping(value="insertcheckitem.action", method=RequestMethod.POST)
	@ResponseBody
	public int insertcheckitem(String name, int checklistno) {
		
		int no = cardService.insertCheckItem(name, checklistno);
		
		return no;
	}
	
	@RequestMapping(value="updatechecklistname.action", method=RequestMethod.POST)
	@ResponseBody
	public String updateCheckListName(String name, int checklistno) {
		
		cardService.updateCheckListName(name, checklistno);
		
		return "success";
	}
	
	@RequestMapping(value="updatecheckitemname.action", method=RequestMethod.POST)
	@ResponseBody
	public String updateCheckItemName(String name, int checkitemno) {
		
		cardService.updateCheckItemName(name, checkitemno);
		
		return "success";
	}
	
	@RequestMapping(value="updatecheckitembycheck.action", method=RequestMethod.POST)
	@ResponseBody
	public String updateCheckItemBoolean(boolean checked, int checkitemno) {
		
		cardService.updateCheckItem(checked, checkitemno);
		
		return "success";
	}
	
	@RequestMapping(value="deletechecklist.action", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCheckList(int checklistno) {
		
		cardService.deleteCheckList(checklistno);
		
		//activityService.removeActivity(member, checklist, card, board);
		return "success";
	}
	
	@RequestMapping(value="deletecheckitem.action", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCheckItem(int checkitemno) {
		
		cardService.deleteCheckItem(checkitemno);
		return "success";
	}
	
	/*@RequestMapping(value="insertAttachmentForm.action", method=RequestMethod.GET)
	public ModelAndView insertAttachmentFrom(@RequestParam("cardno") int cardno, @RequestParam("boardno") int boardno) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cardno", cardno);
		mav.addObject("boardno", boardno);
		mav.setViewName("card/upload");
		
		return mav;
	}*/
	
	@RequestMapping(value="insertAttachment.action", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertAttachment(@RequestParam("cardno") int cardno, 
									@RequestParam("boardno") int boardno,
									@RequestParam("file") MultipartFile uploadfile,
									MultipartHttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		
		ServletContext application = req.getSession().getServletContext();
		
		if(uploadfile != null) {
			String filename = uploadfile.getOriginalFilename();
			
			if (filename.contains("\\")) {//IE일 경우 전체 경로에서 파일이름만 추출
				//C:\ABC\DEF\xyz.txt -> xyz.txt
				filename = filename.substring(filename.lastIndexOf("\\") + 1);
			}
			
			Attachment attachment = new Attachment();
			attachment.setBoardNo(boardno);
			attachment.setCardNo(cardno);
			attachment.setUserFileName(filename);
			
			int originNo = cardService.insertAttachment(attachment);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			String date = sdf.format(new Date());
			
			int pos = attachment.getUserFileName().lastIndexOf(".");
			String ext = attachment.getUserFileName().substring(pos+1);
			String filename2 = attachment.getUserFileName().substring(0, pos);
			
			mav.addObject("date", date);
			mav.addObject("no", originNo);
			mav.addObject("type", ext);
			mav.addObject("name", filename2);
			
			String path = application.getRealPath("/resources/uploadfiles/");
//			String savedName = Util.getUniqueFileName(path, originNo+filename);
//			String savedName = Util.getUniqueFileName(path, filename);
			String savedName = originNo+filename;
			
			try {
				FileOutputStream ostream = 
					new FileOutputStream(new File(path, savedName));
				InputStream istream = uploadfile.getInputStream();
				while (true) {
					int data = istream.read();
					if (data == -1) break;
					ostream.write(data);
				}
				istream.close();
				ostream.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		mav.setViewName("card/att1");
		return mav;
		//return message;
	}
	
	@RequestMapping(value="writecardinfo.action", method=RequestMethod.POST)
	@ResponseBody
	public String writeCardInfo(//HttpServletRequest request, HttpSession session,
								@RequestParam("boardno") int boardno, 
								@RequestParam("listno") int listno, 
								@RequestParam("cardno") int cardno,
								String information
							  ){
		String message="";
		
		ModelAndView mav = new ModelAndView();
		
		Card card = new Card();
		card.setBoardNo(boardno);
		card.setListNo(listno);
		card.setNo(cardno);
		card.setInfo(information);
		
		try{
			cardService.writeCardInfo(card);
			message = "success";
		} catch (Exception ex) {
			message = "error";
		}
		return message;
	}
	
	@RequestMapping(value="filedownload.action", method=RequestMethod.GET)
	public ModelAndView fileDownload(@RequestParam("fileno") int fileno,
								HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Attachment attachment = cardService.selectAttachment(fileno);
		
		ModelAndView mav = new ModelAndView();
		if (attachment != null) {
			mav.setView(new DownloadView());
			mav.addObject("attachment", attachment);
			mav.addObject("fileno", fileno);
		}
		
		return mav;
	}
	
	@RequestMapping(value="deleteAttachment.action", method=RequestMethod.GET)
	@ResponseBody
	public String deleteAttachment(@RequestParam("fileno") int attachmentno) {
		
		String message = "";
		
		try {
			cardService.deleteAttachment(attachmentno);
			message = "success";
		} catch (Exception e) {
			message = "error";
		} 
		return message;
		
	}
	
	@RequestMapping(value="insertComment.action", method=RequestMethod.POST)
	@ResponseBody
	public void insertComment(@RequestParam("cardno") int cardno, String content, HttpSession session) {
		
		String writer = ((Member)session.getAttribute("loginuser")).getFullName();
		Member member = (Member)session.getAttribute("loginuser");
		
		Comment comment = new Comment();
		comment.setCardNo(cardno);
		comment.setContent(content);
		comment.setWriter(writer);
		
		String message = "";
		
		int commentno = cardService.insertComment(comment);
		
		comment.setNo(commentno);
		
		activityService.commentActivity(member, cardno, comment);
	}
	
	@RequestMapping(value="archiveCard.action", method=RequestMethod.GET)
	@ResponseBody
	public void archiveCard(@RequestParam("cardno") int cardno) {
		cardService.archiveCard(cardno);
	}
	
	@RequestMapping(value="returnCard.action", method=RequestMethod.GET)
	@ResponseBody
	public void returnCard(@RequestParam("cardno") int cardno) {
		cardService.returnCard(cardno);
	}
	
	/*@RequestMapping(value="archivedCardList.action", method=RequestMethod.GET)
	@ResponseBody
	public List<Card> archivedCardList(@RequestParam("boardno") int boardno){
		
		return archivedCards;
	}*/
	
	//동윤's Area///////////////////////////////////////////////////////////

	
	@RequestMapping(value="searchCardTagMember.action", method=RequestMethod.GET)
	@ResponseBody
	public List<Member> searchCardTagMember(HttpSession session, String text, int boardNo , int cardNo) {
		int memberNo = ((Member)session.getAttribute("loginuser")).getNo();
		List<Member> members =cardService.searchCardTagMember(text, memberNo, boardNo, cardNo);
		
		
		return members;
	}
	
	@RequestMapping(value="selectCardMemberInCard.action", method=RequestMethod.GET)
	@ResponseBody
	public Member selectCardMemberInCard(int tagNo, int cardNo , int boardNo){
		int teamlistNo = cardService.selectTeamListNo(tagNo, boardNo);
		cardService.setTagMemberInCard(teamlistNo, cardNo);
		Member member =boardService.selectMemberByMemberNo(tagNo);
		
		return member;
	}
	
}
















