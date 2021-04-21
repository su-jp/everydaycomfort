package com.sujin.eComfort.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sujin.eComfort.config.auth.PrincipalDetail;
import com.sujin.eComfort.dto.ResponseDTO;
import com.sujin.eComfort.dto.productSaveRequestDTO;
import com.sujin.eComfort.service.ShopService;

@RestController
public class ShopApiController {
	
	@Autowired
	private ShopService shopService;
	
	@PostMapping("/api/shop/item")
	public ResponseDTO<Integer> addItem(@RequestBody productSaveRequestDTO productSaveRequestDTO,
			@AuthenticationPrincipal PrincipalDetail principal) {
		shopService.addItem(productSaveRequestDTO, principal.getUser());
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/cart/{cartId}")
	public ResponseDTO<Integer> deleteItem(@PathVariable int cartId) {
		shopService.delete(cartId);
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/cart/all")
	public ResponseDTO<Integer> deleteItem(@AuthenticationPrincipal PrincipalDetail principal) {
		shopService.deleteAll(principal.getUser());
		return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
	}
}
