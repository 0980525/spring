package com.ezen.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
//outline 에서 확인 가능해야함
//멤버변수 위에다 쓰면 하나에만 적용 가능 
@Getter
@Setter  
@ToString
@AllArgsConstructor //전체 생성자 all
@NoArgsConstructor //기본 생성자 no
public class BoardVO {

	private int bno;
	private String title;
	private String writer;
	private String content;
	private String isDel;
	private String reg_date;
	private int read_count;

}
