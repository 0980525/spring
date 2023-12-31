package com.myWeb.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myWeb.www.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


//RequiredArgsConstructor 선언 후 
//private final 로 객체 등록 => 생성자 주입
@Controller
@RequestMapping("/board/*")
@RequiredArgsConstructor
@Slf4j
public class BoardController {
	
	private final BoardService  bsv;
	
	@GetMapping("/register")
	public void register() {
		
	}
}
