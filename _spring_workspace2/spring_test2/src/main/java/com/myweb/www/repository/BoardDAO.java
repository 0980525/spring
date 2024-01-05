package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getList();

	BoardVO getDetail(int bno);

	void update(BoardVO bvo);

	void delete(BoardVO bvo);

	void updateReadcnt(int bno);


}
