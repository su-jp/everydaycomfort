package com.sujin.eComfort.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sujin.eComfort.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {
	List<Cart> findAllByUserId(int userId);
	void deleteAllByUserId(int userId);
	List<Cart> findAllByProductId(String productId);
}
