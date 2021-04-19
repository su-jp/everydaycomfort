package com.sujin.eComfort.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping({"","/"})
	public String index() {
		return "index";
	}
	
	@GetMapping("/login")
	public String openLoginForm() {
		return "user/loginForm";
	}
	
	@GetMapping("/join")
	public String openJoinForm() {
		return "user/joinForm";
	}
}
