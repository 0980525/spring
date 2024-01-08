package com.myweb.www.handler;

import com.myweb.www.domain.PagingVO;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class PagingHandler {

	//하단 페이지네이션의 시작번호 1,11,21,...
	private int startPage;
	//하단 페이지네이션의 끝 번호 10,20,30,...
	private int endPage;
	private boolean prev,next;
	
	//총 게시글 수 ( 매개변수로 전달 )
	private int totalCount;
	
	//매개변수로 전달 
	private PagingVO pgvo;
	
	//생성자에서 모든 값들이 설정되어야 함
	public PagingHandler(PagingVO pgvo,int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		// 1- 10,11- 20,21- 30...
		//1부터 10까지 어떤페이지가 선택되더라도 endpage는 10이어야함
		//1,2,3,4..10 /10나머지를 올려 1로 만듦
		this.endPage = (int)Math.ceil(pgvo.getPageNo() /(double) pgvo.getQty())*pgvo.getQty();
		this.startPage = endPage - 9;
		
		//실제 마지막 페이지 ( 전체 글수 / 한페이지에 표시되는 게시글 수 )=>올림
		int realEndPage = (int)Math.ceil(totalCount / (double)pgvo.getQty());
		
		if(realEndPage < endPage) {
			this.endPage = realEndPage;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
	}
	
	
	
	
	
	
	
}
