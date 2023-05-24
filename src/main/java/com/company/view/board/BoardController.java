package com.company.view.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.company.biz.board.Board;
import com.company.biz.board.BoardService;

@RestController
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/getBoardList.do")
	public ModelAndView getBoardList(Board vo,ModelAndView mav) {
		System.out.println("getBoardList.do 실행 get");
		// Null값이 들어올 때 기본값으로 대체.. Null Check
	      	if (vo.getSearchCondition() == null)
	         vo.setSearchCondition("TITLE");
	      	if (vo.getSearchKeyword() == null)
	         vo.setSearchKeyword("");
	      	if(vo.getPage()==0)
	         vo.setPage(1);
			mav.addObject("boardList",boardService.getBoardList(vo));
			mav.addObject("totalRows",boardService.getTotalCount(vo));
			mav.setViewName("getBoardList");
		return mav;
	}
	
	@GetMapping("/getBoard.do")
	public ModelAndView getBoard(Board vo,ModelAndView mav) {
		System.out.println("getBoard.do 실행 get");
		mav.addObject("board",boardService.getBoard(vo));
		boardService.updateBoardCnt(vo);
		mav.setViewName("getBoard");
		return mav;
	}
	
	@GetMapping("/deleteBoard.do")
	public ModelAndView deleteBoard(Board vo,ModelAndView mav) {
		System.out.println("deleteBoard.do 실행 ");
		boardService.deleteBoard(vo);
		mav.setViewName("redirect:getBoardList.do");
		return mav;
	}
	
	@PostMapping("/updateBoard.do")
	public ModelAndView updateBoard(Board vo,ModelAndView mav) {
		System.out.println("updateBoard.do 실행 ");
		boardService.updateBoard(vo);
		mav.setViewName("redirect:getBoardList.do");
		return mav;
	}
	
	@PostMapping("/insertBoard.do")
	public ModelAndView insertBoard(Board vo,ModelAndView mav) {
		System.out.println("insertBoard.do 실행 ");
		boardService.insertBoard(vo);
		mav.setViewName("redirect:getBoardList.do");
		return mav;
	}
}
