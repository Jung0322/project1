package com.company.cotroller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.company.domain.MyPlaceReplyDTO;
import com.company.service.MyPlaceReplyService;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/replies")
public class MyPlaceReplyController {
	
	@Autowired
	private MyPlaceReplyService service;
	
	//댓글 목록 가져오기
	@GetMapping("/pages/{mno}/{page}")
	public ResponseEntity<List<MyPlaceReplyDTO>> readAll(@PathVariable int mno){
		log.info("댓글 전체 가져오기"+mno);
		System.out.println("댓글 전체 가져오기");
		
		return new ResponseEntity<List<MyPlaceReplyDTO>>(service.getList(mno),HttpStatus.OK);
	}
	
	//댓글 하나 가져오기
	@GetMapping("/{mrno}")
	public ResponseEntity<MyPlaceReplyDTO> read(@PathVariable int mrno){
		return new ResponseEntity<MyPlaceReplyDTO>(service.getRow(mrno),HttpStatus.OK);
	}
	
	//댓글 입력하기
	@PostMapping("/new")
	public ResponseEntity<String> create(@RequestBody MyPlaceReplyDTO insertDto, Principal principal){
		log.info("댓글입력"+insertDto);
		
		System.out.println(insertDto);
		
		MyPlaceReplyDTO myPlace = service.getInfoReply(principal.getName());
		insertDto.setUserid(myPlace.getUserid());
		insertDto.setNickname(myPlace.getNickname());
		insertDto.setMytown(myPlace.getMytown());
		
		
		return service.insertReply(insertDto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
	//댓글 수정하기
	@PutMapping("/{mrno}")
	public ResponseEntity<String> modify(@RequestBody MyPlaceReplyDTO updateDto, @PathVariable int mrno){
		
		
		updateDto.setMrno(mrno);
		System.out.println(updateDto);
		
		
		return service.updateReply(updateDto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
	
	//댓글 삭제하기
	@DeleteMapping("/{mrno}")
	public ResponseEntity<String> remove(@PathVariable int mrno, MyPlaceReplyDTO userid){
		return service.deleteReply(mrno)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
}
