package com.ezen.www.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingVO {

	private int pageNo;//현재페이지 넘버
	private int qty; //한 화면에 보여줄 게시글 수 (10)
	
	//검색에 사용될 멤버변수 추가
	private String type; 
	private String keyword;
	
	public PagingVO() {
		this.pageNo = 1;
		this.qty = 10;
	}
	
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	public int getPageStart() {
		//DB상에서 limit의 시작값을 구하는 메서드
		return (this.pageNo - 1) * this.qty;
	}
	
	//여러가지 타입을 같이 검색하기 위해서 타입을 배열로 구분
	//getTypeToArray() get다음 첫글자 = 대문자로 
	public String[] getTypeToArray() {
		return this.type == null? new String[] {}: this.type.split("");
	}
}
