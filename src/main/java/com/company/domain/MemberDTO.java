package com.company.domain;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MemberDTO {
	private String userid;   	//	userid varchar2(50) not null,
	private String password; 	//  password varchar2(50) not null,
	private String nickname;	//  nickname varchar2(50) not null,
	private String email;		//  email varchar2(50) not null,
	private String phone;		//  phone varchar2(50) not null,
	private String mytown;		//  mytown varchar2(50) not null,
}
