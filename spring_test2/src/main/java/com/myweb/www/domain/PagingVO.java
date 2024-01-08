package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingVO {

	//현재 페이지 번호
	private int pageNo;
	//한 페이지당 표시될 리스트 개수
	private int qty;
	
	private String type;
	private String keyword;
	
	public PagingVO() {
		this.pageNo =1;
		this.qty=10;
	}
	public PagingVO(int pageNo,int qty ) {
		this.pageNo =pageNo;
		this.qty=qty;
	}
	
	public int getPageStart() {
		return(this.pageNo-1)*qty;
	}
	//type 의 값을 배열로 설정
	//복합차입의 키워드일 경우 각자 검색해야하기 때문에 배열로 생성
	public String[] getTypeToArray() {
		return this.type == null?
				new String[] {}:this.type.split("");
	}
}
