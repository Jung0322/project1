package com.company.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BoardDTO {
	
	private int mno; // 글번호
	private String mcategory; // 카테고리
	private String title; // 글제목
	private String content; //글내용
	private Date regdate; // 작성날짜
	private Date updatedate; // 수정날짜
	private int mcount; // 조회수
	private int curious; // 궁금해요/공감해요 갯수
	
	private String userid;

}
