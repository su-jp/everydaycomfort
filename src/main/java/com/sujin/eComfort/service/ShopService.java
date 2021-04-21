package com.sujin.eComfort.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sujin.eComfort.dto.productSaveRequestDTO;
import com.sujin.eComfort.model.Cart;
import com.sujin.eComfort.model.User;
import com.sujin.eComfort.repository.CartRepository;
import com.sujin.eComfort.repository.UserRepository;

@Service
public class ShopService {
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public void addItem(productSaveRequestDTO productSaveRequestDTO, User requestUser) {
		User user = userRepository.findById(requestUser.getId())
				.orElseThrow(()->{
					return new IllegalArgumentException("상품 담기 실패 : 회원 정보를 찾을 수 없습니다.");
				});
		
		Cart cart = Cart.builder()
				.user(user)
				.productTitle(productSaveRequestDTO.getProductTitle())
				.productImage(productSaveRequestDTO.getProductImage())
				.productPrice(productSaveRequestDTO.getProductLprice())
				.productQuantity(productSaveRequestDTO.getProductQuantity())
				.build();
		cartRepository.save(cart);
	}
	
	@Transactional(readOnly = true)
	public List<Cart> list(User user) {
		return cartRepository.findAllByUserId(user.getId());
	}
	
	@Transactional
	public void delete(int id) {
		cartRepository.deleteById(id);
	}
	
	@Transactional
	public void update(int id, int request) {
		Cart cart = cartRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상품 담기 실패 : 회원 정보를 찾을 수 없습니다.");
				});
		cart.setProductQuantity(cart.getProductQuantity()+request);
	}
	
	@Transactional
	public void deleteAll(User user) {
		cartRepository.deleteAllByUserId(user.getId());
	}
}
