package com.company.cotroller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.company.domain.AttachProductDTO;
import com.company.domain.BasketDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;
import com.company.domain.ProductPageDTO;
import com.company.service.BasketService;
import com.company.service.ProductService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class BasketController {

	@Autowired
	private BasketService serive;
	
	@Autowired
	private ProductService pserive;
	
	@PostMapping("/selectgood")
	public ResponseEntity<BasketDTO> select(@RequestBody BasketDTO dto){
		System.out.println("장바구니: "+dto);
		BasketDTO result = null;
		result = serive.select(dto); 
		return new ResponseEntity<BasketDTO>(result,HttpStatus.OK);
	}
	
	@PostMapping("/deletegood")
	public ResponseEntity<String> delete(@RequestBody BasketDTO dto){
		
		pserive.goodCount(-1, dto.getPno());
		
		return serive.delete(dto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/insertgood")
	public ResponseEntity<String> insert(@RequestBody BasketDTO dto){
		
		pserive.goodCount(1, dto.getPno());
		
		return serive.insert(dto)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
	
	@GetMapping("/my-basket")
	public String basket(Principal principal,Model model, ProductCriteria cri) {
		log.info("index");
		

		System.out.println("가나다라"+cri);
		String userid =  principal.getName();
		List<ProductDTO> list = serive.getList(cri, userid);
		
		
		
		for(ProductDTO dto:list) {
			for(AttachProductDTO attach:dto.getAttachList()) {
				
				attach.setPuploadPath(attach.getPuploadPath().replace("\\", "\\\\"));
			}
		}
		//페이지 나누기를 위한 정보 얻기
		int totalCnt =  serive.getTotalCount(cri.getCate(),userid);
		
	System.out.println("아예이오후"+list);
		System.out.println("totalCnt "+totalCnt);
		
		ProductPageDTO pageDto = new ProductPageDTO(cri, totalCnt);
		System.out.println("pageDto "+pageDto);
		model.addAttribute("pageDto", pageDto);
		
		
		model.addAttribute("list", list);
		
		return "/product/my-basket";
	}
	
}
