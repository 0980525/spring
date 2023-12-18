package com.ezen.www.repository;

import java.util.List;

import com.ezen.www.domain.BoardVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> selectList();

	Object getDetail(int bno);

	void readCntUpdate(int bno);

	void update(BoardVO bvo);

	int delete(int bno);

	

}
