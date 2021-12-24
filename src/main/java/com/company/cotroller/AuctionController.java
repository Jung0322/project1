package com.company.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class AuctionController {
	@RequestMapping(value = "/auction", method = RequestMethod.GET)
	public String auction() {
		log.info("auction");
		return "/auction/auction";
	}

	@RequestMapping(value = "/auction-single-project", method = RequestMethod.GET)
	public String single_project() {
		log.info("single-project");
		return "/auction/auction-single-project";
	}
	
	@RequestMapping(value = "/auction-product-registration", method = RequestMethod.GET)
	public String auction_project_registration() {
		log.info("single-project");
		return "/auction/auction-product-registration";
	}
}
