package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.repository.BoardDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class BoardServiceImpl implements BoardService{

	private final BoardDAO bdao;

	@Override
	public int insert(BoardVO bvo) {
		log.info("insert service in");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getList() {
		log.info("getList service in");
		return bdao.getList();
	}

	@Override
	public BoardVO getDetail(int bno) {
		bdao.updateReadcnt(bno);
		return bdao.getDetail(bno);
	}

	@Override
	public void update(BoardVO bvo) {
		bdao.update(bvo);
		
	}

	@Override
	public void remove(BoardVO bvo) {
		bdao.delete(bvo);
		log.info("remove 2");
		
	}



}