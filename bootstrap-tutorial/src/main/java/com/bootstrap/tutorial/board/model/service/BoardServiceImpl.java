package com.bootstrap.tutorial.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bootstrap.tutorial.board.model.dao.BoardDao;
import com.bootstrap.tutorial.board.model.vo.Board;
import com.bootstrap.tutorial.board.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao dao;

	/**
	 * 1. 게시글 작성 메소드
	 */
	@Override
	public int InsertBoard(Board board) {
		return dao.InsertBoard(board);
	}

	/**
	 * 2. 게시글 목록 메소드
	 */
	@Override
	public ArrayList<Board> getBoardList(PageInfo paging) {
		return dao.getBoardList(paging);
	}

	/**
	 * 3. 게시글 총 갯수 메소드
	 */
	@Override
	public int getListCount() {
		return dao.getListCount();
	}

	/**
	 * 4. 게시글 상세 뷰 메소드
	 */
	@Override
	public Board selectBoard(int bNo) {
		return dao.selectBoard(bNo);
	}

	/**
	 * 5. 게시글 조회수 증가 메소드
	 */
	@Override
	public int countUp(int bNo) {
		return dao.countUp(bNo);
	}

	/**
	 * 6. 게시글 삭제 메소드
	 */
	@Override
	public int deleteBoard(int bNo) {
		return dao.deleteBoard(bNo);
	}
}
