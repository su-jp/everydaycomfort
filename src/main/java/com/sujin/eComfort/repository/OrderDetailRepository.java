package com.sujin.eComfort.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sujin.eComfort.model.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
	List<OrderDetail> findAllByPurchaseOrderId(int purchaseOrderId);
}
