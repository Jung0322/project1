package com.company.cotroller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.company.domain.MemberDTO;
import com.company.domain.MyPlaceCriteria;
import com.company.domain.MyPlacePageDTO;
import com.company.service.BoardService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;

	@GetMapping("/myPlace")
	public void list(Model model, MyPlaceCriteria cri) {
		log.info("내 동내 페이지 요청");

		List<BoardDTO> list = service.getList(cri);

		int totalCnt = service.getTotalCount(cri);

		model.addAttribute("pageDto", new MyPlacePageDTO(cri, totalCnt));
		model.addAttribute("list", list);
		
		//로그인 후 동네 게시물만 보여주기
		
//		
//		List<BoardDTO> mytownList = service.getMytown(cri);
//		int totalCntMytown = service.getTotalCountMytown(cri);
//		
//		model.addAttribute("pageDTO", new MyPlacePageDTO(cri, totalCntMytown));
//		model.addAttribute("mytownList",mytownList);

	}

	@GetMapping("/myPlace-myPage")
	public String myPage() {
		log.info("내 동내 마이페이지 요청");
		return "/board/myPlace-myPage";
	}

	@GetMapping("/read")
	public String read(int mno, Model model) {
		log.info("내 동내 게시물 읽기 페이지 요청");
		BoardDTO dto = service.getRow(mno);

		model.addAttribute("dto", dto);

		return "/board/myPlaceRead";
	}

	@GetMapping("/modify")
	public String modifyGet(int mno, Model model) {
		log.info("내 동내 게시물 수정 페이지 요청");

		BoardDTO dto = service.getRow(mno);
		model.addAttribute("dto", dto);

		return "/board/myPlaceModify";
	}

	@PostMapping("/modify")
	public String modify(BoardDTO updateDto) {
		log.info("내 동내 게시물 수정 요청");

		service.modify(updateDto);

		return "redirect:/board/myPlace";
	}

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

		service.delete(mno);

		return "redirect:/board/myPlace";
	}

}
