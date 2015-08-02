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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.teamplanner.view.DownloadView;
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
		
		List<Attachment> attachments = cardService.selectAttachmentList(cardno, boardno);
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
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("uploadDate", uploadDate);
		mav.addObject("listname", listname);
		mav.addObject("listno", listno);
		mav.addObject("cardname", cardname);
		mav.addObject("cardno", cardno);
		mav.addObject("boardno", boardno);
		mav.addObject("cardinfo", cardinfo);
		mav.addObject("attachments", attachments);
		
		mav.setViewName("card/cardview");
		
		return mav;
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
	public String insertAttachment(@RequestParam("cardno") int cardno, 
									@RequestParam("boardno") int boardno,
									@RequestParam("file") MultipartFile uploadfile,
									MultipartHttpServletRequest req) {
		
		String message="";
		
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
			
			String path = application.getRealPath("/resources/uploadfiles/");
//			String savedName = Util.getUniqueFileName(path, originNo+filename);
			String savedName = Util.getUniqueFileName(path, filename);
			
			
			try {
				FileOutputStream ostream = 
					new FileOutputStream(new File(path, savedName));
				InputStream istream = uploadfile.getInputStream();
				while (true) {
					int data = istream.read();
					if (data == -1) break;
					ostream.write(data);
					message = "success";
				}
				istream.close();
				ostream.close();
			} catch (Exception ex) {
				ex.printStackTrace();
				message = "error";
			}
		}
		return message;
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
	
	@RequestMapping(value="filedownload.action", method=RequestMethod.GET)
	public ModelAndView fileDownload(@RequestParam("fileno") int fileno,
								HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Attachment attachment = cardService.selectAttachment(fileno);
		
		ModelAndView mav = new ModelAndView();
		if (attachment != null) {
			//다운로드 증가 - 여기서는 생략
			mav.setView(new DownloadView());
			mav.addObject("uploadfile", attachment);
		}
		
		return mav;
	}
	
	@RequestMapping(value="deleteAttachment.action", method=RequestMethod.GET)
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
















