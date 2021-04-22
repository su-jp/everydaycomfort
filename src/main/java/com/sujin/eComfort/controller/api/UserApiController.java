package com.sujin.eComfort.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sujin.eComfort.dto.ResponseDTO;
import com.sujin.eComfort.model.User;
import com.sujin.eComfort.service.UserService;

@RestController
public class UserApiController {
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/joinProc")
	public ResponseDTO<Integer> save(@RequestBody User user) {
		userService.join(user);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/user/myinfo")
	public ResponseDTO<Integer> update(@RequestBody User user) {
		userService.update(user);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
}
