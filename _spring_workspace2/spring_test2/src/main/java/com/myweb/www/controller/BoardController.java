package com.myweb.www.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// @RequiredArgsConstructor 선언 후, private final로 객체 등록 => 생성자 주입


@Slf4j
@RequestMapping("/board/*")
@RequiredArgsConstructor
@Controller
public class BoardController {

	private final BoardService bsv;

	@GetMapping("/register")
	public void register() {}

	@PostMapping("/register")
	public String insert(BoardVO bvo) {
		log.info(">>> bvo >>>{}",bvo);
		int isOk = bsv.insert(bvo);
		return "index";
	}
	
	@GetMapping("/list")
	public void list(Model m) {
		List<BoardVO>list = bsv.getList();
		m.addAttribute("list",list);
	}
	@GetMapping({"/detail", "/modify"})
	public void detail(Model m, @RequestParam("bno") int bno) {
		
		m.addAttribute("bvo",bsv.getDetail(bno));
	}
	@PostMapping("/modify")
	public String modify(BoardVO bvo,RedirectAttributes re) {
		log.info(">>> modify >>>{}");
		
		bsv.update(bvo);
		re.addAttribute("bvo",bvo.getBno());
	return "redirect:/board/detail?bno="+bvo.getBno();
	}
	@GetMapping("/remove")
	public String remove(BoardVO bvo) {
		bsv.remove(bvo);
		log.info("remove 1");
		return "redirect:/board/list";
	}
}
