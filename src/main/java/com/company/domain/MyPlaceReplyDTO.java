package com.company.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MyPlaceReplyDTO {
	private int mrno;
	private int mno;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int good;
	
	private String userid;
	private String nickname;
	private String mytown;
	
	// 프로필 이미지 정보 받기
	private List<MemberAttachDTO> profileList;
}
