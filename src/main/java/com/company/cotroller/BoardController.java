package com.company.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class BoardController {
	@GetMapping("/myPlace")
	public String about() {
		log.info("내 동내 페이지 요청");
		return "/board/myPlace";
	}
	
	@GetMapping("/read")
	public String read() {
		log.info("내 동내 게시물 읽기 페이지 요청");
		return "/board/myPlaceRead";
	}

	@GetMapping("/modify")
	public String modify() {
		log.info("내 동내 게시물 수정 페이지 요청");
		return "/board/myPlaceModify";
	}
	
	@GetMapping("/write")
	public String write() {
		log.info("내 동내 게시물 작성 페이지 요청");
		return "/board/myPlaceWrite";
	}
}
