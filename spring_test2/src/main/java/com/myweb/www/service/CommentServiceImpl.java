package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.repository.CommentDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Slf4j
public class CommentServiceImpl implements CommentService{

	private final CommentDAO cdao;

	@Override
	public int post(CommentVO cvo) {
		return cdao.insert(cvo);
	}

	@Transactional
	@Override
	public PagingHandler getList(long bno,PagingVO pgvo) {
		// commentList 로 setting , ph 객체안에 cmtList 구성 , totalCount 구해오기
		//totalCount
		int totalCount = cdao.selectOneBnoTotalCount(bno);
		List<CommentVO>list = cdao.getList(bno,pgvo);
		//paginghandler -ph 
		PagingHandler ph = new PagingHandler(pgvo, totalCount,list);
		return ph;
	}

	@Override
	public int modify(CommentVO cvo) {
		// TODO Auto-generated method stub
		return cdao.update(cvo);
	}

	@Override
	public int remove(long cno) {
		// TODO Auto-generated method stub
		return cdao.delete(cno);
	}

	
}
