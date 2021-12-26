package com.company.cotroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.MemberDTO;
import com.company.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원가입 & 회원정보 수정
	// 회원가입 화면
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp() {
		log.info("회원가입 화면");
		
		
		return "/member/signUp";
	}

	// 회원정보 수정 화면
	@GetMapping("/modify-info")
	public void modifyMember() {
		
	}
	
	// 로그인 
	// 로그인 화면
	@GetMapping("/signIn")
	public void signIn() {
		log.info("로그인 폼");
	}
	
	// 로그인 처리
	@PostMapping("/signIn")
	public String signInPost(MemberDTO loginDto, HttpSession session) {
		System.out.println("로그인 처리"+loginDto);
		log.info("로그인 처리"+loginDto);
		
		boolean login = memberService.login(loginDto);
		System.out.println(login);
		if(login) {
			session.setAttribute("loginDto", loginDto);
			return "redirect:/index";
		}
		
		return "redirect:/member/signIn";
	}
	
	// 프로필
	// 프로필 화면
	@GetMapping("/profile-page")
	public void profilePage() {
		
	}
	
	@GetMapping("/my-basket")
	public String myBasket() {
		return "/member/my-basket";
	}
}
