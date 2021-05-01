package com.sujin.eComfort.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
	
	@GetMapping("/shop/detail/{productTitle}")
	public String openDetail(@PathVariable String productTitle, Model model) {
		Product product = shopOpenApiController.callItemDetail(productTitle+"");
		model.addAttribute("product", product);
		return "shopping/detail";
	}
	
	@GetMapping("/user/cart")
	public String openCart(Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("carts", shopService.list(principal.getUser()));
		return "user/purchase/cart";
	}

	@GetMapping("/user/orderpage")
	public String openOrderPage(Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("carts", shopService.list(principal.getUser()));
		model.addAttribute("coupons", shopService.callCoupons(principal.getUser()));
		return "user/purchase/order";
	}
	
	@GetMapping("/user/orderpage/{productId}")
	public String openDirectOrderPage(@PathVariable String productId, Model model,
			@AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("carts", shopService.directPurchase(productId));
		return "user/purchase/order";
	}
	
	@GetMapping("/user/orderpage/success")
	public String openOrderSuccess(Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("orderNum", shopService.findLatestOrderNum(principal.getUser()));
		return "user/purchase/orderSuccess";
	}
	
	@GetMapping("/user/orderlist")
	public String openOrderList(Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("orders", shopService.findOrders(principal.getUser()));
		return "user/purchase/orderList";
	}
	
	@GetMapping("/user/orderlist/{id}")
	public String openOrderDetail(@PathVariable int id, Model model) {
		model.addAttribute("details", shopService.callOrderDetails(id));
		model.addAttribute("order", shopService.findOrderByOrderId(id));
		return "user/purchase/orderDetail";
	}

}
