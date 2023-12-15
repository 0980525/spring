package com.ezen.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.www.domain.BoardVO;
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
	public String list(Model m) {
		//리턴타입은 목적지 경로에 대한 타입 destpage가 리턴이라고 생각
		//Model 객체 => setAttribute (jsp..등 으로 보내는)역할을 하는 객체  
		m.addAttribute("list", bsv.getList());
		return "/board/list"; //views-board-list.jsp
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(Model m,@RequestParam("bno")int bno) {
		log.info(">>>>> bno >>",bno);
		m.addAttribute("bvo",bsv.getDetail(bno));
	}
	@PostMapping("/modify")
	public String modify(BoardVO bvo) {
		log.info(">>>>> bvo >>",bvo);
		//update
		
		return "redirect:/board/detail";
		
	}
	

}
