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
	
	@RequestMapping(value = "/member/signUp", method = RequestMethod.GET)
	public String contact() {
		System.out.println("Aaaaaaa");
		return "/member/signUp";
	}
	
	// 로그인 화면
	@GetMapping("/signIn")
	public String signIn() {
		log.info("로그인 폼");
		
		return "/member/signIn";
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
		
		return "redirect:/signIn";
	}
	
	@GetMapping("/modifyMember")
	public String modifyMember() {
		return "/member/modifyMember";
	}
	
	@GetMapping("/myBasket")
	public String myBasket() {
		return "/member/myBasket";
	}
	
	// 주소 api
	@GetMapping("/Sample")
	public String addressGet() {
		return "/member/Sample";
	}
	@GetMapping("/jusoPopup")
	public String jusoGet() {
		return "/member/jusoPopup";
	}
}
