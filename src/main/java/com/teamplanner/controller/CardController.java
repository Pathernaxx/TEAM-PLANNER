package com.teamplanner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamplanner.service.BoardService;
import com.teamplanner.service.CardService;

@Controller
@RequestMapping(value="card")
public class CardController {

private CardService cardService;
	
	@Autowired
	@Qualifier("cardService")
	public void seCardService(CardService cardService) {
		this.cardService = cardService;
	}
	
	@RequestMapping(value="cardview.action", method=RequestMethod.GET)
	public void CardView() {
		
	}
	
}
