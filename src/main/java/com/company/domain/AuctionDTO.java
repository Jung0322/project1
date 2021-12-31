package com.company.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AuctionDTO {
	private int ano;			//	ano number(10) not null,
	private String category;	//	category varchar2(30) not null,
	private String title;
	//@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd kk:mm")
	private String startdate;		//	startdate DATE not null,  2021-12-30T19:30
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private String enddate;		//	enddate DATE not null,
	private int startprice;		//	startprice number(10) not null,
	private int soldout;		//	soldout number(2) default 0,
	private String content;
	
	private String userid;//	userid varchar2(50) not null,
	
	//첨부파일 정보 받기
	private List<AttachAuctionDTO> attachList;
}
