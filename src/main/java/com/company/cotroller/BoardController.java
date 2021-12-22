package com.company.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping(value = "/myPlace", method = RequestMethod.GET)
	public String about() {
		System.out.println("Aaaaaaa");
		return "/board/myPlace";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read() {
		System.out.println("Aaaaaaa");
		return "/board/myPlaceRead";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify() {
		System.out.println("Aaaaaaa");
		return "/board/myPlaceModify";
	}
}
