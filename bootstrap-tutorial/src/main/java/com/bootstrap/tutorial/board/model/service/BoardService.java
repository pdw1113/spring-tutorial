package com.bootstrap.tutorial.board.model.service;

import java.util.ArrayList;

import com.bootstrap.tutorial.board.model.vo.Board;
import com.bootstrap.tutorial.board.model.vo.PageInfo;

public interface BoardService {

	int InsertBoard(Board board);

	ArrayList<Board> getBoardList(PageInfo paging);

	int getListCount();

	Board selectBoard(int bNo);

	int countUp(int bNo);

	int deleteBoard(int bNo);

}
