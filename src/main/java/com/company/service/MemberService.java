package com.company.service;

import com.company.domain.MemberAttachDTO;
import com.company.domain.MemberDTO;

public interface MemberService {
	// 회원가입
	// 회원가입 처리
	public boolean insertMember(MemberDTO insertDto);
	// 중복 아이디 검사
	public MemberDTO checkUserid(String userid);
	// 중복 닉네임 검사(전체)
	public MemberDTO checkNickname(String nickname);
	// 중복 이메일 검사(전체)
	public MemberDTO checkEmail(String email);
	
	
	// 회원정보 수정
	// 회원정보 불러오기
	public MemberDTO readMemberInfo(String userid);
	// 프로필 이미지 정보 불러오기
	public MemberAttachDTO readProfileInfo(String userid);
	// 동일 닉네임 검사
	public String checkSameNickname(String userid);
	// 닉네임 수정
	public boolean modifyNickname(MemberDTO modifyDto);
	// 기존 비밀번호 일치 확인
	public boolean checkOrgPassword(MemberDTO checkDto);
	// 비밀번호 수정
	public boolean modifyPwd(String new_password, MemberDTO modifyDto);
	// 동일 이메일 검사
	public String checkSameEmail(String userid);
	// 이메일 수정
	public boolean modifyEmail(MemberDTO modifyDto);
	// 휴대전화 수정
	public boolean modifyPhone(MemberDTO modifyDto);
	// 내동네 수정
	public boolean modifyMytown(MemberDTO modifyDto);
	// 프로필 이미지 저장
	public boolean insertProfileImg(MemberAttachDTO insertDto);
	// 프로필 이미지 삭제
	public boolean deleteProfileImg(String userid);
	// 프로필 이미지 수정
	public boolean modifyProfileImg(MemberAttachDTO modifyDto);
	
	
	// 회원탈퇴
	public boolean deleteMember(MemberDTO deleteDto);
	
	
	// 아이디, 비밀번호 찾기
	// 전화번호 인증
	public void certifiedPhoneNumber(String phone, int randomNumer);
	// 아이디 찾기
	public String findUserid(String email, String phone);
	// 비밀번호 찾기
	public MemberDTO findPwd(MemberDTO MemberDto);
	// 비밀전호 재설정
	public boolean replacePwd(String userid, String new_password);
}
