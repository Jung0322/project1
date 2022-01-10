package com.company.cotroller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.AddressDTO;
import com.company.domain.MemberAttachDTO;
import com.company.domain.MemberDTO;
import com.company.service.MemberService;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;
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
//		MemberAttachDTO profileInfo = memberService.readProfileInfo(principal.getName());
			
		model.addAttribute("dto", memberInfo);
//		model.addAttribute("profileImg", profileInfo);
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
	
//	@ResponseBody
	@PostMapping("/uploadProfile")
	public ResponseEntity<MemberAttachDTO> uploadProfile(@RequestParam("profileimgname") MultipartFile profileimgname, Principal principal) {
		System.out.println("파일 업로드");
		
		// 서버 폴더에 첨부 파일 저장
		String uploadFolder = "C:\\Users\\MinYoung\\Desktop\\temp-workspace\\ccoli\\member";
//		String uploadFolder = "E:\\ccoli\\member"; // 시연할 때 사용
		String uploadFileName = "";
		
		// 업로드 폴더 결정
		String uploadFolderPath = getFolder();
		
		// 폴더 만들기
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		

		// 기존 프로필 이미지 여부 확인
		MemberAttachDTO orgAttachDto = memberService.readProfileInfo(principal.getName());

		// 기존 프로필 이미지가 없다면
		if(orgAttachDto == null) { 
		
			// 폴더 존재 여부
			if(!uploadPath.exists()) { // 폴더가 존재하지 않으면
				// 폴더 생성
				uploadPath.mkdirs();
			}
			
			// uuid값을 파일이름에 추가(중복된 파일명을 만들지 않게 하기 위함)
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+profileimgname.getOriginalFilename();
			
			// 업로드 폴더 경로 및 업로드 파일 이름
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 첨부파일 
			MemberAttachDTO attachDto = new MemberAttachDTO();
			attachDto.setPfuuid(uuid.toString());
			attachDto.setProfileUploadPath(uploadFolderPath);
			attachDto.setProfileImgName(profileimgname.getOriginalFilename());
			attachDto.setUserid(principal.getName());
			
			// 파일 리사이징 후 파일폴더에 업로드
			try {
				FileOutputStream thumbnail = new FileOutputStream(saveFile);
				InputStream in = profileimgname.getInputStream();
				Thumbnailator.createThumbnail(in, thumbnail, 150, 150);
				
				// 사용 후 닫아주기
				in.close();
				thumbnail.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			// 첨부파일을 파일폴더에 업로드
	//		try {
	//			profileimgname.transferTo(saveFile);
	//		} catch (IllegalStateException e) {
	//			e.printStackTrace();
	//		} catch (IOException e) {
	//			e.printStackTrace();
	//		}
			
			// 첨부파일의 정보를 DB에 저장
			if(memberService.insertProfileImg(attachDto)) {
				return new ResponseEntity<MemberAttachDTO>(attachDto, HttpStatus.OK);
			}
			
		} // if(orgAttachDto != null) end
		else { // 기존 프로필 이미지가 있다면
			deleteFiles(orgAttachDto); // 이미지 폴더에 저장된 파일 삭제
			
			// 폴더 존재 여부
			if (!uploadPath.exists()) { // 폴더가 존재하지 않으면
				// 폴더 생성
				uploadPath.mkdirs();
			}

			// uuid값을 파일이름에 추가(중복된 파일명을 만들지 않게 하기 위함)
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + profileimgname.getOriginalFilename();

			// 업로드 폴더 경로 및 업로드 파일 이름
			File saveFile = new File(uploadPath, uploadFileName);

			// 첨부파일
			MemberAttachDTO attachDto = new MemberAttachDTO();
			attachDto.setPfuuid(uuid.toString());
			attachDto.setProfileUploadPath(uploadFolderPath);
			attachDto.setProfileImgName(profileimgname.getOriginalFilename());
			attachDto.setUserid(principal.getName());

			// 파일 리사이징 후 파일폴더에 업로드
			try {
				FileOutputStream thumbnail = new FileOutputStream(saveFile);
				InputStream in = profileimgname.getInputStream();
				Thumbnailator.createThumbnail(in, thumbnail, 150, 150);

				// 사용 후 닫아주기
				in.close();
				thumbnail.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(memberService.modifyProfileImg(attachDto)) {
				return new ResponseEntity<MemberAttachDTO>(attachDto, HttpStatus.OK);
			}
		} // else end 
		
		return new ResponseEntity<MemberAttachDTO>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 폴더명 생성
	private String getFolder() {
		// 년월일 포맷을 사용하겠다고 선언
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		// 현재 날짜를 가져오는 객체
		Date date = new Date();

		// str에는 "2021-12-08"만 남음
		String str = sdf.format(date);

		return str.replace("-", File.separator); // 2021/12/08을 리턴
	}
	
	// 프로필 이미지 가져오기
	@ResponseBody
	@GetMapping("/profileDisplay")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("프로필 이미지 "+fileName);
		System.out.println("프로필 이미지 "+fileName);
		
		File file = new File("C:\\Users\\MinYoung\\Desktop\\temp-workspace\\ccoli\\member\\", fileName);
		// 시연용 파일폴더 경로
//		File file = new File("e:\\ccoli\\member\\", fileName);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 프로필 이미지 정보 가져오기
	@GetMapping("/getProfileImg")
	public ResponseEntity<MemberAttachDTO> getProfileImg(String userid, Principal principal) {
		
		if(userid != null) {
			return new ResponseEntity<MemberAttachDTO>(memberService.readProfileInfo(userid), HttpStatus.OK);
		} else if(principal != null) {
			return new ResponseEntity<MemberAttachDTO>(memberService.readProfileInfo(principal.getName()), HttpStatus.OK);
		}
		return null;
	}
	
	// 업로드된 프로필 사진 삭제
	@ResponseBody
	@GetMapping("/delete-profile")
	public String deleteProfileImg(Principal principal) {
		// 프로필 이미지 정보 가져오기
		MemberAttachDTO attachDto = memberService.readProfileInfo(principal.getName());
		// 이미지 폴더에서 프로필 이미지 삭제
		boolean result = deleteFiles(attachDto);
		
		// DB에서 프로필 이미지 정보 삭제
		if(result) {
			if(memberService.deleteProfileImg(principal.getName())) {
				return "success";
			}
		}
		return "fail";
	}
	
	// 첨부 파일 삭제 
	private boolean deleteFiles(MemberAttachDTO attachDto) {
		if(attachDto == null || attachDto.getProfileUploadPath().length() == 0) {
			return false;
		}
		log.info("프로필 이미지 삭제 중");
		System.out.println("프로필 이미지 삭제 중");
		
		Path file = Paths.get("C:\\Users\\MinYoung\\Desktop\\temp-workspace\\ccoli\\member\\"+
								attachDto.getProfileUploadPath()+"\\"+attachDto.getPfuuid()+"_"+attachDto.getProfileImgName());
		// 시연용 경로
//		Path file = Paths.get("e:\\ccoli\\member\\"+
//				attachDto.getProfileUploadPath()+"\\"+attachDto.getPfuuid()+"_"+attachDto.getProfileImgName());
		
		try {
			Files.deleteIfExists(file);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	// 회원 탈퇴
	@GetMapping("/remove-member")
	public void removeMember() {
		
	}
	
	@PostMapping("/remove-member")
	public String removeMemberPost(MemberDTO deleteDto, RedirectAttributes redirectAttr, SessionStatus sessionStatus) {
		// 회원 탈퇴시 프로필 이미지, 회원정보 삭제
		
		// 프로필 이미지 여부 확인
		MemberAttachDTO attachDto = memberService.readProfileInfo(deleteDto.getUserid());
		
		if(attachDto != null) { // 프로필 이미지가 있다면
			if(deleteFiles(attachDto)) { // 파일폴더에서 파일 삭제
				// DB의 프로필 이미지 정보 삭제
				memberService.deleteProfileImg(deleteDto.getUserid());
				// 회원, 권한정보 삭제
				memberService.deleteMember(deleteDto);
				
				redirectAttr.addFlashAttribute("msg", "성공적으로 회원정보를 삭제했습니다.");
				SecurityContextHolder.clearContext();
			}
		} else { // 프로필 이미지가 없다면
			// 회원, 권한정보 삭제
			memberService.deleteMember(deleteDto);
			
			redirectAttr.addFlashAttribute("msg", "성공적으로 회원정보를 삭제했습니다.");
			SecurityContextHolder.clearContext();
		}
		
		redirectAttr.addFlashAttribute("msg", "회원정보삭제에 실패했습니다.");
		
		
		return "redirect:/product/index";
	}
	
	// 프로필
	// 프로필 화면
	@GetMapping("/profile-page")
	public void profilePage(String userid, Model model) {
		MemberDTO memberInfo = memberService.readMemberInfo(userid);
		
		model.addAttribute("dto", memberInfo);
		
		// 프로필 이미지 불러오기
		//프로필 이미지 - userid
		MemberAttachDTO profileImg = memberService.readProfileInfo(userid);
		if(profileImg != null) {
			//   2022\01\02  => 2022\\01\\02
			profileImg.setProfileUploadPath(profileImg.getProfileUploadPath().replace("\\", "\\\\"));
			
			//System.out.println("profileImg "+profileImg);
			model.addAttribute("profileImg", profileImg);
		}
		
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
	public void jusoPost() {
		log.info("주소 불러오기");
	}
}
