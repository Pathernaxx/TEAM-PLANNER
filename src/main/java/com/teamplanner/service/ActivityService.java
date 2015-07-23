package com.teamplanner.service;

import com.teamplanner.dto.Board;
import com.teamplanner.dto.BoardList;
import com.teamplanner.dto.Card;
import com.teamplanner.dto.Member;

public interface ActivityService {
	void createBoard(Board board, Member member);
	void addActivity(Member member, BoardList list, Board board);
	void addActivity(Member member, Card card, BoardList list, Board board);
}
