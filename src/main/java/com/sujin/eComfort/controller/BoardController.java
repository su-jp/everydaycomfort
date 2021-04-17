package com.sujin.eComfort.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	@GetMapping("/board/brandstory")
	public String openBrandstory() {
		return "board/brandstory/brandFullPage";
	}
	
	@GetMapping("/board/interior")
	public String openInterior() {
		return "board/interior/interiorFullPage";
	}

	@GetMapping("/board/promotion")
	public String openPromotion() {
		return "board/promotion/promoPage";
	}
}
