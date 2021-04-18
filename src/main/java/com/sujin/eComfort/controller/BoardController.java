package com.sujin.eComfort.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	@GetMapping("/brandstory")
	public String openBrandstory() {
		return "pages/brandFullPage";
	}
	
	@GetMapping("/interior")
	public String openInterior() {
		return "pages/interiorFullPage";
	}

	@GetMapping("/promotion")
	public String openPromotion() {
		return "pages/promoPage";
	}
	
	@GetMapping("/shop")
	public String openCategories() {
		return "pages/categoryPage";
	}
}
