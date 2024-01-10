package com.myweb.www.domain;

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
	
	public BoardDTO(BoardDTO bdto, List<FileVO> flist2) {
		// TODO Auto-generated constructor stub
	}
	private BoardVO bvo;
	private List<FileVO> flist;
}
