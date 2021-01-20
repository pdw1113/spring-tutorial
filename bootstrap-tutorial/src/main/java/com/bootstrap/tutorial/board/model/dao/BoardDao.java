package com.bootstrap.tutorial.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bootstrap.tutorial.board.model.vo.Board;
import com.bootstrap.tutorial.board.model.vo.PageInfo;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int InsertBoard(Board board) {
							  // "Mapper의 namesapce.id"
		return sqlSession.insert("BoardMapper.insertBoard", board);
	}

	public ArrayList<Board> getBoardList(PageInfo paging) {
		
		// ex) 현재페이지 5, 한 페이지에 보여질 게시글 수 10개
		// 5 - 1 = 4,
		// 4 * 10 = 40
		int offset = (paging.getCurrentPage() - 1) * paging.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, paging.getBoardLimit());
		
		// sqlSession.selectList()의 return값이 List<T>이기 때문에 
		// (ArrayList)로 다운캐스팅 형변환을 해주어야 한다.
		return (ArrayList)sqlSession.selectList("BoardMapper.selectBoardList", null, rowBounds);
	}

	public int getListCount() {
		return sqlSession.selectOne("BoardMapper.selectListCount");
	}

	public Board selectBoard(int bNo) {
		return sqlSession.selectOne("BoardMapper.selectBoard", bNo);
	}

	public int countUp(int bNo) {
		return sqlSession.update("BoardMapper.countUp", bNo);
	}

	public int deleteBoard(int bNo) {
		return sqlSession.delete("BoardMapper.deleteBoard", bNo);
	}
}
