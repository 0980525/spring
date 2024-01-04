package com.myWeb.www.service;

import org.springframework.stereotype.Service;

import com.myWeb.www.repository.BoardDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardServiceImpl implements BoardService{

	private BoardDAO bdao;
}
