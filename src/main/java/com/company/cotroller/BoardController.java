package com.company.cotroller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.domain.BoardDTO;
import com.company.domain.MemberAttachDTO;
import com.company.domain.MemberDTO;
import com.company.domain.MyPlaceCriteria;
import com.company.domain.MyPlaceGoodDTO;
import com.company.domain.MyPlacePageDTO;
import com.company.domain.ProductPageDTO;
import com.company.service.BoardService;
import com.company.service.MemberService;
import com.company.service.MyPlaceGoodService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MyPlaceGoodService goodService;

	@GetMapping("/myPlace")
	public void list(Model model, MyPlaceCriteria cri, Principal principal) {

		System.out.println("동네 페이지 요청" + cri);

		// 로그인 전 동네 페이지 요청
		if (principal == null) {
			List<BoardDTO> list = service.getList(cri);

			int totalCnt = service.getTotalCount(cri);

			model.addAttribute("pageDto", new MyPlacePageDTO(cri, totalCnt));
			model.addAttribute("list", list);

			// 프로필 이미지 불러오기
			// 프로필 이미지 - userid
			for (BoardDTO memberArr : list) {
				MemberAttachDTO profileImg = memberService.readProfileInfo(memberArr.getUserid());

				if (profileImg != null) {
					// 2022\01\02 => 2022\\01\\02
					profileImg.setProfileUploadPath(profileImg.getProfileUploadPath().replace("\\", "\\\\"));

					// System.out.println("profileImg "+profileImg);
					model.addAttribute("profileImg", profileImg);
				}
			}

		} else {
			// 로그인 후 동네 페이지 요청
			String userid = principal.getName();

			BoardDTO dto = service.readMemberInfo(userid);
			List<BoardDTO> list = service.listMyTown(cri, dto.getMytown());

			int totalCnt = service.totalCntMytown(cri, dto.getMytown());

			model.addAttribute("pageDto", new MyPlacePageDTO(cri, totalCnt));
			model.addAttribute("list", list);

		}

	}

	@GetMapping("/myPlace-myPage")
	public String myPage(MyPlaceCriteria cri, String userid, Model model) {
		log.info("내 동내 마이페이지 요청");

		List<BoardDTO> list = service.listMyPage(cri, userid);

		int totalCnt = service.totalCntMypage(cri, userid);

		model.addAttribute("pageDto", new MyPlacePageDTO(cri, totalCnt));
		model.addAttribute("list", list);

		return "/board/myPlace-myPage";
	}

	@GetMapping("/read")
	public String read(int mno, Model model, Principal principal) {
		log.info("내 동내 게시물 읽기 페이지 요청");

		// userid가 null이 아니고,
		// mno에 대한 좋아요 정보가 있다면 좋아요 정보 가져오기
		if (principal != null) {
			MyPlaceGoodDTO goodDto = new MyPlaceGoodDTO();
			goodDto.setMno(mno);
			goodDto.setUserid(principal.getName());
			System.out.println("=============" + goodDto);
			
			String good_check = "false";
			
			if(goodService.getGoodInfo(goodDto)!=null) {
				good_check = "true";
				System.out.println("good !! "+good_check);
			}
			
			model.addAttribute("good_check", good_check);
		}

		BoardDTO dto = service.getRow(mno);
		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "/board/myPlaceRead";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public String modifyGet(int mno, Model model, MyPlaceCriteria cri) {
		log.info("내 동내 게시물 수정 페이지 요청");

		BoardDTO dto = service.getRow(mno);
		model.addAttribute("dto", dto);
		model.addAttribute("cri", cri);

		return "/board/myPlaceModify";
	}

	@PostMapping("/modify")
	public String modify(BoardDTO updateDto) {
		log.info("내 동내 게시물 수정 요청");

		service.modify(updateDto);

		return "redirect:/board/myPlace";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public String write(Principal principal, Model model) {
		log.info("글 작성 페이지 요청");
		System.out.println(principal.getName());

		// 세션에 담긴 아이디 가져오기
		String userid = principal.getName();
		BoardDTO dto = service.readMemberInfo(userid);

		model.addAttribute("dto", dto);

		return "/board/myPlaceWrite";
	}

	@PostMapping("/write")
	public String writePost(BoardDTO insertDTO) {
		log.info("글 작성하기" + insertDTO);

		service.register(insertDTO);

		return "redirect:/board/myPlace";
	}

	@PostMapping("/remove")
	public String deletePost(int mno) {
		log.info("글 삭제하기");
		service.delete(mno);

		return "redirect:/board/myPlace";
	}

}
