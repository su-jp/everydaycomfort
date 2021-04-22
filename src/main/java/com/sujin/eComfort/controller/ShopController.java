package com.sujin.eComfort.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sujin.eComfort.config.auth.PrincipalDetail;
import com.sujin.eComfort.controller.api.ShopOpenApiController;
import com.sujin.eComfort.model.Product;
import com.sujin.eComfort.service.ShopService;

@Controller
public class ShopController {
	
	@Autowired
	private ShopOpenApiController shopOpenApiController;
	
	@Autowired
	private ShopService shopService;

	@GetMapping("/shop")
	public String openCategories() {
		return "pages/categoryPage";
	}
	
	@RequestMapping("/shop/detail/{productTitle}")
	public String openDetail(@PathVariable(name = "productTitle") String title, Model model) {
		Product product = shopOpenApiController.callItemDetail(title+"");
		model.addAttribute("product", product);
		return "shopping/detail";
	}
	
	@GetMapping("/user/cart")
	public String openCart(Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("carts", shopService.list(principal.getUser()));
		return "user/purchase/cart";
	}
}
