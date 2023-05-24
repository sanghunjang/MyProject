package com.company.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO  {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Board> getBoardList(Board vo) {
		System.out.println("===> Mybatis로 getBoardList()처리");
		return mybatis.selectList("getBoardList",vo);
	}

	public Board getBoard(Board vo) {
		System.out.println("===> Mybatis로 getBoard()처리");
		return mybatis.selectOne("getBoard",vo);
	}

	public void insertBoard(Board vo) {
		System.out.println("===> Mybatis로 insertBaord()처리");
		mybatis.insert("insertBoard", vo);
	}

	public void updateBoard(Board vo) {
		System.out.println("===> Mybatis로 updateBoard()처리");
		mybatis.update("updateBoard", vo);
	}

	public void deleteBoard(Board vo) {
		System.out.println("===> Mybatis로 deleteBoard()처리");
		mybatis.delete("deleteBoard", vo);;
	}
	
	public int getTotalCount(Board vo) {
		System.out.println("===>Mybatis로 getTotalCount()처리");
		return mybatis.selectOne("getTotalCount",vo);
	}

	public void updateBoardCnt(Board vo) {
		System.out.println("===> Mybatis로 deleteBoard()처리");
		mybatis.update("updateBoardCnt", vo);
	}
	
}
