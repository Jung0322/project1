package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductCriteria {
	private int pageNum;	//페이지 번호
	private int amount;		//한 페이지당 보여줄 게시물 수
	
	private String type;
	private String cate;
	
	public ProductCriteria() {
		this(1,8,"전체");
	}
	
	public ProductCriteria(int pageNum,int amount,String cate) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.cate = cate;
	}
	
	public String[] getTypeArr() {
		return type==null?new String[] {}:type.split("");
	}
}
