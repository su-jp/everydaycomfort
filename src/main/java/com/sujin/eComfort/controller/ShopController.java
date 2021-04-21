package com.sujin.eComfort.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sujin.eComfort.controller.api.ShopOpenApiController;
import com.sujin.eComfort.model.Product;

@Controller
public class ShopController {
	
	@Autowired
	private ShopOpenApiController shopOpenApiController;
	
	@RequestMapping("/shop/detail/{productTitle}")
	public String openDetail(@PathVariable(name = "productTitle") String title, Model model) {
		Product product = shopOpenApiController.callItemDetail(title+"");
		model.addAttribute("product", product);
		return "shopping/detail";
	}
}
