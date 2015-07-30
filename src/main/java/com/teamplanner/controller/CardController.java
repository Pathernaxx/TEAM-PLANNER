package com.teamplanner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listname", listname);
		mav.addObject("listno", listno);
		mav.addObject("cardname", cardname);
		mav.addObject("cardno", cardno);
		mav.addObject("boardno", boardno);
		mav.addObject("cardinfo", cardinfo);
		//mav.addObject("cardinfo", cardinfo);
		
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
	
//	@RequestMapping(value="insertAttachment.action", method=RequestMethod.POST)
//	public String insertAttachment(MultipartHttpServletRequest req,
//								@RequestParam("cardno") int cardno, 
//								@RequestParam("boardno") int boardno) {
//		
//		ServletContext application = req.getSession().getServletContext();
//		
//		String path = application.getRealPath("/WEB-INF/uploadfiles/");
//		
//		Attachment attachment = new Attachment();
//		attachment.setCardNo(cardno);
//		attachment.setBoardNo(boardno);
//		
//		MultipartFile file = req.getFile("file");
//		if(file != null && file.getSize() > 0) {
//			String fileName = file.getOriginalFilename();
//			if(fileName.contains("\\")) {
//				fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
//				
//			}
//			
//			attachment.setUserFileName(fileName);
//			
//			cardService.insertAttachment(attachment);
//			
//		}
//		
//		return "redirect:/card/cardview.action";
//	}
	
	@RequestMapping(value="writecardinfo.action", method=RequestMethod.POST)
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
}
















