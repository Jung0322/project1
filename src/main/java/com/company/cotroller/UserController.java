package com.company.cotroller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.company.domain.ChatSession;
import com.company.domain.MemberDTO;
import com.company.service.UserService;


@SessionAttributes({"loginUser", "master2","rankPic","admin"})// Model에 loginUser라는 키값으로 객체가 추가되면 자동으로 세션에 추가하라는 의미의 어노테이션
@Controller
public class UserController {
	// 채팅
//	@Autowired
//	private ChatSession cSession;
//	
//	@Autowired
//	private UserService uService;
	
	// 로그인 세션 메소드 ( 암호화 처리 )
//	@RequestMapping(value="/chat", method= {RequestMethod.GET, RequestMethod.POST})
//	public String memberLogin(MemberDTO memberDto, Model model, HttpServletRequest request) {
//		
//			MemberDTO loginMember = new MemberDTO()/*mapper처리문구 변경*/;
//			// 채팅 
//			// 현재 로그인 한 member 채팅 session arraylist에 추가
//		cSession.addLoginUser(loginMember.getNickname());
//	}
}
