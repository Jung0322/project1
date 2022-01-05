package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.MemberDTO;
import com.company.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;

	
	@Override
	@Transactional
	public boolean insertMember(MemberDTO insertDto) {
		// 회원정보 등록 전 비밀번호 암호화
		insertDto.setPassword(passwordEncoder.encode(insertDto.getPassword()));
		
		// 회원가입
		boolean result = memberMapper.insertMember(insertDto) == 1;
		// 회원 권한(ROLE) 삽입
		memberMapper.insertMemberAuth(insertDto.getUserid(), "ROLE_USER");
		
		return result;
	}

	@Override
	// 중복 아이디 검사
	public MemberDTO checkUserid(String userid) {
		return memberMapper.checkByUserid(userid);
	}

	@Override
	// 중복 닉네임 검사(전체)
	public MemberDTO checkNickname(String nickname) {
		return memberMapper.checkByNickname(nickname);
	}

	@Override
	// 중복 이메일 검사(전체)
	public MemberDTO checkEmail(String email) {
		return memberMapper.checkByEmail(email);
	}

	@Override
	// 회원정보 불러오기
	public MemberDTO readMemberInfo(String userid) { 
		return memberMapper.readMemberInfo(userid);
	}

	@Override
	// 동일 닉네임 검사
	public String checkSameNickname(String userid) {
		return memberMapper.checkSameNickname(userid);
	}
	
	@Override
	// 닉네임 수정
	public boolean modifyNickname(MemberDTO modifyDto) {
		return memberMapper.modifyNickname(modifyDto) > 0 ? true : false;
	}

	@Override
	@Transactional
	// 기존 비밀번호 확인
	public boolean checkOrgPassword(MemberDTO checkDto) {
		// memberMapper.checkOrgPwd(checkDto.getUserid()) -> 기존 비밀번호 
		String orgPassword = memberMapper.checkOrgPwd(checkDto.getUserid());
		
		// 기존 비밀번호와 입력한 비밀번호가 맞는지 확인 -> 맞으면 true, 틀리면 false 리턴
		return passwordEncoder.matches(checkDto.getPassword(), orgPassword); 		
		
	}

	@Override
	@Transactional
	// 비밀번호 수정
	public boolean modifyPwd(String new_password, MemberDTO modifyDto) {
		// db에 저장된 userid의 비밀번호
		String orgPassword = memberMapper.checkOrgPwd(modifyDto.getUserid());
		
		// userid의 비밀번호와 입력한 기존 비밀번호 일치 여부 확인
		boolean resultOrgPwd = passwordEncoder.matches(modifyDto.getPassword(), orgPassword);
		
		
		if(resultOrgPwd) { // 입력한 비밀번호가 일치한다면
			// 새 비밀번호 저장 전 암호화
			new_password = passwordEncoder.encode(new_password);
			// 새 비밀번호 저장
			return memberMapper.modifyPwd(new_password, modifyDto.getUserid()) > 0 ? true : false;
		}
		return false;
	}

	@Override
	// 동일 이메일 검사
	public String checkSameEmail(String userid) {
		return memberMapper.checkSameEmail(userid);
	}

	@Override
	// 이메일 수정
	public boolean modifyEmail(MemberDTO modifyDto) {
		return memberMapper.modifyEmail(modifyDto) > 0 ? true : false;
	}

	@Override
	// 휴대전화 수정
	public boolean modifyPhone(MemberDTO modifyDto) {
		return memberMapper.modifyPhone(modifyDto) > 0 ? true : false;
	}
}
