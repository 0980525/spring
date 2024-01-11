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
		if(bdto.getFlist()==null) {
			return isOk;
		}
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
		bdao.updateFileCount();
		bdao.updateCmtCount();
		return bdao.getList(pgvo);
	}

	@Transactional
	@Override
	public BoardDTO getDetail(int bno) {
		bdao.updateReadcnt(bno);
		BoardVO bvo = bdao.getDetail(bno);
		List<FileVO>flist =fdao.getFileList(bno);
		BoardDTO bdto = new BoardDTO(bvo,flist);
		
		return bdto;
	}

	@Transactional
	@Override
	public int update(BoardDTO bdto) {
		int isOk = bdao.update(bdto.getBvo());
		if(bdto.getFlist()==null) {
			return isOk;
		}
		if(isOk > 0 && bdto.getFlist().size()>0) {
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bdto.getBvo().getBno());
				isOk *=fdao.insertFile(fvo);
			}
		}
		return isOk;
		
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

	@Override
	public int fileRemove(String uuid) {
		// TODO Auto-generated method stub
		return fdao.deleteFile(uuid);
	}

	



}