package com.sujin.eComfort.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sujin.eComfort.model.User;
import com.sujin.eComfort.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/login")
	public String openLoginForm() {
		return "user/loginForm";
	}
	
	@GetMapping("/loginFail")
	public String loginFailure() {
		return "user/loginFail";
	}
	
	@GetMapping("/join")
	public String openJoinForm() {
		return "user/joinForm";
	}
	
	@GetMapping("/user/mypage")
	public String openMypage() {
		return "user/mypage";
	}
	
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		User user = userService.findUser(email);
		if(user == null) {
			return 0;
		} else {
			return 1;
		}
	}
}
