package com.ezen.www.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.www.service.CommentService;

import lombok.extern.slf4j.Slf4j;

//비동기 controller 

@RestController
@RequestMapping("/comment/*")
@Slf4j
public class CommentController {

	@Inject
	private CommentService csv;
	
}
