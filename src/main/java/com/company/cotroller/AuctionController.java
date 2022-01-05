package com.company.cotroller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.AttachAuctionDTO;
import com.company.domain.AttachProductDTO;
import com.company.domain.AuctionDTO;
import com.company.domain.ProductCriteria;
import com.company.domain.ProductDTO;
import com.company.domain.ProductPageDTO;
import com.company.service.AuctionService;
import com.company.service.ProductService;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
public class AuctionController {
	
	@Autowired
	private AuctionService serive;
	
	@RequestMapping(value = "/auction/auction", method = RequestMethod.GET)
	public void auction(Model model, ProductCriteria cri) {
		log.info("auction");
		
		
		List<AuctionDTO> list = serive.getList(cri);
		
		
		
		for(AuctionDTO dto:list) {
			for(AttachAuctionDTO attach:dto.getAttachList()) {
				
				attach.setAuploadPath(attach.getAuploadPath().replace("\\", "\\\\"));
			}
		}
		//페이지 나누기를 위한 정보 얻기
		int totalCnt = serive.getTotalCount(cri);
		
//		System.out.println("아예이오후"+list);
		System.out.println("totalCnt "+totalCnt);
		
		ProductPageDTO pageDto = new ProductPageDTO(cri, totalCnt);
		System.out.println("pageDto "+pageDto);
		model.addAttribute("pageDto", pageDto);
		
		
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/auction-single-product", method = RequestMethod.GET)
	public String single_project() {
		log.info("single-project");
		return "/auction/auction-single-project";
	}
	
	@RequestMapping(value = "/auction-product-registration", method = RequestMethod.GET)
	public String auction_project_registration() {
		log.info("single-project");
		return "/auction/auction-product-registration";
	}
	
	@RequestMapping(value = "/auction/auction-product-registration", method = RequestMethod.POST)
	public String auction_project_registration(AuctionDTO dto) {
		log.info("register confirm " + dto);
		serive.insert(dto);
		
		return "/auction/auction";
	}
	

	
}
