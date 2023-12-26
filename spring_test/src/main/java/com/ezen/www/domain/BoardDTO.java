package com.ezen.www.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {

	private BoardVO bvo;
	private List<FileVO> flist;
//	객체명 두번째 글자가 대문자면 인지 못함 flist(O),fList(X)
	
}
