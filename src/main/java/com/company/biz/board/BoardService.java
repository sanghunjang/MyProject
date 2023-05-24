package com.company.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService implements BoardMapper{
	
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<Board> getBoardList(Board vo) {
		return boardDAO.getBoardList(vo);
	}

	@Override
	public Board getBoard(Board vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public void insertBoard(Board vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(Board vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(Board vo) {
		boardDAO.deleteBoard(vo);
	}

	public int getTotalCount(Board vo) {
		return boardDAO.getTotalCount(vo);
	}

	@Override
	public void updateBoardCnt(Board vo) {
		boardDAO.updateBoardCnt(vo);
	}

}
