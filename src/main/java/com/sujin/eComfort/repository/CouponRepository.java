package com.sujin.eComfort.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sujin.eComfort.model.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Integer> {
	List<Coupon> findAllByUserId(int userId);
}
