package com.company.domain;

import java.sql.Date;

public class AuctionDTO {
	private int ano;			//	ano number(10) not null,
	private String category;	//	category varchar2(30) not null,
	private Date startdate;		//	startdate DATE not null,
	private Date enddate;		//	enddate DATE not null,
	private int startprice;		//	startprice number(10) not null,
	private int soldout;		//	soldout number(2) default 0,

	
	private String userid;//	userid varchar2(50) not null,
}
