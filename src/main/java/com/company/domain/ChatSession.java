package com.company.domain;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("cSession")
public class ChatSession {
	// 현재 로그인 되어 있는 유저들을 저장하는 VO
	// VO 란?
	// Value Object의 줄임말로 DTO,Entity 등을 말한다. 
	// 메인에서 한 개 또는 그 이상의 속성들을 묶어서 특정 값을 나타내는 객체를 의미한다.
	
	
	
	// static으로 필드변수를 설정하여 같은 ArrayList를 이용 할 수 있도록 선언합니다.
	private static ArrayList<String> loginUser = new ArrayList<String>();
	
	
	// 로그인 시 ArrayList에 추가합니다.
	public void addLoginUser(String nickname) {
		loginUser.add(nickname);
	}
	
	// 로그아웃 시 ArrayList에서 제거합니다.
	public void removeLoginUser(String nickname) {
		loginUser.remove(nickname);
	}
	
	// 현재 로그인 되어 있는 유저 목록을 가져오기
	public static ArrayList<String> getLoginUser(){
		return loginUser;
	}
	
	
	// 자동 setter 사용하지 않음
	public static void setLoginUser(ArrayList<String> loginUser) {
		ChatSession.loginUser = loginUser;
	}
	
}
