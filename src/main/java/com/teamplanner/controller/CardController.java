package com.teamplanner.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamplanner.commons.Util;
import com.teamplanner.dto.Attachment;
import com.teamplanner.dto.Card;
import com.teamplanner.service.BoardService;
import com.teamplanner.service.CardService;

@Controller
@RequestMapping(value="card")
public class CardController {

private CardService cardService;
private BoardService boardService;
	
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
	
	@RequestMapping(value="cardview.action", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView CardView(String listname, String cardname, 
									@RequestParam("cardno") int cardno,
									@RequestParam("listno") int listno,
									@RequestParam("boardno") int boardno) {
									//String cardinfo) {
		
		String cardinfo = boardService.selectCardInfo(boardno, listno, cardno);
//		Card card = new Card();
//		card.setNo(cardno);
//		card.setBoardNo(boardno);
//		card.setName(cardname);
//		card.setInfo(cardinfo);
//		card.setListNo(listno);
//		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listname", listname);
		mav.addObject("listno", listno);
		mav.addObject("cardname", cardname);
		mav.addObject("cardno", cardno);
		mav.addObject("boardno", boardno);
		mav.addObject("cardinfo", cardinfo);
		
		mav.setViewName("card/cardview");
		
		return mav;
	}
	
	@RequestMapping(value="insertAttachmentForm.action", method=RequestMethod.GET)
	public ModelAndView insertAttachmentFrom(@RequestParam("cardno") int cardno, @RequestParam("boardno") int boardno) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cardno", cardno);
		mav.addObject("boardno", boardno);
		mav.setViewName("card/upload");
		
		return mav;
	}
	
	@RequestMapping(value="insertAttachment.action", method=RequestMethod.POST)
	public void insertAttachment(@RequestParam("cardno") int cardno, 
									@RequestParam("boardno") int boardno,
									@RequestParam("file") MultipartFile uploadfile,
									MultipartHttpServletRequest req) {
		
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
			
			String path = application.getRealPath("/finalProject/resources/uploadfiles/");
			String savedName = Util.getUniqueFileName(path, originNo+filename);
			
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
	}
	
	@RequestMapping(value="writecardinfo.action", method=RequestMethod.POST)
	@ResponseBody
	public String writeCardInfo(//HttpServletRequest request, HttpSession session,
								@RequestParam("boardno") int boardno, 
								@RequestParam("listno") int listno, 
								@RequestParam("cardno") int cardno,
								String information
							  ){// throws ServletException, IOException 
		
		//String information = request.getParameter("information");

		String message="";
		
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
	
	//동윤's Area///////////////////////////////////////////////////////////
	
	@RequestMapping(value="tagMemberForm.action", method=RequestMethod.GET)
	public ModelAndView popupTagMemberForm(@RequestParam("cardno") int cardno, @RequestParam("boardno") int boardno
											,@RequestParam("listno") int listno) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("cardno", cardno);
		mav.addObject("listno", listno);
		mav.addObject("boardno", boardno);
		mav.setViewName("card/tagMemberForm");
		
		return mav;
	}
}
















