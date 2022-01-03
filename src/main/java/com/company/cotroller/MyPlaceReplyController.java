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
	
	@GetMapping("/pages/{mno}/{page}")
	public ResponseEntity<List<MyPlaceReplyDTO>> readAll(@PathVariable int mno){
		log.info("댓글 전체 가져오기"+mno);
		
		return new ResponseEntity<List<MyPlaceReplyDTO>>(service.getList(mno),HttpStatus.OK);
	}
	
	@PostMapping("/new")
	public ResponseEntity<String> create(@RequestBody MyPlaceReplyDTO insertDto, Principal principal){
		log.info("댓글입력"+insertDto);
		
		insertDto = service.getInfoReply(principal.getName());
		
		System.out.println(insertDto);
		
		return service.insertReply(insertDto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
	@PutMapping("/{mrno}")
	public ResponseEntity<String> modify(@RequestBody MyPlaceReplyDTO updateDto, @PathVariable int mrno){
		updateDto.setMrno(mrno);
		
		return service.updateReply(updateDto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
	
	@DeleteMapping("/{mrno}")
	public ResponseEntity<String> remove(@PathVariable int mrno, @RequestBody MyPlaceReplyDTO reply){
		return service.deleteReply(mrno)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
}
