package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.BoardVO;

public interface BoardService {

	int register(BoardVO bvo);

	List<BoardVO> getList();

	Object getDetail(int bno);

	void update(BoardVO bvo);

	int remove(int bno);





}
