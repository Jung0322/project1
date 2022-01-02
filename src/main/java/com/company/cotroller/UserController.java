package com.company.cotroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.company.domain.ChatSession;
import com.company.domain.MemberDTO;
import com.company.service.MemberService;

@SessionAttributes({ "loginUser", "master2", "rankPic", "admin" }) // Model에 loginUser라는 키값으로 객체가 추가되면 자동으로 세션에 추가하라는
																	// 의미의 어노테이션
@Controller
public class UserController {
	// 채팅
	@Autowired
	private ChatSession cSession;

	@Autowired
	private MemberService uService;

	// 로그인 세션 메소드 ( 암호화 처리 )
	@RequestMapping(value = "/chat", method = { RequestMethod.GET, RequestMethod.POST })
	public void memberLogin(String userid, Model model, HttpServletRequest request) {

		MemberDTO loginMember = uService.readMember(userid); /* mapper처리문구 변경 */;
		// 채팅
		// 현재 로그인 한 member 채팅 session Arraylist에 추가
		cSession.addLoginUser(loginMember.getNickname());
	}

	@RequestMapping("logout.do")
	public void logout(HttpSession session) {
		// 채팅
		MemberDTO m = (MemberDTO) session.getAttribute("loginUser");

		// 채팅
		// 로그아웃한 User를 채팅 Session ArrayList에서 삭제
		cSession.removeLoginUser(m.getNickname());
	}
}
