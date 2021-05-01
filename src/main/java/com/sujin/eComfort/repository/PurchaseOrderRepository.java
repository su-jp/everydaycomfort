package com.sujin.eComfort.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sujin.eComfort.model.PurchaseOrder;

public interface PurchaseOrderRepository extends JpaRepository<PurchaseOrder, Integer> {
	List<PurchaseOrder> findAllByUserId(int userId);
	List<PurchaseOrder> findAllByUserIdOrderByIdDesc(int userId);
}
