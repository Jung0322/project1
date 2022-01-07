package com.company.cotroller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.domain.AddressDTO;
import com.company.domain.MemberDTO;
import com.company.handler.ChatSession;
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
	public String ckNickname(String nickname, Principal principal) {
		System.out.println("중복 닉네임 검사"+nickname);
		
		
		//회원가입 시
		if(principal==null) {
			if(memberService.checkNickname(nickname) != null) { // 회원가입 시(로그인 세션이 없는경우)
				return "false";
			}
		}else {
			//회원수정 시 userid 를 이용해서 사용자의 현재 닉네임을 가져오고
			String orgNickname = memberService.checkSameNickname(principal.getName());
			
			if(!orgNickname.equals(nickname)) {
				if(memberService.checkNickname(nickname) != null) {
					return "false";
				}
			}
			
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
	
	// 로그인 처리
//	@RequestMapping(value="/signIn", method ={RequestMethod.Get,RequestMethod.POST})
//	public String signInPost(MemberDTO loginDto, HttpSession session) {
//		System.out.println("=== 로그인 처리"+loginDto);
//		log.info("로그인 처리"+loginDto);
//		MemberDTO  loginUser = service/*멤버서비스*/.로그인메소드()
//		boolean login = memberService.login(loginDto);
//
//		if(login) {
//			session.setAttribute("loginDto", loginDto);
//			return "redirect:/index";
//		}
//		
//		return "redirect:/member/signIn";
//	}
	
	// 로그아웃
	@PostMapping("/logout")
	public void logoutPost(Principal principal) {
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

		if(memberService.modifyNickname(modifyDto)) {
			return "success";
		}
		return "fail";
	}
	
	// 기존 비밀번호 확인
	@ResponseBody
	@PostMapping("/checkOrgPassword")
	public String checkOrgPassword(MemberDTO checkDto, Principal principal) {
		log.info("기존 비밀번호 확인"+checkDto.getPassword());
		
		checkDto.setUserid(principal.getName());
		
		if(memberService.checkOrgPassword(checkDto)) {
			return "true";
		}
		return "false";
	}
	
	// 비밀번호 수정
	@ResponseBody
	@PostMapping("/pwd-modify")
	public String pwdModify(String new_password, Principal principal, MemberDTO modifyDto) {
		log.info("비밀번호 수정 처리 : 새 비밀번호 -> "+new_password+", 기존 비밀번호 -> "+modifyDto.getPassword());
		System.out.println("비밀번호 수정 처리 : 새 비밀번호 -> "+new_password+", 기존 비밀번호 -> "+modifyDto.getPassword());
		
		// 로그인한 유저의 userid정보 저장
		modifyDto.setUserid(principal.getName());
		
		if(memberService.modifyPwd(new_password, modifyDto)) {
			return "success";
		}
		return "fail";
	}
	
	// 중복 이메일 검사
	@ResponseBody
	@PostMapping("/checkEmail")
	public String ckEmail(String email, Principal principal) {
		
		try {
			// 회원가입 시 
			if(principal == null) {
				if(memberService.checkEmail(email) != null) {
					return "false";
				}
			} else { // 회원정보 수정 시
				// userid 를 이용해서 사용자의 현재 이메일을 가져오고
				String orgEmail = memberService.checkSameEmail(principal.getName());
				
				if(!orgEmail.equals(email)) {
					if(memberService.checkEmail(email) != null) {
						return "false";
					}
				}
			}
		} catch (Exception e) {
			return "false";
		}
		return "true";
	}
	
	// 이메일 수정
	@ResponseBody
	@PostMapping("/email-modify")
	public String modifyEmail(MemberDTO modifyDto, Principal principal) {
		log.info("이메일 수정 "+modifyDto);
		
		// 로그인한 유저의 userid 정보 저장
		modifyDto.setUserid(principal.getName());
		
		if(memberService.modifyEmail(modifyDto)) {
			return "success";
		}
		
		return "fail";
	}
	
	// 휴대전화 수정
	@ResponseBody
	@PostMapping("/phone-modify")
	public String modifyPhone(MemberDTO modifyDto, Principal principal) {
		log.info("휴대전화 수정 "+modifyDto);
		
		// 로그인한 유저의 userid 정보 저장
		modifyDto.setUserid(principal.getName());
		
		if(memberService.modifyPhone(modifyDto)) {
			return "success";
		}
		
		return "fail";
	}
	
	// 프로필
	// 프로필 화면
	@GetMapping("/profile-page")
	public void profilePage(String userid, Model model) {
		MemberDTO memberInfo = memberService.readMemberInfo(userid);
		
		model.addAttribute("dto", memberInfo);
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
