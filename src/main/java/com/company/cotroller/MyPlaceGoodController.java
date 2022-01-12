package com.company.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.company.domain.BasketDTO;
import com.company.domain.BoardDTO;
import com.company.domain.MyPlaceGoodDTO;
import com.company.service.MyPlaceGoodService;

@Controller
@RequestMapping("/curious")
public class MyPlaceGoodController {
	
	@Autowired
	private MyPlaceGoodService service;
	
	@PostMapping("/insertGood")
	public ResponseEntity<String> insert(MyPlaceGoodDTO insertDto){
		System.out.println("좋아요 여부 삽입 요청"+insertDto);
		
		String msg = "";
		//체크가 0보다 큰 1이라면 검정색에서 녹색으로 색상이 변경되었다면, 공감해요를 눌렀다면
		if(insertDto.getFavoriteBtn() > 0) {
			msg = "add success";
			//좋아요 갯수 1 증가
			service.updateGoodCnt(insertDto.getMno());
			
			return service.insert(insertDto)?
					new ResponseEntity<String>(msg,HttpStatus.OK):
						new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}else {
			//체크가 -1이라면, 녹색에서 검정색으로 색상이 변경되었다면, 공감해요를 취소했다면
			msg = "subtract success";
			//좋아요 갯수 -1 증가
			service.deleteGoodCnt(insertDto.getMno());
				
			//delete 서비스 요청
			return service.delete(insertDto)?
					new ResponseEntity<String>(msg,HttpStatus.OK):
						new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		
	}

}
