package com.company.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.MemberAttachDTO;
import com.company.domain.MemberDTO;
import com.company.mapper.MemberAttachMapper;
import com.company.mapper.MemberMapper;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private MemberAttachMapper memberAttachMapper;
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
	public MemberDTO readMember(String userid) {
		return memberMapper.readMember(userid);
	}

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
	// 프로필 이미지 정보 불러오기
	public MemberAttachDTO readProfileInfo(String userid) {
		return memberAttachMapper.showProfileimg(userid);
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

	@Override
	// 내동네 수정
	public boolean modifyMytown(MemberDTO modifyDto) {
		return memberMapper.modifyMytown(modifyDto) > 0 ? true : false;
	}

	@Override
	// 프로필 이미지 저장
	public boolean insertProfileImg(MemberAttachDTO insertDto) {
		// 프로필 이미지 저장
		// null이거나 사이즈가 0보다 작거나 같은 경우 리턴
		if(insertDto.getProfileImgName() == null || insertDto.getProfileImgName().length() <= 0) {
			return false;
		}
		
		boolean result = memberAttachMapper.insertProfileImg(insertDto) > 0 ? true : false; 
		
		return result;
	}

	@Override
	// 프로필 이미지 삭제
	public boolean deleteProfileImg(String userid) {
		return memberAttachMapper.deleteProfileImg(userid) > 0 ? true : false;
	}

	@Override
	// 프로필 이미지 수정
	public boolean modifyProfileImg(MemberAttachDTO modifyDto) {
		return memberAttachMapper.modifyProfileImg(modifyDto) > 0 ? true : false;
	}
	
	@Transactional
	@Override
	// 회원탈퇴
	public boolean deleteMember(MemberDTO deleteDto) {
		// 기존 비밀번호
		String orgPassword = memberMapper.checkOrgPwd(deleteDto.getUserid());
		
		// 기존 비밀번호와 입력 비밀번호 일치 여부
		boolean checkOrgPwd = passwordEncoder.matches(deleteDto.getPassword(), orgPassword);
		
		if(checkOrgPwd) { // 기존 비밀번호와 입력 비밀번호가 일치 한다면
			if(memberMapper.deleteMember(deleteDto.getUserid()) > 0) {
				memberMapper.deleteMemberROLE(deleteDto.getUserid());
			}
		}
		return checkOrgPwd;
	}

	
	@Override
	// 전화번호 인증
	public void certifiedPhoneNumber(String phone, int randomNumber) {
		String api_key = "NCS2LSGHCCKSFUM9";
		String api_secret = "4IA0GKPORG5ROBBRY91MNBKLYU2N5GZK";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone); // 수신전화번호
		params.put("from", "010-8972-9462"); // 발신전화번호
		params.put("type", "SMS"); 
		params.put("text", "[브로콜리마켓] 인증번호는" +"["+randomNumber+"]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version 
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}

	@Override
	// 아이디 찾기
	public String findUserid(String email, String phone) {
		return memberMapper.findUserid(email, phone);
	}

	@Override
	// 비밀번호 찾기
	public MemberDTO findPwd(MemberDTO MemberDto) {
		return memberMapper.findPwd(MemberDto);
	}

	@Override
	// 비밀번호 재설정
	public boolean replacePwd(String userid, String new_password) {
		// 비밀번호 저장 전 암호화
		new_password = passwordEncoder.encode(new_password);
		
		return memberMapper.modifyPwd(new_password, userid) > 0 ? true : false;
	}
}
