package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;

public interface BoardService {

	int register(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	Object getDetail(int bno);

	void update(BoardVO bvo);

	int remove(int bno);

	int getTotalCount(PagingVO pgvo);





}
