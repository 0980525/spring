package com.ezen.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.www.domain.BoardDTO;
import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.FileVO;
import com.ezen.www.domain.PagingVO;
import com.ezen.www.repository.BoardDAO;
import com.ezen.www.repository.CommentDAO;
import com.ezen.www.repository.FileDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO bdao;
	
	@Inject
	private CommentDAO cdao;
	
	@Inject
	private FileDAO fdao;
	
	@Override
	public int register(BoardDTO bdto) {
		log.info("register service impl");
		//기존 보드 내용을 DB에 저장
		int isOk = bdao.insert(bdto.getBvo());
		
		//flist를 DB에 저장 
		if(bdto.getFlist() == null) {
			//파일의 값이 없다면..
			isOk *= 1; //그냥 성공한걸로 처리
		}else {
			//파일에 저장
			if(isOk > 0 && bdto.getFlist().size() > 0) {
				//fvo는 bno 아직 설정되기 전
				//현재 bdto 시점에서 bno가 생성되지 않음
				//insert를 통해서 자동 생성 => DB에서 검색해서 가져오기
				int bno = bdao.selectBno();
				for(FileVO fvo : bdto.getFlist()) {
					fvo.setBno(bno);
					//파일 저장 
					isOk *= fdao.insertFile(fvo);
					log.info(">>> isOk >>>");
				}
			}
		}
		return isOk;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		log.info("list service impl");
		 bdao.updateCommentCount();
		 bdao.updateFileCount();
		
		return bdao.selectList(pgvo);
	}

	@Override
	public BoardDTO getDetail(int bno) {
		log.info("detail service impl");
		bdao.readCntUpdate(bno);
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setBvo(bdao.getDetail(bno)); //게시글 내용채우기
		//bno에 해당하는 모든 파일 리스트
		boardDTO.setFlist(fdao.getFileList(bno));
		
		return boardDTO;
	}

	@Override
	public int update(BoardDTO bdto) {
		log.info("modify service impl");
		int isOk = bdao.update(bdto.getBvo());
		if(bdto.getFlist() == null) {
			isOk *= 1;
		}else {
			if(isOk > 0 && bdto.getFlist().size() > 0) {
				int bno = bdto.getBvo().getBno();
				for(FileVO fvo : bdto.getFlist()) {
					fvo.setBno(bno);
					isOk *= fdao.insertFile(fvo);
				}
			}
		}
		return isOk;
	}

	@Override
	public int remove(int bno) {
		log.info("remove service impl");
		return bdao.delete(bno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getTotalCount(pgvo);
	}

	@Override
	public int removeFile(String uuid) {
		// TODO Auto-generated method stub
		return fdao.removeFile(uuid);
	}


	


	
	
}
