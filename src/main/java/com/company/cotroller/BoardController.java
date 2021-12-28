package com.company.cotroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardDTO;
import com.company.domain.MemberDTO;
import com.company.service.BoardService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;

	@GetMapping("/myPlace")
	public void list(Model model) {
		log.info("내 동내 페이지 요청");

		List<BoardDTO> list = service.getList();
		model.addAttribute("list", list);

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
		
		model.addAttribute("dto",dto);
		
		return "/board/myPlaceRead";
	}

	@GetMapping("/modify")
	public String modify() {
		log.info("내 동내 게시물 수정 페이지 요청");
		return "/board/myPlaceModify";
	}

	@GetMapping("/write")
	public String write() {
		log.info("글 작성 페이지 요청");
		return "/board/myPlaceWrite";
	}

	@PostMapping("/write")
	public String writePost(BoardDTO insertDTO, Model model) {
		log.info("글 작성하기" + insertDTO);
		
		service.register(insertDTO);
		
		return "redirect:/board/myPlace";
	}

}
