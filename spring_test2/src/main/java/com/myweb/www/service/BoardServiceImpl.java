package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class BoardServiceImpl implements BoardService{

	private final BoardDAO bdao;
	private final FileDAO fdao;
	@Transactional
	@Override
	public int insert(BoardDTO bdto) {
		log.info("insert service in");
		int isOk =bdao.insert(bdto.getBvo());
		if(isOk > 0 && bdto.getFlist().size()>0) {
			long bno = bdao.selectOneBno();
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isOk *=fdao.insertFile(fvo);
			}
		}
		return isOk;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		log.info("getList service in");
		return bdao.getList(pgvo);
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

	

	@Override
	public int getTotalCount(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getTotalCount(pgvo);
	}



}