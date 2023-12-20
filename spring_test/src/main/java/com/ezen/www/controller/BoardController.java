package com.ezen.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.www.Handler.PagingHandler;
import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;
import com.ezen.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	//inject impl만들어서 연결하지 않아도 됨 inject가 해줌 (근데 impl class 만들어서 implements BoardService 연결해야함)
	@Inject
	private BoardService bsv;
	
	//경로와 리턴의 값이 같을 경우 생략 가능 (값이 옴)/board/register => /board/register
	//각각의 mapping처리
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
		public String register(BoardVO bvo) {
		/*public String register(@RequestParam("name")String name BoardVO bvo) :파라미터 받을 때 */
		
		log.info(">>> bvo >> {}",bvo);
		int isOk = bsv.register(bvo);
		//목적지 경로 
		return "redirect:/board/list"; //리턴타입 지정하지 않으면 service에서 void
		/*
		 * 구체적으로는 웹 브라우저가 웹 서버에 어떤 URL을 요청했을 때, 서버가 리다이렉트를 지시하는 특정 HTTP 응답[1]을 통해 
		 * 웹 브라우저로 하여금 지정된 다른 URL로 재요청하라고 지시하는 것을 말한다
		 */
	}
	
	// 오는곳 /board/list => /board/list 가는곳
	// 리턴타입 void여도 상관없음
	@GetMapping("/list") 
	public String list(Model m,PagingVO pgvo) {
		log.info(">>>> pgvo >> {}",pgvo);//pageNo,qty,type,keyword
		
		//리턴타입은 목적지 경로에 대한 타입 destpage가 리턴이라고 생각
		//Model 객체 => setAttribute (jsp..등 으로 보내는)역할을 하는 객체  
		m.addAttribute("list", bsv.getList(pgvo));
		
		//ph 객체 다시 생성 (pgvo, totalCount 생성해야함)
		int totalCount = bsv.getTotalCount(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount);
		m.addAttribute("ph",ph);
		return "/board/list"; //views-board-list.jsp
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(Model m,@RequestParam("bno") int bno) {
		log.info(">>>>> bno >>"+bno);
		m.addAttribute("bvo",bsv.getDetail(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo) {
		log.info(">>>>> bvo >>",bvo);
		//update
		bsv.update(bvo);
		return "redirect:/board/detail?bno="+bvo.getBno();
		
	}
	/* 모델 m가져와서 addAttribute 하는 버전
	 * public String modify(BoardVO bvo,Model m) 
	 * { log.info(">>>>> bvo >>",bvo); //update
	 * bsv.update(bvo); 
	 * m.addAttribute("bno",bvo.getBno());
	 * return "redirect:/board/detail?bno="+bvo.getBno();
	 * }
	 */	
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") int bno,RedirectAttributes re) {
		log.info(">>>>> bno >>",bno);
		int isOk = bsv.remove(bno);
		//isOk 현재의 상태 알려줌 - 페이지가 새로고침 될때 남아있을 필요가 없는 데이터
		//리다이렉트될 때 데이터를 한번만 보내는 객체 (RedirectAttribute)
		//Model객체는 저장되고 컨트롤러의 list로 감 
		//RedirectAttribute의 addFlashAttribute는 일회성으로 데이터(isOk)를 (list.jsp로) 보낼때 사용
		re.addFlashAttribute("isDel",isOk);
		return "redirect:/board/list";
	}
	

}
