package 	com.company.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class MemberController {

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String contact() {
		System.out.println("Aaaaaaa");
		return "/member/signUp";
	}
	
	@GetMapping("/signIn")
	public String SignIn() {
		return "/member/signIn";
	}
}
