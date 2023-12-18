package com.ezen.www.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.www.domain.MemberVO;
import com.ezen.www.repository.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService{
	@Inject
	private MemberDAO mdao;
	
	//암호화를 위한 객체
	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public int signUp(MemberVO mvo) {
		log.info(">>>>signUp serviceImpl>>");
		//아이디가 중복되면 회원가입 실패
		//=>아이디만 주고 db에서 일치하는 mvo객체를 리턴
		//일치하는 유저가 있다면 가입 실패, 없다면 가입 가능
		
		MemberVO tempMvo = mdao.getUser(mvo.getId());
		
		if(tempMvo != null) {
			//기존 아이디가 있는 경우
			return 0;
		}
		//아이디가 중복되지 않는 다면 회원가입을 진행
		//pw가 null/값이 없으면 가입 불가(창띄우기)
		if(mvo.getId() == null || mvo.getId().length() == 0 ) {
			return 0;
		}
		if(mvo.getPw() == null || mvo.getPw().length() == 0) {
			return 0;
		}
		//회원가입 진행
		//pw 암호화하여 가입
		//암호화(encode) / matches(입력된 비번, 암호화된 비번)=> true/false
		String pw = mvo.getPw();
		String encodePw = passwordEncoder.encode(pw); //패스워드 암호화
		
		mvo.setPw(encodePw); //mvo.pw에 세팅
		
		//회원가입
		int isOk = mdao.insert(mvo);
		
		return isOk;
	}

	@Override
	public MemberVO isUser(MemberVO mvo) {
		log.info(">>>>login serviceImpl>>");
		//로그인 유저 확인
		//아이디를 주고 해당 아이디의 객체를 리턴
		MemberVO tempMvo = mdao.getUser(mvo.getId());//회원가입할 때 했던 메서드 호출
		
		//해당 아이디가 없는 경우
		if(tempMvo == null) {
			return null;
		}
		
		//matches ( 원래비번 , 암호화된 비번 )비교
		if(passwordEncoder.matches(mvo.getPw(), tempMvo.getPw())) {
			return tempMvo;
		}
		
		return null;
	}

	@Override
	public void lastLogin(String id) {
		mdao.lastLogin(id);
		
	}

	@Override
	public void modify(MemberVO mvo) {
		mdao.update(mvo);
		
	}

//	@Override
//	public void update(MemberVO mvo) {
//		MemberVO tempMvo = mdao.getUser(mvo.getId());
//		String pw = mvo.getPw();
//		String encodePw = passwordEncoder.encode(pw);
//		
//		if(passwordEncoder.matches(mvo.getPw(), tempMvo.getPw())) {
//		mvo.setPw(tempMvo.getPw());
//		}
//	}
}
