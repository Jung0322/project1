package com.company.mapper;

import com.company.domain.MemberAttachDTO;

public interface MemberAttachMapper {
	// 프로필 이미지 저장
	public int insertProfileImg(MemberAttachDTO insertDto);
	// 프로필 이미지 정보 불러오기
	public MemberAttachDTO showProfileimg(String userid);
	// 프로필 이미지 삭제
	public int deleteProfileImg(String userid);
	// 프로필 이미지 수정
	public int modifyProfileImg(MemberAttachDTO modifyDto);
}