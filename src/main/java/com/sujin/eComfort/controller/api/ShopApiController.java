package com.sujin.eComfort.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sujin.eComfort.config.auth.PrincipalDetail;
import com.sujin.eComfort.dto.ResponseDTO;
import com.sujin.eComfort.dto.OrderRequestDTO;
import com.sujin.eComfort.dto.ProductSaveRequestDTO;
import com.sujin.eComfort.service.ShopService;

@RestController
public class ShopApiController {
	
	@Autowired
	private ShopService shopService;
	
	@PostMapping("/api/shop/item")
	public ResponseDTO<Integer> addItem(@RequestBody ProductSaveRequestDTO productSaveRequestDTO,
			@AuthenticationPrincipal PrincipalDetail principal) {
		shopService.addItem(productSaveRequestDTO, principal.getUser());
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/cart/{cartId}")
	public ResponseDTO<Integer> deleteItem(@PathVariable int cartId) {
		shopService.delete(cartId);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/api/cart/{cartId}")
	public ResponseDTO<Integer> update(@PathVariable int cartId, @RequestBody int request) {
		shopService.update(cartId, request);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/cart/all")
	public ResponseDTO<Integer> deleteItem(@AuthenticationPrincipal PrincipalDetail principal) {
		shopService.deleteAll(principal.getUser());
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("/api/shop/item/{productId}")
	public ResponseDTO<Integer> directPurchase(@RequestBody ProductSaveRequestDTO productSaveRequestDTO,
			@AuthenticationPrincipal PrincipalDetail principal) {
		shopService.addItem(productSaveRequestDTO, principal.getUser());
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("/api/order")
	public ResponseDTO<Integer> makeOrder(@RequestBody OrderRequestDTO orderRequestDTO,
			@AuthenticationPrincipal PrincipalDetail principal) {
		shopService.order(orderRequestDTO, principal.getUser());
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
}
