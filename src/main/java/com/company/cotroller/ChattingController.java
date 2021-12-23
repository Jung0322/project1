package com.company.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.company.service.ChattingService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ChattingController {
	
	@Autowired
	private ChattingService chatService;
	

	
	
}
