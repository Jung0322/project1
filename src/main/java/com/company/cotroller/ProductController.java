package 	com.company.cotroller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ProductController {

	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
		public String index() {
		log.info("index");
		return "/product/index";
	}
	
	@RequestMapping(value = "/single-project", method = RequestMethod.GET)
	public String single_project() {
		log.info("single-project");
		return "/product/single-project";
	}
}
