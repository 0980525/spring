package com.myweb.www.repository;

import java.util.List;


import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	BoardVO getDetail(int bno);

	int update(BoardVO bvo);

	void delete(BoardVO bvo);

	void updateReadcnt(int bno);

	int getTotalCount(PagingVO pgvo);

	long selectOneBno();

	int updateCmtCount();

	int updateFileCount();



	


}
