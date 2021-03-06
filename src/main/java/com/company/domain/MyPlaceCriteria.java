package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyPlaceCriteria {
	private int pageNum; //페이지 번호
	private int amount; //한 페이지 당 보여줄 게시물 수
	
	private String mcategory;
	
	public MyPlaceCriteria() {
		this(1,10,"전체");
	}
	
	public MyPlaceCriteria(int pageNum, int amount, String mcategory) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.mcategory = mcategory;
	}
}
