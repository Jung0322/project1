package com.company.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.company.domain.ReplyDTO;
import com.company.service.ReplyService;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/replies")
public class ReplyControllor {
	
	@Autowired
	private ReplyService service;
	
	public ResponseEntity<List<ReplyDTO>> readAll(int mno){
		log.info("댓글 전체 가져오기"+mno);
		
		return new ResponseEntity<List<ReplyDTO>>(service.getList(mno),HttpStatus.OK);
	}
	
	@PostMapping("/new")
	public ResponseEntity<String> create(@RequestBody ReplyDTO insertDto){
		log.info("댓글입력"+insertDto);
		
		return service.insertReply(insertDto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}

}
