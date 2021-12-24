package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class ProductDTO {
	private int pno;		//	pno number(10) not null,
	private String category;//	category varchar2(20) not null,
	private String  title;	//	title varchar2(100) not null,
	private int price; 		//	price number(10) not null,
	private String content;	//	content varchar2(2000) not null,
	private	int delivery;	//	delivery number(2) default 0,
	private int discount;	//	discount number(2) default 0 ,
	private int reservation;//	reservation number(2) default 0,
	private int soldout;	//	soldout number(2) default 0,
	
	
	private String userid;	//	userid varchar2(50) not null,
}
