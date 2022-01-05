package com.company.cotroller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.domain.AddressDTO;
import com.company.domain.MemberDTO;
import com.company.service.MemberService;

import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Log4j2
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원가입 & 회원정보 수정
	// 회원가입 화면
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp(HttpSession session) {
		log.info("회원가입 화면");
				
		return "/member/signUp";
	}

	// 회원가입 처리
	@PostMapping("/signUp")
	public String signUpPost(MemberDTO insertDto) {
		log.info("회원가입 처리");
		System.out.println("=== 회원가입 처리"+insertDto);
		
		boolean newMember = memberService.insertMember(insertDto);
		
		if(newMember) {
			return "redirect:/member/signIn";
		}
		return "redirect:/member/signUp";
	}
	
	// 중복 아이디 검사
	@ResponseBody
	@PostMapping("/checkUserid")
	public String ckUserid(String userid) {
		log.info("중복 아이디 검사"+userid);
		
		try {
			if(memberService.checkUserid(userid) != null) {
				return "false";
			}
		} catch (Exception e) {
			return "false";
		}
		return "true";
	}
	
	// 중복 닉네임 검사
	@ResponseBody
	@PostMapping("/checkNickname")
	public String ckNickname(String nickname) {
		log.info("중복 닉네임 검사"+nickname);
		
		if(memberService.checkNickname(nickname) != null) {
			return "false";
		}
		return "true";
	}
	
	
	// 로그인 
	// 로그인 화면
//	@GetMapping("/signIn")
	@RequestMapping(value="/signIn")
	public void signIn() {
		log.info("로그인 폼");
	}	
	
	// 로그아웃
	@PostMapping("/logout")
	public void logoutPost() {
		log.info("로그아웃 요청");
	}
	
	// 회원정보 수정
	// 회원정보 수정 화면
	@GetMapping("/modify-info")
	public void modifyMember(Principal principal, Model model) {
		log.info("회원정보 수정 화면"+principal.getName()); 
		
		MemberDTO memberInfo = memberService.readMemberInfo(principal.getName());
			
		model.addAttribute("dto", memberInfo);
	}
	
	// 닉네임 수정
	@ResponseBody
	@PostMapping("/nickname-modify")
	public String modifyNickname(MemberDTO modifyDto, Principal principal) {
		log.info("닉네임 수정"+modifyDto.getNickname());
		
		modifyDto.setUserid(principal.getName()); // 로그인한 아이디 저장
		
		try {
			if(memberService.modifyNickname(modifyDto)) {
				return "success";
			}
		} catch (Exception e) {
			return "fail";
		}
		
		return "fail";
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
	
	// 가계부
	@GetMapping("/cashbook-page")
	public void cashbookPage() {

	}
	
	
	
	// 주소 api
	@GetMapping("/jusoPopup")
	public void jusoGet() {
		log.info("주소 API");
	}
	@PostMapping("/jusoPopup")
	public void jusoPost(Model model, MemberDTO memberDto, AddressDTO addDto) {
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("addDto", addDto);
		
	}
}
