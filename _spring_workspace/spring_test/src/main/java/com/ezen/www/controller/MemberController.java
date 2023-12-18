package com.ezen.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.www.domain.MemberVO;
import com.ezen.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/*")
@Slf4j
public class MemberController {
	
	@Inject
	private MemberService msv;
	
	@Inject
	private HttpServletRequest request;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(MemberVO mvo) {
		//{} 안에 ,뒤의 값이 들어감 /{}안쓸거면 +로 적기
		log.info(">>>>mvo>> {}",mvo);
		int isOk = msv.signUp(mvo);
		log.info(">>>>signUp ? "+(isOk>0?"Ok":"fail"));
		return "index";
		
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberVO mvo,HttpServletRequest request,Model m) {
		log.info(">>>> mvo >>{}",mvo);
		//아이디가 일치하는지 확인 (mvo 객체가 db에 일치하는지 체크)
		MemberVO loginMvo = msv.isUser(mvo);
		
		if(loginMvo != null) {
			//로그인 성공시 
			HttpSession ses = request.getSession(); //session 에 로그인 객체 저장
			ses.setAttribute("ses", loginMvo); //로그인 유지 시간
			ses.setMaxInactiveInterval(60*10);
		}else {
			//로그인 실패시
			m.addAttribute("msg_login","1");
		}
		return "index";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, Model m) {
		//세션 객체 삭제 => 세션 끊기
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("ses");
		msv.lastLogin(mvo.getId());
		request.getSession().removeAttribute("ses");
		request.getSession().invalidate(); //무효화
		m.addAttribute("msg_logout","1"); //
		return "index";
	}
	
	@GetMapping("/modify")
	public String modify(MemberVO mvo) {
		
		msv.modify(mvo);
		
		
		return "index";
	}
	
}
