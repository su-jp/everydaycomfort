package com.sujin.eComfort.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class PurchaseOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String orderNum;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;
	
	private int totalAmount;
	
	private String payMethod;
	
	private String payInfo;
	
	private int usedPoint;
	
	private int usedCoupon;
	
	private String orderStatus;
	
	private String deliveryInfo;
	
	@OneToMany(mappedBy = "purchaseOrder", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"purchaseOrder"})
	private List<OrderDetail> orderDetails;
	
	@CreationTimestamp
	private Timestamp payDate;
}
