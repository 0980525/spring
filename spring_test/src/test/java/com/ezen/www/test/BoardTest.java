package com.ezen.www.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.www.domain.BoardVO;
import com.ezen.www.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardTest {
//화면 없을때 찍어보는 용도 db,controller잘 작동 하는지 확인
	@Inject
	private BoardDAO bdao;
	
	@Test //꼭 필요
	public void insertBoard() {
		log.info(">>>> Test Insert In >>>>");
		
		for(int i=0;i<300;i++) {
			BoardVO bvo = new BoardVO();
			bvo.setTitle("Test Title"+i);
			bvo.setWriter("Tester");
			bvo.setContent("Test Content "+ i);
			
			bdao.insert(bvo);
		}
	}
}
