package com.sujin.eComfort.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sujin.eComfort.controller.api.ShoppingApiController;
import com.sujin.eComfort.model.Product;

@Controller
public class BoardController {
	
	@Autowired
	private ShoppingApiController shoppingApiController;
	
	@GetMapping("/login")
	public String openLoginForm() {
		return "user/loginForm";
	}
	
	@GetMapping("/join")
	public String openJoinForm() {
		return "user/joinForm";
	}
	
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
	
	@RequestMapping("/shop/detail/{productTitle}")
	public String openDetail(@PathVariable(name = "productTitle") String title, Model model) {
		Product product = shoppingApiController.callItemDetail(title+"");
		model.addAttribute("product", product);
		return "shopping/detail";
	}

	@GetMapping("/counsel")
	public String openCounselBoard() {
		return "board/counselList";
	}
	
	@GetMapping("/notice")
	public String openNoticeBoard() {
		return "board/noticeList";
	}
	
	@GetMapping("/qna")
	public String openQnaBoard() {
		return "board/qnaList";
	}
	
	@GetMapping("/inquiry")
	public String openInquiryBoard() {
		return "board/inquiryList";
	}
}
