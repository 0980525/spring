package com.ezen.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO bdao;

	@Override
	public int register(BoardVO bvo) {
		log.info("register service impl");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getList() {
		log.info("list service impl");
		return bdao.selectList();
	}

	@Override
	public Object getDetail(int bno) {
		log.info("detail service impl");
		bdao.readCntUpdate(bno);
		return bdao.getDetail(bno);
	}

	
	
}
