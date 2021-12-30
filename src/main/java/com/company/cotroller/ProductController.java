package 	com.company.cotroller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.ProductDTO;
import com.company.service.ProductService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	
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
	
	@RequestMapping(value = "/product-registration", method = RequestMethod.GET)
	public String product_registration() {
		log.info("product-registration");
		return "/product/product-registration";
	}
	
	@RequestMapping(value = "/product/product-registration", method = RequestMethod.POST)
	public String product_registration(ProductDTO dto){
		log.info("register 요청" +dto);
		//service.insert(dto);
		
		return "/product/index";
	}
}
