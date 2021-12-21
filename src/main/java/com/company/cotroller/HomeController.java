package com.company.cotroller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
		public void index() {
		System.out.println("Aaaaaaa");
	}
	
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
		public void blog() {
		System.out.println("Aaaaaaa");
	}
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
		public String contact() {
		System.out.println("Aaaaaaa");
		return "/member/signUp";
	}
	@RequestMapping(value = "/single-post", method = RequestMethod.GET)
		public void single_post() {
		System.out.println("Aaaaaaa");
	}
	@RequestMapping(value = "/single-project", method = RequestMethod.GET)
	public void single_project() {
		System.out.println("Aaaaaaa");
	}
	@RequestMapping(value = "/myPlace", method = RequestMethod.GET)
	public void about() {
		System.out.println("Aaaaaaa");
	}
	
}
